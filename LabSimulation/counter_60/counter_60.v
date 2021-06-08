module counter_60 (//BCD码
    CLK,CLR,EN,DOUT,COUT
);
//	 (*syn_encoding = "gray"*)
    input CLK,CLR,EN;
    output[7:0] DOUT;
    output COUT;
//    reg[7:0] DOUT;
	 reg COUT;
    reg[7:0] temp = 0;
    always @(posedge CLK or negedge CLR) begin
        if(!CLR) temp = 0; //0有效
        else if(EN)
        begin
            if(temp < 8'h59)
			begin
					if(temp >4'h9)begin
						temp[3:0] <= 0;
						temp[7:4] <= temp[7:4]+ 1'b1;end
					else 
						temp <= temp + 1'b1;
			else temp = 0;//越界
            end
        end    
	end
    always@(temp) begin
        if(temp == 8'h59) 
            COUT = 1'b1;
            else COUT=1'b0;
    end
    assign DOUT = temp;
endmodule