module DFF2(CLK,D,Q,RST,EN);
	output Q;
	input CLK,D,RST,EN;
	reg Q;
	always@(posedge CLK or negedge RST)
	begin	
		if(!RST) Q<=0;
		else if(EN) Q<=D;
	end
endmodule
