module one_zero_one(clk,rst,in,out);
    input  wire clk,rst,ok,in,out;
    parameter Input = 3'b000,
                 S0 = 3'b001,
                 S1 = 3'b010,
                 S2 = 3'b011,
                 S3 = 3'b100,
              Saida = 3'b101;
    reg[2:0] estados;
    reg[2:0] proximo_estado;

    always @(rst or in or posedge clk)begin
        if(rst)begin
            estados = Input;        
        end
    end
    else begin
        case (estados)
            Input:begin
                proximo_estado = S0; 
            end

            S0:begin
                if(in == 1'b1)
                    proximo_estado = S1;
                else
                    proximo_estado = S0; 
            end

            S1:begin
                if(in == 1'b0)
                    proximo_estado = S2;
                else
                    proximo_estado = S1;
            end
            
            S2:begin
               if(in == 1'b1)
                    proximo_estado = S3;
               else 
                    proximo_estado = S0;
            end

            S3:begin
                proximo_estado=Saida;
            end

            Saida:begin
                
            end

            default: Input; 
        endcase
    end
    always @(estados) begin
        
    end         
endmodule