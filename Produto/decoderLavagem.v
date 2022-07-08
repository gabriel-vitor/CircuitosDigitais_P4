module decoderLavagem(x,y);

	input [0:2] x;
	output [0:13] y;
	reg [0:13] SeteSegmentos;

	always @(*)
		case(x)
		  3'b000: SeteSegmentos = 14'b00010010001001;
        3'b001: SeteSegmentos = 14'b01001000100100;
        3'b010: SeteSegmentos = 14'b11100010110000;
        3'b011: SeteSegmentos = 14'b11100011101010;
        3'b100: SeteSegmentos = 14'b11100010011000;
        3'b101: SeteSegmentos = 14'b01100001001111;
        3'b110: SeteSegmentos = 14'b01100000010010;
		  default: SeteSegmentos = 14'b01100001100010;
		endcase
		
	assign y = SeteSegmentos;	
endmodule