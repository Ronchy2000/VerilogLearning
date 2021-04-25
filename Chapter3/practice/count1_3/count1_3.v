module count1_3(NIN,COUNT);
	input[7:0] NIN;
	output[3:0] COUNT;
	
	reg[7:0] TIN;
	reg[3:0] COUNT;
	integer i;
	always@(NIN)
begin
	COUNT = 0;
	TIN =NIN;
	i=0;
	while(i < 8) begin
		if(TIN[0] ==1)
			COUNT =COUNT + 1;
		TIN = TIN>>1;
		i = i+1;
	end
end
endmodule
