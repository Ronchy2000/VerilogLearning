module count_1(
    NIN,COUNT
);
    input[7:0] NIN;
    output[3:0] COUNT;
    
    integer i;
	 reg[3:0] COUNT;
	 reg[7:0] TIN;
    always @(NIN) 
begin
	 TIN = NIN;
	 COUNT = 0;
    for(i=1 ; i < 8 ;i =i+1)
	 begin
			if(TIN[0])
				COUNT = COUNT+1;
			TIN = TIN>>1;
    end
end
endmodule