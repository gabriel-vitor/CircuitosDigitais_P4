module MEFdebouncer(x, y, clk, rst);
	input x;
	input clk, rst;
	output y;
	
	reg [0:1] state, nextstate;
	parameter [0:1] inicial = 2'b00, s0 = 2'b01, s1 = 2'b10, s2 = 2'b11;
	
	
	always @(posedge clk)
		if(rst) state <= inicial;
		else state <= nextstate;
		
		
	always @(*)
		case(state)
		
			inicial: 
				if(x == 1) nextstate = inicial;
				else nextstate = s0;
			s0:
				if(x == 1) nextstate = s0;
				else nextstate = s1;
			s1:
				if(x == 1) nextstate = s1;
				else nextstate = s2;
			s2:
				if(x == 1) nextstate = s2;
				else nextstate = inicial;
		endcase
		
		assign y = ~(state == s2);
		
endmodule 
	
	