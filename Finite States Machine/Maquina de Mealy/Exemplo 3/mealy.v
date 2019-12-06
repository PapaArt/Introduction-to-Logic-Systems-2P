module even_over_zero(clk,rst,in);
    input wire clk,rst,in;
    reg [2:0]state;
    reg [2:0]next_state;

    parameter   S0 = 3'b000,
                S1 = 3'b001,
                S2 = 3'b010, 
                S3 = 3'b011,
                S4 = 3'b100;

    always @(posedge clk or rst or in) begin
        if(rst)begin
            state = S0;
        end
        else begin
            case(state)
                S0:begin
                    if(in == 1'b0)
                        next_state = S1;
                    else
                        next_state = S0;        
                end

                S1:begin
                    if(in == 1'b0)
                        next_state = S2;
                    else
                        next_state = S0; 
                end

                S2:begin
                    if(in == 1'b1)
                        next_state = S3;
                    else
                        next_state = S2; 
                end

                S3:begin
                    if(in == 1'b1)
                        next_state = S4;
                    else
                        next_state = S3; 
                end

                S4:begin
                    if(in == 1'b1)
                        next_state = S3;
                    else
                        next_state = S4; 
                end 
            endcase
        end
    end
endmodule