module MULT4B_down(R,A,B);
 parameter S=4;
 output [2*S:1] R;
 input[S:1] A,B;
 reg[2*S:1] R,AT;
 reg[S:1] BT,ST;  //ST为Stmep，为计数做铺垫
 always @(A,B)
	begin
		R=0;
		AT={{S{1'b0}},A};
		BT=B;
		for(ST=S;ST>0;ST=ST-1)
		begin
			if(BT[1]) R=R+AT;
			AT=AT<<1;
			BT=BT>>1;
		end
	end
endmodule