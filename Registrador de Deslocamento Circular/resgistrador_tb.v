module registrador_tb ();
reg clk, rst; 
reg[7:0] x_q;
reg[7:0] x_d;
reg[4:0] q_cnt;

integer k, i;
integer out; 
//clock
initial 
begin
    clk = 0;
   forever #10 clk = ~clk;
end
//reset
initial begin 
    rst = 0;
    # 50 rst = 1;
end