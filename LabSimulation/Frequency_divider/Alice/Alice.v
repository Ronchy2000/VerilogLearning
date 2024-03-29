module Alice (
    clk,f_out
);
	parameter n = 50000000;
	reg[m:0] time_cnt;
    reg clkout;
    parameter m = 32;//32位累加寄存器
    parameter DO = 8'b00000001, RE = 8'b00000010,MI = 8'b00000100,FA = 8'b00001000
            ,SO = 8'b00010000,LA = 8'b00100000,SI = 8'b01000000,DOO = 8'b10000000;
    input clk;
//    input key1,key2,key3,key4,key5,key6,key7,key8;
    output reg f_out;
    reg[m-1:0] acc = 0;
//always @(posedge clk) begin
//    case({key8,key7,key6,key5,key4,key3,key2,key1})
//        DO:acc <= acc + 32'h0000AF93;
//        RE:acc <= acc + 32'h0000C513;
//        MI:acc <= acc + 32'h0000DD36;
//        FA:acc <= acc + 32'h0000EA5D;
//        SO:acc <= acc + 32'h00010710;
//        LA:acc <= acc + 32'h00012747;
//        SI:acc <= acc + 32'h00014B71;
//        DOO:acc <= acc +32'h00015F26;
//    endcase
//    f_out <= acc[m-1];
//end
always @(posedge clk) begin
    if(time_cnt>=n-1) time_cnt<=32'h00000000;
    else time_cnt<=time_cnt +1;
    if(time_cnt<n_2) clkout<=1;
    else clkout <= 0;
end
always(posedge clk)begin
    
end

endmodule