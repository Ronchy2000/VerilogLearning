module ADDER8B(A,B,CIN,COUT,DOUT);
	output[7:0] DOUT;
	output COUT;
	input[7:0] A,B;
	input CIN;
	
	assign {COUT,DOUT} = A+B+CIN;
endmodule

