module mux41a_assign(a,b,c,d,s0,s1,y);
	input a,b,c,d,s0,s1;
	output y;
	wire[1:0] SEL;
	wire	AT,BT,CT,DT;
	assign	SEL = {s1,s0};
	assign	AT = (SEL==2'D0);
	assign	BT = (SEL==2'D1);
	assign	CT = (SEL==2'D2);
	assign	DT = (SEL==2'D3);
	assign	y 	= (a&AT) | (b&BT) | (c&CT) |(d&DT);
endmodule

	