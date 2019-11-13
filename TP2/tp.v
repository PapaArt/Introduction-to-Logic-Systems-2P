/*Trabalho Maquina de Estado Finito-Módulo Adjetivo e Advérbio*/
module tp(clk,reset,ok,tom,nota,fim,tipo,display);
    input ok, tom, reset, clk;
	input [2:0] nota;
	output reg fim;
	output reg [1:0] tipo;
	output [6:0] display;

	localparam[3:0]			estado_inicial    = 4'b0000,
	                        estado_nota1      = 4'b0001,
	                        estado_nota2      = 4'b0010, 
 	                        estado_nota3_la   = 4'b0011,
	                        estado_nota3_si   = 4'b0100,
							estado_adj	      = 4'b0101,
							estado_nota4_do   = 4'b0110,
							estado_nota4_si   = 4'b0111,
							estado_nota4_re   = 4'b1000,
							estado_comp       = 4'b1001,
							estado_adv        = 4'b1010,
							estado_erro	  	  = 4'b1011;		

							 				
										
    
	localparam[3:0]                   nota_x1 = 4'b0000,
									      do  = 4'b0001, 
									      re  =	4'b0010,		
									      mi  =	4'b0011,
									      fa  = 4'b0100,
									      sol = 4'b0101,
									      la  = 4'b0110,
									      si  = 4'b0111,
									  nota_x2 = 4'b1000,  
										 do_m = 4'b1001,
										 re_m = 4'b1010,
									     mi_m = 4'b1011,
										 fa_m = 4'b1100,
									    sol_m = 4'b1101,
										 la_m = 4'b1110,
										 si_m = 4'b1111;


	localparam[1:0]                 tipo_nulo = 2'b00,
								    tipo_adj  = 2'b01,
 								    tipo_comp = 2'b10,
								    tipo_adv  = 2'b11;

	localparam                    finalizado = 1'b1,
							     em_processo = 1'b0;
	
	reg[3:0] estados, proximo_estado;

	always @(posedge clk) begin
		if(reset)
			estados = estado_inicial;
		else
			estados = proximo_estado;
	end
	
	always @(posedge ok) begin
		case(estados)
			estado_inicial:begin
				if(nota == nota_x1 && nota == nota_x2)
					estados = estado_nota1;
				else
					estados = estado_erro;						
			end

			estado_nota1:begin
				if(nota == nota_x1 && nota == nota_x2) 
					estados = estado_nota2;	
				else
					estados = estado_erro;
			end

			estado_nota2:begin
				if(~tom && nota == la)
					estados = estado_nota3_la;
				else if(~tom && nota == si)
					estados = estado_nota3_si;
				else
					estados = estado_erro;
			end

			estado_nota3_la:begin
				if(nota == nota_x1 && nota == nota_x2)
					estados = estado_adj;
				else if(tom && nota == do)
					estados = estado_nota4_do;
				else if(~tom && nota ==si)
					estados = estado_nota4_si;			
				else
					estados = estado_erro; 
			end

			estado_nota3_si:begin
				if(nota == nota_x1 && nota == nota_x2)
					estados = estado_adj;
				else if(tom && nota == re)
					estados = estado_nota4_re;
				else
					estados = estado_erro;
			end	

			estado_adj:begin
						
			end
			
			estado_nota4_do: begin
				estados = estado_comp; 
			end

			estado_nota4_si: begin
				estados = estado_adv;
			end
			
			estado_nota4_re: begin
				estados = estado_comp;
			end
			
			estado_comp: begin
						
			end
			
			estado_adv: begin
						
			end

			default: estados = estado_inicial;
	
		endcase
	end

	always @ (estados)begin
		case(estados)
			estado_erro:begin
				fim = finalizado;
				tipo = tipo_nulo; 
			end

			estado_adj:begin
				fim = finalizado;
				tipo = tipo_adj;
			end

			estado_comp:begin
				fim = finalizado;
				tipo = tipo_comp;
			end

			estado_adv:begin
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