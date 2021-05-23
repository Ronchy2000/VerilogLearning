module Counter342(clk,clr,en,Q,COUT);
   input clk,clr,en;
	output Q,COUT; //COUT进位信号
	reg[3:0] Q,cnt; //查看状态（探针）
	reg COUT;
	always@(posedge clk or negedge clr)
	begin
		Q<=cnt;
		if(clr==0) cnt<=4'b0000;
		else if(en==1)
		begin
		   cnt<=cnt+1;
			if(cnt==4'b1011) //设定清零界限 1011  十二进制：0-11
			begin
			cnt<=4'b0000;
			COUT <=1;end
			
	   end
	 end
//	 assign COUT=(cnt==4'b1011)?1:0;
endmodule