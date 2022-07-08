module decoderCedula(x,y);

	input [0:3] x;
	output [0:13] y;
	reg [0:13] SeteSegmentos;

	always @(*)
		case(x)
		  4'b0000: SeteSegmentos = 14'b00000010000001;
        4'b0001: SeteSegmentos = 14'b00000010010010;
        4'b0010: SeteSegmentos = 14'b00000011001100;
        4'b0011: SeteSegmentos = 14'b00000010100100;
        4'b0100: SeteSegmentos = 14'b00000011100000;
        4'b0101: SeteSegmentos = 14'b00000010001111;
        4'b0110: SeteSegmentos = 14'b00000010000000;
        4'b0111: SeteSegmentos = 14'b00000010001100;
        4'b1000: SeteSegmentos = 14'b10011110000001;
        4'b1001: SeteSegmentos = 14'b10011111001111;
        4'b1010: SeteSegmentos = 14'b10011110010010;
		  4'b1011: SeteSegmentos = 14'b10011110000110;	
		  4'b1100: SeteSegmentos = 14'b10011110100100;	
		  4'b1101: SeteSegmentos = 14'b10011110001111;	
		  4'b1110: SeteSegmentos = 14'b01100000111000;	
		  4'b1111: SeteSegmentos = 14'b11010101111001;
		  default: SeteSegmentos = 14'b01100001100010;
		endcase
		
	assign y = SeteSegmentos;	
endmodule


