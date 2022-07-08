module decoderMaquinas(x,y);

	input [0:3] x;
	output [0:13] y;
	reg [0:13] SeteSegmentos;

	always @(*)
		case(x)
		  4'b0000: SeteSegmentos = 14'b00010010001001;
        4'b0001: SeteSegmentos = 14'b01001000100100;
        4'b0010: SeteSegmentos = 14'b01001000000001;
        4'b0011: SeteSegmentos = 14'b01001001001111;
        4'b0100: SeteSegmentos = 14'b01001000010010;
        4'b0101: SeteSegmentos = 14'b01001000000110;
        4'b0110: SeteSegmentos = 14'b01001000110001;
        4'b0111: SeteSegmentos = 14'b01001001110001;
        4'b1000: SeteSegmentos = 14'b11100010000001;
        4'b1001: SeteSegmentos = 14'b11100011001111;
        4'b1010: SeteSegmentos = 14'b11100010010010;
		  4'b1011: SeteSegmentos = 14'b11100010000110;	
		  4'b1100: SeteSegmentos = 14'b11100010110001;
		  default: SeteSegmentos = 14'b01100001100010;
		endcase
		
	assign y = SeteSegmentos;	
endmodule