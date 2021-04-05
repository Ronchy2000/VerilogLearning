module BCD_ADDER(A,B,D);
	input[7:0] A,B;
	output[8:0] D;
	wire[4:0] DT0,DT1;
	reg[8:0] D;
	reg S;
	
	always@(DT0)
	begin 
		if(DT0[4:0]>=5'b01010)
		 begin 
			D[3:0] = (DT0[3:0] + 4'b0110); //加6
			S=1'b1;  //进位标志1
		 end
		else
		 begin
			D[3:0] = DT0[3:0];
			S=1'b0;
		 end
	end
	
always@(DT1)
begin
	if(DT1[4:0]>=5'b01010)
	begin D[7:4] = (DT1[3:0]+4'b0110);
	D[8] = 1'b1;
	end
	else
	 begin
		D[7:4] = DT1[3:0];
		D[8] = 1'b0;
	 end
end
assign DT0 = A[3:0] +B[3:0];
assign DT1 = A[7:4]+ B[7:4] +S;

endmodule

		