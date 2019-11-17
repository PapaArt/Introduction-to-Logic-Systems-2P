module par(clk,rst,in,out);
    input wire clk,rst,in;
    output reg out;
    reg count = 0;

    parameter  S0 = 3'b000,
               S1 = 3'b001,
               S2 = 3'b010,
               S3 = 3'b011,
              odd = 3'b100,
             even = 3'b101,
            error = 3'b110;

    reg [2:0] states;
    reg [2:0] next_state;

    always @(posedge clk or rst or in) begin
        if(rst)begin
            states = S0;
        end 
        else begin
            case (states)
                S0:begin
                    if(in == 1'b0)begin
                         count = count + 1'b1;
                         next_state = odd;
                    end
                    else
                        next_state = S1;
                end 
                
                S1:begin
                    if(in == 1'b0) begin
                         count = count + 1'b1;
                         next_state = odd;
                    end
                    else
                        next_state = error;
                end
            
                S2:begin
                    if(in == 1'b0)begin
                        count = count + 1'b1;
                        next_state = even ;
                    end
                    else
                        next_state = error;
                end

                S3:begin
                    if(in == 1'b0)begin
                        count = count + 1'b1;
                        next_state = odd;
                    end
                    else 
                        next_state = error;
                end

                odd:begin
                    if(in == 1'b0)begin
                        count = count + 1'b1;
                        next_state = even ;
                    end 
                    else
                        next_state = S2;   
                end

                even:begin
                    next_state = S3;    
                end

                error:begin
                    next_state = error;
                end    
            endcase
        end
    end

    always@(states)begin
        out = count;
    end
endmodule  