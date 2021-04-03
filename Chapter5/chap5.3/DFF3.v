module DFF3(CLK,D,Q,RST);
	output Q;
	input CLK,D,RST;
	reg Q;
	always@(posedge CLK)
		if(RST == 1) Q=0;
		else if (RST ==0 ) Q = D;
endmodule
