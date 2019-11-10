/*Trabalho Maquina de Estado Finito-Módulo Adjetivo e Advérbio*/

modulo tp(clk,reset,ok,tom,nota,fim,tipo,display);
    input ok, tom, reset, clk;
	input [2:0] nota;
	output reg fim;
	output reg [1:0] tipo;
	output [6:0] display;
    Alfa(Tom, notas1, notas2, notas3, saida1, saida2, saida3, saida4, saida5, saida6, saida7);

	def[4:0]     		    estado_inicial   = 5'b00000,
							estado_nota1     = 5'b00001,
							estado_nota2_op1 = 5'b00010,
							estado_nota2_op2 = 5'b00011,
							estado_nota2_op3 = 5'b00100,
							estado_nota3_op1 = 5'b00101,
							estado_nota3_op2 = 5'b00110,
							estado_nota3_op3 = 5'b00111,
							estado_nota4_op1 = 5'b01000,
							estado_nota4_op2 = 5'b01001,
							estado_nota4_op3 = 5'b01010,
							estado_nota5_op1 = 5'b01011,
							estado_nota5_op2 = 5'b01100,
							estado_nota5_op3 = 5'b01101,
							estado_final_op1 = 5'b01110,
							estado_final_op2 = 5'b01111,
							estado_final_op3 = 5'b10000,
							estado_erro      = 5'b10001;
    