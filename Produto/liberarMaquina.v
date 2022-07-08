module liberarMaquina(cedulas, lavagem, y);


input [0:3] cedulas;
input [0:2] lavagem;
output y;

		
		
		wire [0:3] fio;
		and and0 (fio[0], ~lavagem[0],~lavagem[1],lavagem[0],cedulas[0],~cedulas[1],~cedulas[2],~cedulas[3]);
		and and1 (fio[1], ~lavagem[0],lavagem[1],~lavagem[0],~cedulas[0],~cedulas[1],cedulas[2],~cedulas[3]);
		and and2 (fio[2], ~lavagem[0],lavagem[1], lavagem[0],cedulas[0],~cedulas[1],cedulas[2],~cedulas[3]);
		and and3 (fio[3], lavagem[0],~lavagem[1],~lavagem[0],cedulas[0],cedulas[1],~cedulas[2],cedulas[3]);
	
		or orf(y,fio[0],fio[1],fio[2],fio[3]);

		
endmodule 