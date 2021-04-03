module LATCH1(CLK,D,Q);
	output Q;
	input CLK,D;
	reg Q;
	always@(D or CLK)
	if(CLK) Q<=D;
endmodule
