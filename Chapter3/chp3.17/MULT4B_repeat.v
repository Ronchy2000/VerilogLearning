module MULT4B_repeat(R,A,B);
	parameter S=4;
	output[2*S:1] R;
	input[S:1] A,B;
	reg[2*S:1] TA,R;
	reg[S:1] TB;
always@(A,B)
begin
	R=0;
	TA=A;
	TB=B;
	
	repeat(S)
	begin
		if(TB[1]) begin
			R=R+TA;
		end
		
		TA=TA<<1;
		TB=TB>>1;
	end
end
endmodule
