module KeyIn(clk,keyin,keyout);
	input clk,keyin;
	output keyout;
	reg[3:0]cta,ctb;//5个低电平，有效（按键按下）；5个高电平，有效（按键松开）
	reg keyout;
always@(posedge clk)
begin
	if(!keyin) cta= cta+1;
	else cta = 0;
end
always@(posedge clk)
begin
	if(keyin) ctb= ctb+1;
	else ctb = 0;
end
always@(posedge clk)
begin
	if(cta>4'b0100) begin keyout=0; end //低电平大于5，输出低电平
	else if(ctb>4'b0100) begin keyout =1'b1;end//高电平大于5，输出高电平
end
endmodule
		
	