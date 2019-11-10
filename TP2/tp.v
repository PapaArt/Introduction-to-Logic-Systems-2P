/*Trabalho Maquina de Estado Finito-Módulo Adjetivo e Advérbio*/

module tp(clk,reset,ok,tom,nota,fim,tipo,display);
    input ok, tom, reset, clk;
	input [2:0] nota;
	output reg fim;
	output reg [1:0] tipo;
	output [6:0] display;

    Alfa_desc Adverbio(Tom, notas1, notas2, notas3, saida1, saida2, saida3, saida4, saida5, saida6, saida7);

    def[4:0]     		    estado_inicial    = 5'b00000,
							estado_nota1      = 5'b00001,
							estado_nota2_adj  = 5'b00010,
							estado_nota2_comp = 5'b00011,
							estado_nota2_adv  = 5'b00100,
							estado_nota3_adj  = 5'b00101,
							estado_nota3_comp = 5'b00110,
							estado_nota3_adv  = 5'b00111,
							estado_nota4_adj  = 5'b01000,
							estado_nota4_comp = 5'b01001,
							estado_nota4_adv  = 5'b01010,
							estado_nota5_adj  = 5'b01011,
							estado_nota5_comp = 5'b01100,
							estado_nota5_adv  = 5'b01101,
							estado_final_adj  = 5'b01110,
							estado_final_comp = 5'b01111,
							estado_final_adv  = 5'b10000,
							estado_erro       = 5'b10001;
    
	def[2:0]                        nota_erro = 3'b000,
									      do  = 3'b001, 
									      re  =	3'b010,		
									      mi  =	3'b011,
									      fa  = 3'b100,
									      sol = 3'b101,
									      la  = 3'b110,
									      si  = 3'b111;

	def[1:0]                       tipo_nulo = 2'b00,
								    tipo_adj = 2'b01,
 								    tipo_comp= 2'b10,
								    tipo_adv = 2'b11;

	def                               final  = 1'b1;
							     em_processo = 1'b0;
	
	reg[4:0]estados=estado_inicial;

	always @(posedge clk) begin
		if(reset)
			estatos=estado_inicial;
		else if(ok) begin
			case(estados)
				
			endcase
		end
	end	
endmodule