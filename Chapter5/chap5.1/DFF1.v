module DFF1(CLK,D,Q);
	output Q;
	input CLK,D;
	reg Q;
	always@(posedge CLK)
		Q<=D;
endmodule
