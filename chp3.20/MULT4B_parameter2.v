module MULT4B_parameter2(RP,AP,BP);
	output[15:0] RP;
	input[7:0] AP,BP;
		MULT4B_parameter_base #(.S(8))
		U1 (.R(RP), .A(AP),.B(BP));
endmodule
