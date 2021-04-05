module test1(A,B,C,D,RCD,RAB,RM1,RM2,S,C0,R1,R2);
	input[3:0] C,D;
	input signed[3:0] A,B; //4位有符号输入
	output[3:0] RCD,RAB;
	output[7:0] RM1,RM2;
	output[3:0] S;
	output C0;
	output R1,R2;
	
	reg[3:0] S;
	reg C0;
	
	reg[3:0] RCD;
	reg[7:0] RM1;
	reg signed[3:0] RAB;
	reg signed[7:0] RM2;
	reg R1,R2;
	always@(A,B,C,D)
	begin
		RCD<= C+D;
		RAB<=A+B;
		RM1<=C*D;
		RM2<=A*B;
		{C0,S} <= {1'b0,C} - {1'b0,D};
		R1 <= (C<D);
		R2 <= (A>B);
	end
endmodule
