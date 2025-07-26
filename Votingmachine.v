module votingMachine(
    input clock,
    input reset,
    input mode,
    input fingerprint_valid,  // From Arduino
    input button1,
    input button2,
    input button3,
    input button4,
    output [7:0] LED
);

wire valid_vote_1, valid_vote_2, valid_vote_3, valid_vote_4;
wire [7:0] candidate1_vote_count;
wire [7:0] candidate2_vote_count;
wire [7:0] candidate3_vote_count;
wire [7:0] candidate4_vote_count;
wire any_valid_vote;

// Vote only allowed after fingerprint verification
assign any_valid_vote = fingerprint_valid & (valid_vote_1 | valid_vote_2 | valid_vote_3 | valid_vote_4);

buttonControl bc1(
    .clock(clock),
    .reset(reset),
    .button(button1),
    .valid_vote(valid_vote_1)
);

buttonControl bc2(
    .clock(clock),
    .reset(reset),
    .button(button2),
    .valid_vote(valid_vote_2)
);

buttonControl bc3(
    .clock(clock),
    .reset(reset),
    .button(button3),
    .valid_vote(valid_vote_3)
);

buttonControl bc4(
    .clock(clock),
    .reset(reset),
    .button(button4),
    .valid_vote(valid_vote_4)
);

voteLogger VL(
    .clock(clock),
    .reset(reset),
    .candidate1_vote_valid(valid_vote_1),
    .candidate2_vote_valid(valid_vote_2),
    .candidate3_vote_valid(valid_vote_3),
    .candidate4_vote_valid(valid_vote_4),
    .candidate1_vote_count(candidate1_vote_count),
    .candidate2_vote_count(candidate2_vote_count),
    .candidate3_vote_count(candidate3_vote_count),
    .candidate4_vote_count(candidate4_vote_count)
);

modeControl mc(
    .clock(clock),
    .reset(reset),
    .mode(mode),
    .valid_vote_casted(any_valid_vote),
    .candidate1_vote(candidate1_vote_count),
    .candidate2_vote(candidate2_vote_count),
    .candidate3_vote(candidate3_vote_count),
    .candidate4_vote(candidate4_vote_count),
    .candidate1_button_press(valid_vote_1),
    .candidate2_button_press(valid_vote_2),
    .candidate3_button_press(valid_vote_3),
    .candidate4_button_press(valid_vote_4),
    .LEDs(LED)
);

endmodule
