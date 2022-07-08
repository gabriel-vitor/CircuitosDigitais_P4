module mefselectlavagem(x, y, clk, rst);
	input [0:3] x;
	input clk, rst;
	output [0:2] y;
	
	parameter [0:2] menu = 3'b000,
						 secagem = 3'b001,
						 economica = 3'b010, normal = 3'b011, pesada = 3'b100,
						 erro1 = 3'b101, erro2 = 3'b110;
	
	reg [0:2] state, nextstate;
	
	always @(posedge clk)
		if(rst == 0) state <= menu;
		else state <= nextstate;
	
	always @(*)
		case(state)
			menu: 
				if(x[2] == 0 & x[1] == 0 & x[0] == 0) begin nextstate = menu; end
				else if(x[2] == 0 & x[1] == 0 & x[0] == 1) begin nextstate = secagem; end
				else if(x[2] == 0 & x[1] == 1 & x[0] == 0) begin nextstate = economica; end
				else if(x[2] == 0 & x[1] == 1 & x[0] == 1) begin nextstate = normal; end
				else if(x[2] == 1 & x[1] == 0 & x[0] == 0) begin nextstate = pesada; end
				else nextstate = erro1;
		
			secagem:
				if(x[3] == 1 & x[2] == 0 & x[1] == 0 & x[0] == 1) begin nextstate = secagem; end
				else if(x[3] == 1 & x[2] == 0 & x[1] == 0 & x[0] == 0) begin nextstate = menu; end
				else if(x[3] == 1 & x[2] == 0 & x[1] == 1 & x[0] == 0) begin nextstate = economica; end
				else if(x[3] == 1 & x[2] == 0 & x[1] == 1 & x[0] == 1) begin nextstate = normal; end
				else if(x[3] == 1 & x[2] == 1 & x[1] == 0 & x[0] == 0) begin nextstate = pesada; end
				else nextstate = erro2;
				
			economica:
				if(x[3] == 1 & x[2] == 0 & x[1] == 1 & x[0] == 0) begin  nextstate = economica; end
				else if(x[3] == 1 & x[2] == 0 & x[1] == 0 & x[0] == 0) begin nextstate = menu; end
				else if(x[3] == 1 & x[2] == 0 & x[1] == 0 & x[0] == 1) begin nextstate = secagem; end
				else if(x[3] == 1 & x[2] == 0 & x[1] == 1 & x[0] == 1) begin nextstate = normal; end
				else if(x[3] == 1 & x[2] == 1 & x[1] == 0 & x[0] == 0) begin nextstate = pesada; end
				else nextstate = erro2;
				
			normal:
				if(x[3] == 1 & x[2] == 0 & x[1] == 1 & x[0] == 1) begin nextstate = normal;end
				else if(x[3] == 1 & x[2] == 0 & x[1] == 0 & x[0] == 0) begin nextstate = menu; end
				else if(x[3] == 1 & x[2] == 0 & x[1] == 0 & x[0] == 1) begin nextstate = secagem; end
				else if(x[3] == 1 & x[2] == 0 & x[1] == 1 & x[0] == 0) begin nextstate = economica; end
				else if(x[3] == 1 & x[2] == 1 & x[1] == 0 & x[0] == 0) begin nextstate = pesada; end
				else nextstate = erro2;
				
			pesada:
				if(x[3] == 1 & x[2] == 1 & x[1] == 0 & x[0] == 0)begin  nextstate = pesada;end
				else if(x[3] == 1 & x[2] == 0 & x[1] == 0 & x[0] == 0) begin nextstate = menu; end
				else if(x[3] == 1 & x[2] == 0 & x[1] == 0 & x[0] == 1) begin nextstate = secagem; end
				else if(x[3] == 1 & x[2] == 0 & x[1] == 1 & x[0] == 0) begin nextstate = economica; end
				else if(x[3] == 1 & x[2] == 0 & x[1] == 1 & x[0] == 1) begin nextstate = normal; end
				else nextstate = erro2;
				
			erro1:
				if(x[3] == 1)begin  nextstate = erro1;end
				else nextstate = menu;
				
			erro2:
				if(x[3] == 1)begin  nextstate = erro2;end
				else nextstate = menu;
				
			default: nextstate = menu;
		endcase
		
	assign y = state;
endmodule	