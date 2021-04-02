module mux41a_wire(a,b,c,d,s1,s0,y);
	input a,b,c,d,s1,s0;
	output y;
	wire at =s0?d:c;
	wire bt =s0?b:a;
	wire y =(s1?at:bt);
endmodule
