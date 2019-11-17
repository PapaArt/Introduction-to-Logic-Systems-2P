module odd(clk,rst,in,out);
    input wire clk,rst,in;
    output reg out; 
    reg count = 0;     
    parameter Q0 = 2'b00,
              Q1 = 2'b01,
              Q2 = 2'b10;

    reg[1:0] states;
    reg[1:0] next_state;

    always@(posedge clk or rst or in)begin
        if(rst)begin
            states = Q0;
        end
        else begin
            case(states)
                Q0:begin
                    if(in == 1'b1 && count %3 == 0)begin
                        out = 1'b1;
                        next_state = Q1;
                        count = count + 1'b1;
                    end

                    else if(in == 1'b1 && count %3 != 0)begin
                        out = 1'b0;
                        next_state = Q1;
                        count = count + 1'b1;
                    end

                    else if(in == 1'b0 && count %3 == 0)begin
                        out = 1'b1;
                        next_state = Q0;
                    end

                    else if(in == 1'b0 && count %3 != 0)begin
                        out = 1'b0;
                        next_state = Q0;
                    end
                end

                Q1:begin
                    if(in == 1'b1 && count %3 == 0)begin
                        out = 1'b1;
                        next_state = Q2;
                        count = count + 1'b1;
                    end

                    else if(in == 1'b1 && count %3 != 0)begin
                        out = 1'b0;
                        next_state = Q2;
                        count = count + 1'b1;
                    end

                    else if(in == 1'b0 && count %3 == 0)begin
                        out = 1'b1;
                        next_state = Q1;
                    end

                    else if(in == 1'b0 && count %3 != 0)begin
                        out = 1'b0;
                        next_state = Q1;
                    end
                end

                Q2:begin
                    if(in == 1'b1 && count %3 == 0)begin
                        out = 1'b1;
                        next_state = Q0;
                        count = count + 1'b1;
                    end

                    else if(in == 1'b1 && count %3 != 0)begin
                        out = 1'b0;
                        next_state = Q0;
                        count = count + 1'b1;
                    end

                    else if(in == 1'b0 && count %3 == 0)begin
                        out = 1'b1;
                        next_state = Q2;
                    end

                    else if(in == 1'b1 && count %3 != 0)begin
                        out = 1'b0;
                        next_state = Q2;
                    end
                end
            endcase
        end
    end
endmodule