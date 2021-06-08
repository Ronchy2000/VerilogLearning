module CNT24B(clk,count);
	input clk;
	output[23:0] count;
	reg[23:0] count=0;
always@(posedge clk)
begin
	count = count+1;
	if(count == 24'hffffff)
		count = 0;
end
endmodule
