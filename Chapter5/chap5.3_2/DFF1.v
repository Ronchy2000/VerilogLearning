module DFF1(CLK,D,Q,RST);
	output Q;
	input CLK,D,RST;
	reg Q,Q1;
	always@(RST)
		if(RST==1) Q1=0;  //二选一组合逻辑电路
		else Q1=D;
	always@(posedge CLK)
	Q<=Q1;		//不完整条件表达
endmodule

	