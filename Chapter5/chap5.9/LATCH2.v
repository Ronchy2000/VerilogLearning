//含异步清零D触发器
module LATCH2(CLK,D,Q,RST);
	output Q;
	input CLK,D,RST;
	assign Q = (!RST)? 0: (CLK?D:Q);
endmodule
