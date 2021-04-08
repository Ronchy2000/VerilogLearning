module AMOD(D,A,CLK,Q);
	output Q; 
	input A,D,CLK;
	reg Q,Q1;
	always@(posedge CLK) Q1=~(A|Q);
	always@(posedge Q1) Q<=D;
endmodule
