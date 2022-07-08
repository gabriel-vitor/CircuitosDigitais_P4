module lavanderia(btn, clk, clkr, reset, chave, saida, blocos);

	input reset, clk, clkr;
	input[0:1] btn;
	input [0:7] chave;
	output [0:3] blocos;
	output [0:7] saida; 
	wire [0:2] ydebounce;
	wire [0:3] ysm, xcm, ycm, xlm;
	wire [0:2] xsm, ylm;
	wire [0:13] ysm7s, ycm7s, ylm7s, y7sE;
	wire libera;
	wire[0:17] Q, QB;
	divisorFreq(clkr, Q, QB); // recebe o clk da placa e retorna um vetor de 17 posições

	//Bloco responsavel por achar maquina livre
	MEFdebouncer(btn[0], ydebounce[0], clkr, reset);
	and (xsm[0],chave[0],1);
	and (xsm[1],ydebounce[0],1);
	and (xsm[2],chave[1],1);
	mefselectmaquina(xsm, ysm, clk,reset);
	decoderMaquinas(ysm,ysm7s);

	//Bloco responsavel por receber cedulas
	MEFdebouncer(btn[1], ydebounce[1], clkr, reset);
	and (xcm[0],ydebounce[1],1);
	and (xcm[1],chave[2],1);
	and (xcm[2],chave[3],1);
	and (xcm[3],chave[4],1);
	mefcedulas(xcm, ycm, clk, reset);
	decoderCedula(ycm,ycm7s);


	//Bloco responsavel por selecionar tipo de operação
	and (xlm[0],libera,1);
	and (xlm[1],chave[5],1);
	and (xlm[2],chave[6],1);
	and (xlm[3],chave[7],1);
	mefselectlavagem(xlm, ylm, clk, reset);
	decoderLavagem(ylm,ylm7s);
	
	//bloco de liberação da maquina
	wire controle;
	and(controle,ycm[0],ycm[1],ycm[2],~ycm[3]);
	liberarMaquina(ycm, ylm, libera);
	muxP(ycm7s,ycm7s,ylm7s,ylm7s,controle, controle,y7sE);
	
	//Bloco responsavel pela exibição no display
	// Q e QB são as saidas do divisor de frequencia eles estão retornando dois clocks diferentes um equivalente ao clk dividido por 2 a 17 e o outro divido por 2 a 16.
	demuxP(0, Q[17], QB[16], blocos[0], blocos[1], blocos[2], blocos[3]); // A cada pulso de clock alterna uma das saidas para nivel logico baixo e deixa o resto em alto(Função: Ligar cada bloco de dysplay individualmente)
	//Cada mux enviara um dos quatro valores possiveis para o visor de 7 segmentos. Esse valor é o vetor de saida
	// Q e QB são as saidas do divisor de frequencia eles estão retornando dois clocks diferentes um equivalente ao clk dividido por 2 a 17 e o outro divido por 2 a 16.
	muxP(ysm7s[6], ysm7s[13], y7sE[6], y7sE[13], Q[17], QB[16], saida[6]);
	muxP(ysm7s[5], ysm7s[12], y7sE[5], y7sE[12], Q[17], QB[16], saida[5]);
	muxP(ysm7s[4], ysm7s[11], y7sE[4], y7sE[11], Q[17], QB[16], saida[4]);
	muxP(ysm7s[3], ysm7s[10], y7sE[3], y7sE[10], Q[17], QB[16], saida[3]);
	muxP(ysm7s[2], ysm7s[9], y7sE[2], y7sE[9], Q[17], QB[16], saida[2]);
	muxP(ysm7s[1], ysm7s[8], y7sE[1], y7sE[8], Q[17], QB[16], saida[1]);
	muxP(ysm7s[0], ysm7s[7], y7sE[0], y7sE[7], Q[17], QB[16], saida[0]);

endmodule 



