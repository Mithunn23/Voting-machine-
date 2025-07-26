module voteLogger(

input clock, input reset,

input candidate1_vote_valid,

input candidate2_vote_valid,

input candidate3_vote_valid,

input candidate4_vote_valid,

output reg [7:0] candidate1_vote_count,

output reg [7:0] candidate2_vote_count,

output reg [7:0] candidate3_vote_count,

output reg [7:0] candidate4_vote_count);

always @(posedge clock) begin

if(reset) begin

candidate1_vote_count <= 0;

candidate2_vote_count <= 0;

candidate3_vote_count <= 0;

candidate4_vote_count <= 0;

end else begin

if(candidate1_vote_valid)

candidate1_vote_count <= candidate1_vote_count + 1;

else if(candidate2_vote_valid)

candidate2_vote_count <= candidate2_vote_count + 1;

else if(candidate3_vote_valid)

candidate3_vote_count <= candidate3_vote_count + 1;

else if(candidate4_vote_valid)

candidate4_vote_count <= candidate4_vote_count + 1;

end

end

endmodule
