module odd_even(clk,rst,in,fim_impar,fim_par);
    input wire clk,rst,in;
    output reg fim_par,fim_impar;
    parameter  par = 1'b0,
              impar =1'b1;

    reg estados;
    reg proximo_estado;
    reg cont_impar = 0,cont_par = 0;

    always @(rst  or in or posedge clk) begin
        if(rst)begin
           estados = par; 
        end
        else begin
            case(estados)
                par:begin
                    if(in == 1'b1)begin
                        proximo_estado=impar;
                        cont_impar = cont_impar + 1'b1;
                    end  
                    else
                        proximo_estado=impar;
                end
                impar:begin
                    if(in == 1'b1)begin
                        proximo_estado=impar;
                        cont_par = cont_par + 1'b1;
                    end
                    else
                        proximo_estado=impar;
                end
            endcase 
        end
    end

    always @(estados)begin
        case (estados)
            fim_par:begin
                fim_par=cont_par;
            end
            fim_impar:begin
                fim_impar= cont_impar;
            end  
        endcase
    end
endmodule