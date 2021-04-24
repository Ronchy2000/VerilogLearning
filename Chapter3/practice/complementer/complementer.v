module complementer (NIN,NOUT,TOUT,OV);
	input [7:0]	NIN;
	output [7:0] NOUT,TOUT;
	output OV;
	reg [7:0]NOUT;
	reg  OV;
	reg[7:0] TOUT;
always@(NIN,NOUT,OV,TOUT)
begin
	if(NIN[7]==1'b0)
	begin
		NOUT = NIN;
		OV = 1'b0;
	end
	else 
	 begin
	 NOUT[6:0] = ~NIN[6:0];
	 TOUT = {1'b0,NOUT[6:0]};
	 TOUT = TOUT+1'b1;  
	 OV = TOUT[7];  //overflow judgement
	 NOUT = {1'b1,TOUT[6:0]};
	 end
end
endmodule

	