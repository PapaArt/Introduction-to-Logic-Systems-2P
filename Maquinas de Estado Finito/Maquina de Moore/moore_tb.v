`include "moore.v"
`timescale 1ns/100ps
module seqdetect_tb();
reg in,rst,clk;
wire out;
seqdetect UUT (in,out,rst,clk);
initial begin
clk = 0;#10 
forever #20 clk = ~clk; 
end

initial begin
	#20 rst = 1'b1;
	#20 rst = 1'b0; 
	#20 in = 1'b1; 
	#20 in = 1'b1; 
	#20 in = 1'b1; 
	#20 in = 1'b0; 
	#20 in = 1'b0; 
	#20 in = 1'b1; 
	#1000;
end
endmodule