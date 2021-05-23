module Counter341(clk,clr,en,Q,COUT);
   input clk,clr,en;
	output Q,COUT; //COUT进位信号
	reg[3:0] Q; //查看状态（探针）
	reg[3:0] cnt;
	always@(posedge clk or negedge clr)
	begin
		Q<=cnt;
		if(clr==0) cnt<=4'b0000;
		else if(en==1)
		begin
		   cnt<=cnt+1;
			if(cnt==4'b1111)
			cnt<=4'b0000;
	   end
	 end
	 assign COUT=(cnt==4'b1111)?1:0;
endmodule