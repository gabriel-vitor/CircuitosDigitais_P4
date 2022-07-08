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
		if(rst == 0)begin 
			state <= menu;
		end
		else begin 
			state <= nextstate;
			end 


	always @(*)
		case(state)
			menu: if(x[0] == 0 & x[1] == 0) begin nextstate = ms; end
					else if(x[0] == 1 & x[1] == 0) begin nextstate = ml; end
					else begin nextstate = menu; end
			
			ms: if(x[1] == 0) begin nextstate = s0; end
				 else if(x[0] == 1 & x[1] == 1) begin nextstate = ml; end
				 else begin nextstate = ms; end
			
			s0: if(x[2] == 1) begin nextstate = s1; end
				 else begin nextstate = s0; end
			
			s1: if(x[2] == 1) begin nextstate = s2; end
				 else begin nextstate = s1; end
			
			s2: if(x[2] == 1) begin nextstate = s3; end
				 else begin nextstate = s2; end
			
			s3: if(x[2] == 1) begin nextstate = sc; end
				 else begin nextstate = s3; end
				 
			sc: if(x[1] == 0) begin nextstate = menu; end
				 else begin nextstate = sc; end
		
			
			ml: if(x[1] == 0) begin nextstate = l0; end
				 else if(x[1] == 1 & x[0] == 0) begin nextstate = ms; end
				 else begin nextstate = ml; end 
			
			l0: if(x[2] == 1) begin nextstate = l1; end
				 else begin nextstate = l0; end
			
			l1: if(x[2] == 1) begin nextstate = l2; end
				 else begin nextstate = l1; end
				 
			l2: if(x[2] == 1) begin nextstate = l3; end
				 else begin nextstate = l2; end
			
			l3: if(x[2] == 1) begin nextstate = lc; end
				 else begin nextstate = l3; end
				 
			lc: if(x[1] == 0) begin nextstate = menu; end
				 else begin nextstate = lc; end
			
			default nextstate = menu;

	
		endcase
		
		assign y = state; 
		

	

endmodule 