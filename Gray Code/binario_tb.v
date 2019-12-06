//CODIGO GRAY
`include "binario.v"

module binario_tb;
reg  [3:0]binario_tb;
wire [3:0]gray_tb;
integer i;

binario instancia(binario_tb,gray_tb);
initial
begin 
    $display("binario | gray",binario_tb,gray_tb);
    for (i=0;i<16;i=i+1)
    begin
    binario_tb=i;#1
        $display("%b %b",binario_tb,gray_tb);
    end    
end
endmodule
