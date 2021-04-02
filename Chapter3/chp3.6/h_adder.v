module h_adder (A,B,SO,CO);
	input A,B;
	output SO,CO;
	assign CO = A & B;
	assign SO = A ^ B;
endmodule