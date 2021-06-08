module DigitalTube2(
	 clk50,clr,en,UPDN,  clk,seg,w_sel
);//clk50:时钟50MHZ，要进行分频
	//clk数码管扫描时钟//可以用temp14，也可以不变（这里没变）
	//cntclk:2.98HZ
    input clk;
    //parameter[31:0] datain=32'h20210527;
    output reg[7:0] seg;
    output reg[7:0] w_sel;
    reg[2:0] cnt;
    reg[3:0] data;
//-----------------------
	input clk50,clr,en,UPDN;
	reg[23:0] temp=0;//24位计数器分频
	reg[31:0] cnt32=0;//32位计数器显示
	reg cntclk; //cntclk:2.98HZ
//-----------------------
always @(cnt) begin
    case(cnt)
        3'b000:begin w_sel<=8'b00000001;data<=cnt32[3:0];end
        3'b001:begin w_sel<=8'b00000010;data<=cnt32[7:4];end
        3'b010:begin w_sel<=8'b00000100;data<=cnt32[11:8];end
        3'b011:begin w_sel<=8'b00001000;data<=cnt32[15:12];end
        3'b100:begin w_sel<=8'b00010000;data<=cnt32[19:16];end
        3'b101:begin w_sel<=8'b00100000;data<=cnt32[23:20];end
        3'b110:begin w_sel<=8'b01000000;data<=cnt32[27:24];end
        3'b111:begin w_sel<=8'b10000000;data<=cnt32[31:28];end
    endcase
end
always @(posedge clk) begin
    cnt <= cnt+1;
end
always@(data)
begin
    case(data)
    4'b0000:seg<=8'b11000000;
    4'b0001:seg<=8'b11111001;
    4'b0010:seg<=8'b10100100;
    4'b0011:seg<=8'b10110000;
    4'b0100:seg<=8'b10011001;
    4'b0101:seg<=8'b10010010;
    4'b0110:seg<=8'b10000010;
    4'b0111:seg<=8'b11111000;
    4'b1000:seg<=8'b10000000;
    4'b1001:seg<=8'b10010000;
    4'b1010:seg<=8'b10001000;
    4'b1011:seg<=8'b10000011;
    4'b1100:seg<=8'b11000110;
	 4'b1101:seg<=8'b10100001; 
    4'b1110:seg<=8'b10000110;
    4'b1111:seg<=8'b10001110;
    endcase
end
//--------------------------
always@(posedge clk50)
begin
	if(clk50==1)
		temp = temp + 1;
	cntclk = temp[23];
end
//--------------------------
always@(posedge cntclk)
begin
	if(clr==0) cnt32=0;
	else if(en==1)
	begin
		if(UPDN==1'b1)
			cnt32 = cnt32 + 1;
		else
			cnt32 = cnt32 - 1;
	end
end
endmodule
