/*Trabalho Maquina de Estado Finito-Módulo Adjetivo e Advérbio*/

modulo tp(clk,reset,ok,tom,nota,fim,tipo,display);
    input ok, tom, reset, clk;
	input [2:0] nota;
	output reg fim;
	output reg [1:0] tipo;
	output [6:0] display;
    Alfa(Tom, notas1, notas2, notas3, saida1, saida2, saida3, saida4, saida5, saida6, saida7);