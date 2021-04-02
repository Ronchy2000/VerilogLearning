module mux41a_always(a,b,c,d,s1,s0,y);
	input a,b,c,d,s1,s0;
	output y;
	reg[1:0] SEL;
	reg y;
	always@ (a,b,c,d,SEL)
		begin
				SEL = {s1,s0};
			if(SEL ==0) y=a;
	else if(SEL ==1) y= b;
	else if(SEL ==2) y= c;
	else             y= d;
		end
endmodule

			