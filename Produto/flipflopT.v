module flipflopT(clk,reset,T,Q, QB);

	input clk, reset, T; 
	output reg Q, QB;
  
	always @ (posedge clk, posedge reset) begin  
		if (reset) begin
			Q <= 1;
			QB <= 0;
		end
		else
			if(T == 1) begin
				Q <= ~Q;
				QB <= Q;
			end
			else 
				Q <= Q;
				QB <= ~Q;
			
	
  end  
endmodule  