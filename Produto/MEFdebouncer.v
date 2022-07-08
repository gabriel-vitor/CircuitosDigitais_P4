module MEFdebouncer(x, y, clk);
	input x;
	input clk;
	output y;

	wire q0, q1, q2, nq2 ;
	
	ffd ff0(x,clk, q0);
	ffd ff1(q0,clk, q1);

	
	not (nq2,q1);
	
	assign y = q0 & nq2;
		
endmodule 
	
