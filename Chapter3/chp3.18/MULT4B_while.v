module MULT4B_while(R,A,B);
parameter S=4;
input[S:1] A,B;
output[2*S:1] R;
reg[2*S:1] R,AT;
reg[S:1] CT,BT;
always@(A,B)
begin
	R=0;
	AT={{S{1'b0}},A};
	BT=B;
	CT=S;
	while(CT>0)begin
		if(BT[1])
			R=R+AT;
		begin
			CT=CT-1;
			AT=AT<<1;
			BT=BT>>1;
		end
	end
end
endmodule
