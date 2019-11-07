//CODIGO GRAY
module binario(binario,gray);

input      [3:0]binario;
output reg [3:0]gray;

always@(*)
begin
    gray[3]=binario[3];
    gray[2]=binario[3] ^ binario[2];
    gray[1]=binario[2] ^ binario[1];
    gray[0]=binario[1] ^ binario[0];
end
endmodule
