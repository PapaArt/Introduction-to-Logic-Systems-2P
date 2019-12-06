module one_zero_one(clk,rst,in,out);
    input  wire clk,rst,ok,in;
    output reg out;
    parameter entrada = 3'b000,
                 S0 = 3'b001,
                 S1 = 3'b010,
                 S2 = 3'b011,
                 S3 = 3'b100,
              Saida = 3'b101;

    reg count = 0,aux_saida = 0; 

    reg[2:0] estados;
    reg[2:0] proximo_estado;

    always @(rst or in or posedge clk)begin
        if(rst)begin
            estados = entrada;        
        end
        else begin
            case (estados)
                entrada:begin
                    proximo_estado = S0; 
                end

                S0:begin
                    if(in == 1'b1)begin
                        proximo_estado = S1;
                        count = count + 1'b1;
                    end
                    else
                        proximo_estado = S0; 
                end

                S1:begin
                    if(in == 1'b0)begin
                        proximo_estado = S2;
                        count = count + 1'b1;
                    end
                    else
                        proximo_estado = S1;
                end
                
                S2:begin
                    if(in == 1'b1)begin
                        proximo_estado = S3;
                        count = count + 1'b1;
                    end
                    else 
                        proximo_estado = S0;
                end

                S3:begin
                    proximo_estado=Saida;
                end

                Saida:begin
                    if(count == 2'b11)begin
                        aux_saida = 1'b1;
                        count = 0;
                    end
                    else begin
                        aux_saida=1'b0;
                        count =0;
                    end
                end
            endcase
        end
    end

    always @(estados)begin
        case(estados)
            Saida:begin
                out = aux_saida;
            end
        endcase  
    end         
endmodule