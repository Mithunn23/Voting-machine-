module buttonControl(

input clock, input reset, input button, output reg valid_vote );

reg [30:0] counter;

always @(posedge clock) begin if(reset) counter <= 0; else begin if(button && counter < 100000001) counter <= counter + 1: else if(!button) end end counter <= 0;

always @(posedge clock) begin

if(reset) valid_vote <= 1'b0; else valid_vote <= (counter == 100000000); end

endmodule
