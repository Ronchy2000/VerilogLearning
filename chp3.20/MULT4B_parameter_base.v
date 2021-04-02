module MULT4B_parameter_base
#(parameter S)(R,A,B);
output[2*S:1] R;
input[S:1] A,B;
reg[2*S:1] AT,R;
reg[S:1] BT,ST;
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