module audio(
	CLK,L,EN
);
	input CLK,EN;
	output L;
	reg L;
always@(posedge CLK)
	begin
	if(EN)
	begin
		if(CLK)
			L= 1'b1;
		else
			L = 0;
	end
	else
		L = 0;
	end
endmodule
