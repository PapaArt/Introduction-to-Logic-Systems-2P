`include "Alfa_desc.v"

module Alfa_sim();
    reg tom;
    reg  notas1, notas2, notas3;
    wire saida1, saida2, saida3, saida4, saida5, saida6, saida7;

    Alfa_desc sim_instancia(.Tom(tom), .notas1(notas1), .notas2(notas2), .notas3(notas3), .saida1(saida1), .saida2(saida2), .saida3(saida3), .saida4(saida4), .saida5(saida5), .saida6(saida6), .saida7(saida7));

    initial begin
        $dumpfile("onda.vcd");
        $dumpvars(0, Alfa_sim);
        $monitor("%b%b%b%b saida = %b%b%b%b%b%b%b", tom, notas1, notas2, notas3, saida1, saida2, saida3, saida4, saida5, saida6, saida7);
    end

    initial begin
            tom = 1'b0;
            notas1 = 1'b0;
            notas2 = 1'b0;
            notas3 = 1'b0;
            #2  tom = 1'b0; notas1 = 1'b0;  notas2 = 1'b0; notas3 = 1'b0;
            #2  tom = 1'b0; notas1 = 1'b0;  notas2 = 1'b0; notas3 = 1'b1;
            #2  tom = 1'b0; notas1 = 1'b0;  notas2 = 1'b1; notas3 = 1'b0;
            #2  tom = 1'b0; notas1 = 1'b0;  notas2 = 1'b1; notas3 = 1'b1;
            #2  tom = 1'b0; notas1 = 1'b1;  notas2 = 1'b0; notas3 = 1'b0;
            #2  tom = 1'b0; notas1 = 1'b1;  notas2 = 1'b0; notas3 = 1'b1;
            #2  tom = 1'b0; notas1 = 1'b1;  notas2 = 1'b1; notas3 = 1'b0;
            #2  tom = 1'b0; notas1 = 1'b1;  notas2 = 1'b1; notas3 = 1'b1;
            #2  tom = 1'b1; notas1 = 1'b0;  notas2 = 1'b0; notas3 = 1'b0;
            #2  tom = 1'b1; notas1 = 1'b0;  notas2 = 1'b0; notas3 = 1'b1;
            #2  tom = 1'b1; notas1 = 1'b0;  notas2 = 1'b1; notas3 = 1'b0;
            #2  tom = 1'b1; notas1 = 1'b0;  notas2 = 1'b1; notas3 = 1'b1;
            #2  tom = 1'b1; notas1 = 1'b1;  notas2 = 1'b0; notas3 = 1'b0;
            #2  tom = 1'b1; notas1 = 1'b1;  notas2 = 1'b0; notas3 = 1'b1;
            #2  tom = 1'b1; notas1 = 1'b1;  notas2 = 1'b1; notas3 = 1'b0;
            #2  tom = 1'b1; notas1 = 1'b1;  notas2 = 1'b1; notas3 = 1'b1;
        $finish;
    end
endmodule
