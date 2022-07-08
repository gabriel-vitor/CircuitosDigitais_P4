module mefcedulas(x, y, clk, rst);
	input wire [0:3] x;
	input wire clk, rst;
	output wire [0:3] y;
	
	parameter [0:3] menu = 4'b0000,
						 num2 = 4'b0001, num4 = 4'b0010, num5 = 4'b0011, num6 = 4'b0100, num7 = 4'b0101, 
						 num8 = 4'b0110, num9 = 4'b0111, num10 = 4'b1000, num11 = 4'b1001, num12 = 4'b1010,
						 num13 = 4'b1011, num15 = 4'b1100, num17 = 4'b1101,
						 finalizado = 4'b1110, erro1 = 4'b1111;
	
	reg [0:3] state, nextstate;
	
	always @(posedge clk) begin
		if(rst == 0) state <= menu;
		else state <= nextstate;
	end
		
	always @(*) begin
		nextstate = 4'bxxxx;
		case(state)
			menu:
			begin
				if(x == 4'b1000) nextstate = num2;
				else if(x == 4'b1001) nextstate = num5;
				else if(x == 4'b1010) nextstate = num10;
				else if(x == 4'b1011) nextstate = erro1;
				else nextstate <= menu;
			end
			
			num2:
			begin
				if(x == 4'b1000) nextstate = num4;
				else if(x == 4'b1001) nextstate = num7;
				else if(x == 4'b1010) nextstate = num12;
				else if(x == 4'b1011) nextstate = erro1;
				else nextstate = num2;
			end
			
			num4:
			begin
				if(x == 4'b1000) nextstate = num6;
				else if(x == 4'b1001) nextstate = num9;
				else if(x[3] == 1'b0) nextstate = finalizado;
				else if(x == 4'b1011) nextstate = erro1;
				else if((x[3] == 1'b1) & (x[2] == 1'b1)) nextstate = num4;
			end
			
			num5:
			begin
				if(x == 4'b1000) nextstate = num7;
				else if(x == 4'b1001) nextstate = num10;
				else if(x == 4'b1010) nextstate = num15;
				else if(x == 4'b1011) nextstate = erro1;
				else if(x[3] == 1'b0) nextstate = num5;
				else nextstate = num5;
			end
			
			num6:
			begin
				if(x == 4'b1000) nextstate = num8;
				else if(x == 4'b1001) nextstate = num11;
				else if(x == 4'b1011) nextstate = erro1;
				else if(x[3] == 1'b0) nextstate = num6;
				else nextstate = num6;
			end	
			
			num7:
			begin
				if(x == 4'b1000) nextstate = num9;
				else if(x == 4'b1001) nextstate = num12;
				else if(x == 4'b1010) nextstate = num17;
				else if(x == 4'b1011) nextstate = erro1;
				else if(x[3] == 1'b0) nextstate = num7;
				else nextstate = num7;
			end
			
			num8:
			begin
				if(x == 4'b1000) nextstate = num10;
				else if(x == 4'b1001) nextstate = num13;
				else if(x == 4'b1011) nextstate = erro1;
				else if(x[3] == 1'b0) nextstate = num8;
				else nextstate = num8;
			end
			
			num9:
			begin
				if(x == 4'b1000) nextstate = num11;
				else if(x == 4'b1011) nextstate = erro1;
				else if(x[3] == 1'b0) nextstate = num9;
				else nextstate = num9;
			end
			
			num10:
			begin
				if(x == 4'b1000) nextstate = num12;
			   else if(x == 4'b1001) nextstate = num15;
				else if(x == 4'b1011) nextstate = erro1;
				else if(x[3] == 1'b0) nextstate = finalizado;
				else nextstate = num10;
			end
			
			num11:
			begin
				if(x == 4'b1000) nextstate = num13;
				else if(x == 4'b1011) nextstate = erro1;
				else nextstate = num11;
			end
			
			num12:
			begin
				if(x == 4'b1001) nextstate = num17;
				else if(x == 4'b1011) nextstate = erro1;
				else if(x[3] == 1'b0) nextstate = finalizado;
				else nextstate = num12;
			end
			
			num13:
			begin
				if(x == 4'b1000) nextstate = num15;
				else if(x == 4'b1011) nextstate = erro1;
				else nextstate = num13;
			end
			
			num15:
			begin
				if(x == 4'b1000) nextstate = num17;
				else if(x == 4'b1011) nextstate = erro1;
				else nextstate = num15;
			end
			
			num17:
			begin
				if(x[3] == 1'b0) nextstate = finalizado;
				else if(x == 4'b1011) nextstate = erro1;
				else nextstate = num17;
			end
			
			finalizado: nextstate = finalizado;
			
			erro1:
			begin
				if(x[3] == 1'b0) nextstate = menu; 
				else nextstate = erro1;
			end
			default: begin
				nextstate = erro1;
			end
		endcase
	end
	
	assign y = state;
endmodule	 