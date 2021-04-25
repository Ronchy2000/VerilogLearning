module count1_2(NIN,COUNT);

	input[7:0] NIN;
	output[3:0] COUNT;
	
	integer i;
	reg[7:0] TIN;
	reg[3:0] COUNT;
	always @(NIN)
begin
	TIN =NIN;
	COUNT = 0;
	repeat(8) begin
		if(TIN[0] ==1)
			COUNT = COUNT+1;
		TIN = TIN>>1;
	end
end
endmodule
