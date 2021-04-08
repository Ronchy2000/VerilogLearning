module LATCH3 (CLK,D,Q,RST);
	output Q;
	input CLK,D,RST;
	reg Q;
	always @(D or CLK or RST)
		if(!RST) Q<=0;
	else if (CLK) Q<=D;
endmodule
	