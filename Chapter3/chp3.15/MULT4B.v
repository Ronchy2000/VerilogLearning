module MULT4B(R,A,B);
	parameter S=4;
	
	output[2*S:1] R;
	input[S:1] A,B;
	
	reg[2*S:1] R;
	integer i; //整型，用于循环计数
	always @(A or B)
		begin
			R=0;
			for(i=1;i<=S;i=i+1)
			if(B[i]) R=R+(A<<(i-1));
		end
endmodule


