/*Trabalho Maquina de Estado Finito-Módulo Adjetivo e Advérbio*/
`include "Alfa_desc.v"
module tp(clk,reset,ok,tom,nota,fim,tipo,display);
    input ok, tom, reset, clk;
	input [2:0] nota;
	output reg fim;
	output reg [1:0] tipo;
	output [6:0] display;

    Alfa_desc Adverbio(Tom, notas1, notas2, notas3, saida1, saida2, saida3, saida4, saida5, saida6, saida7);
	
	initial begin
		$dumpfile("onda.vcd");
        $dumpvars(0, tp);
        $monitor("%b%b%b%b saida = %b%b%b%b%b%b%b", tom, notas1, notas2, notas3, saida1, saida2, saida3, saida4, saida5, saida6, saida7);	
	end

	localparam[4:0]			estado_inicial    = 4'b00000,
	                        estado_nota1      = 4'b00001,
	                        estado_nota2_adj  = 4'b00010, 
 	                        estado_nota2_comp = 4'b00011,
	                        estado_nota2_adv  = 4'b00100,
							estado_nota3_adj  = 4'b00101,
							estado_nota3_comp = 4'b00110,
							estado_nota3_adv  = 4'b00111,
							estado_nota4_adj  = 4'b01000,
							estado_nota4_comp = 4'b01001,
							estado_nota4_adv  = 4'b01010,
							estado_nota5_adj  = 4'b01011,
							estado_nota5_comp = 4'b01100,
							estado_nota5_adv  = 4'b01101,
							estado_final_adj  = 4'b01110,
							estado_final_comp = 4'b01111,
							estado_final_adv  = 4'b10000,
							estado_erro       = 4'b10001;				
										
    
	localparam[2:0]                       nota_x =2'b000,
									      do  = 2'b001, 
									      re  =	2'b010,		
									      mi  =	2'b011,
									      fa  = 2'b100,
									      sol = 2'b101,
									      la  = 2'b110,
									      si  = 2'b111;

	localparam[1:0]                tipo_nulo = 2'b00,
								    tipo_adj = 2'b01,
 								    tipo_comp= 2'b10,
								    tipo_adv = 2'b11;

	localparam                    finalizado = 1'b1,
							     em_processo = 1'b0;
	
	reg[4:0]estados=estado_inicial;

	always @(posedge clk) begin
		if(reset)
			estados=estado_inicial;
		else if(ok) begin
			case(estados)
					estado_inicial:begin
						if(nota!=nota_x)
							estados=estado_nota1;
						else
							estados=estado_erro;						
					end

					estado_nota1:begin
						if(nota!=nota_x)
							estados=estado_nota2_adj;
						else if(nota!=nota_x)
							estados=estado_nota2_comp;
						else if(nota!=nota_x)
							estados=estado_nota2_adv;	
						else
							estados=estado_erro;
					end

					estado_nota2_adj:begin
						if(nota!=nota_x)
							estados = estado_nota3_adj;
						else
							estados=estado_erro;
					end

					estado_nota2_comp:begin
						if(nota!=nota_x)
							estados = estado_nota3_comp;
						else
							estados=estado_erro;
					end

					estado_nota2_adv:begin
						if(nota!=nota_x)
							estados = estado_nota3_adv;
						else
							estados=estado_erro;
					end

					estado_nota3_adj:begin
						if(nota!=nota_x)
							estados = estado_nota4_adj;
						else
							estados=estado_erro;
					end

					estado_nota3_comp:begin
						if((~tom && nota == la) || (~tom && nota == si) )
					end
							estados = estado_nota4_comp;
						else
							estados=estado_erro;

					estado_nota3_adv:begin
						if(~tom && nota == la)
							estados = estado_nota4_adv;
						else
							estados=estado_erro;
					end

					estado_nota4_adj: begin
						if((~tom && nota == la) || (~tom && nota == si))
							estados = estado_nota5_adj;
						else
							estados=estado_erro;
					end

					estado_nota4_comp:begin
						if((tom&& nota == do ) ||(tom&& nota == re))
							estados =estado_nota5_comp;
						else
							estados=estado_erro;
					end

					estado_nota4_adv:begin
						if(~tom && nota == si)
							estados=estado_nota5_adv;
						else
							estados=estado_erro;
					end	

					estado_nota5_adj: begin
						if(nota == nota_x)
							estados = estado_final_adj;
						else
							estados=estado_erro;
					end

					estado_nota5_comp:begin
						if(nota == nota_x)
							estados =estado_final_comp;
						else
							estados=estado_erro;
					end

					estado_nota5_adv:begin
						if(nota == nota_x)
							estados=estado_final_adv;
						else
							estados=estado_erro;
					end	

					estado_final_adj:begin
						
					end

					estado_final_comp:begin
						
					end

						
					end
					estado_final_adv:begin

					default: estados = estado_inicial;
			endcase
		end
	end

	always @ (estados)begin
		case(estados)
			estado_erro:begin
				fim = finalizado;
				tipo = tipo_nulo; 
			end

			estado_final_adj:begin
				fim = finalizado;
				tipo = tipo_adj;
			end

			estado_final_comp:begin
				fim = finalizado;
				tipo = tipo_comp;
			end

			estado_final_adv:begin
				fim = finalizado;
				tipo = tipo_adv;
			end

			default:begin
				fim=em_processo;
				tipo=tipo_nulo;
			end
		endcase
	end	
endmodule		