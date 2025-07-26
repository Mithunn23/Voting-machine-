module modeControl(

input clock,

input reset,

input mode,

input valid_vote_casted,

input [7:0] candidatel_vote,

input [7:0] candidate2_vote,

input [7:0] candidate3_vote,

input [7:0] candidate4_vote,

input candidatel_button_press,

input candidate2_button_press,

input candidate3_button_press,

input candidate4_button_press,

output reg [7:0] LEDs );

reg [30:0] counter;

always @(posedge clock) begin

if(reset)

counter <= 0;

else if(valid_vote_casted)

counter <= counter + 1;

else if(counter != 0 && counter < 100000000)

counter <= counter + 1;

else counter <= 0; end

always @(posedge clock) begin

if(reset)

LEDs <= ();

else begin

if(mode == 0 && counter > 0)

LEDs <= 8'hFF; // Blink to show vote registered

else if(mode == 0)

LEDs <= 8'h00;

else if(mode == 1) begin

if(candidatel_button_press)

LEDs <= candidatel_vote:

else if (candidate2_button_press)

LEDs <= candidate2_vote;

else if(candidate3_button_press)

LEDs <= candidate3_vote;

else if(candidate4_button_press)

LEDs <= candidate4_vote;

end

end

end

endmodule
