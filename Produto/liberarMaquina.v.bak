module liberarMaquina(cedulas, lavagem, y);


input [0:3] cedulas;
input [0:2] lavagem;
output y;

		
		
		wire [0:3] fio;
		and and0 (fio0, ~lavagem[0],~lavagem[1],lavagem[0],cedulas[0],~cedulas[1],~cedulas[2],~cedulas[3]);
		and and1 (fio1, ~lavagem[0],lavagem[1],~lavagem[0],~cedulas[0],~cedulas[1],cedulas[2],~cedulas[3]);
		and and2 (fio2, ~lavagem[0],lavagem[1], lavagem[0],cedulas[0],~cedulas[1],cedulas[2],~cedulas[3]);
		and and3 (fio3, lavagem[0],~lavagem[1],~lavagem[0],cedulas[0],cedulas[1],~cedulas[2],cedulas[3]);
	
		or orf(y,fio0,fio1,fio2,fio3);

		
endmodule 