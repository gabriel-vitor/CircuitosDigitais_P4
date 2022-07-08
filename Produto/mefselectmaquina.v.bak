module mefselectmaquina(x, y, clk,rst);
	input [0:2] x;
	input clk, rst;
	output [0:3] y;

	parameter [0:3] menu = 4'b0000, ms = 4'b0001, ml = 4'b0111,
						 s0 = 4'b0010, s1 = 4'b0011, s2 = 4'b0100, s3 = 4'b0101, 
						 l0 = 4'b1000, l1 = 4'b1001, l2 = 4'b1010, l3 = 4'b1011,
						 sc = 4'b0110, lc = 4'b1100;
						 
	reg [0:3] state, nextstate;


	always @(posedge clk)
		if(rst)begin 
			state <= menu;
		end
		else begin 
			state <= nextstate;
			end 


	always @(*)
		case(state)
			menu: if(x[2] == 0 & x[1] == 0) nextstate = ms;
					else if(x[1] == 1 & x[2] == 1) nextstate = ml;
					else nextstate = menu;
			
			ms: if(x[1] == 0) nextstate = s0;
				 else if(x[2] == 1) nextstate = ml;
				 else nextstate = ms;
			
			s0: if(x[0] == 1) nextstate = s1;
				 else nextstate = s0;
			
			s1: if(x[0] == 1) nextstate = s2;
				 else nextstate = s1;
			
			s2: if(x[0] == 1) nextstate = s3;
				 else nextstate = s2;
			
			s3: if(x[0] == 1) nextstate = sc;
				 else nextstate = s3;
				 
			sc: if(x[2] == 0) nextstate = menu;
				 else nextstate = sc;
		
			
			ml: if(x[1] == 0) nextstate = l0;
				 else if(x[1] == 1 & x[2] == 0) nextstate = ms;
				 else nextstate = ml;
			
			l0: if(x[0] == 1) nextstate = l1;
				 else nextstate = l0;
			
			l1: if(x[0] == 1) nextstate = l2;
				 else nextstate = l1;
				 
			l2: if(x[0] == 1) nextstate = l3;
				 else nextstate = l2;
			
			l3: if(x[0] == 1) nextstate = lc;
				 else nextstate = l3;
				 
			lc: if(x[2] == 1) nextstate = menu;
				 else nextstate = lc;
			
			default nextstate = menu;

	
		endcase
		
		assign y = state; 
		

	

endmodule 