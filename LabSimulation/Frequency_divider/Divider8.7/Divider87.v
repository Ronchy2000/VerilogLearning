`timescale 1ns/1ns
module Divider87 #(
    parameter fraction = 16'd87,       //分频的分子
    parameter denominator = 16'd10,    //分频的分母
    parameter cnt_width = 9            //计数器的位宽
) (
    input wire clk,
    input wire rstn,
    output reg clk_out
);

    reg [cnt_width-1:0] cnt;
    always @(posedge clk or negedge rstn) begin
        if(~rstn) begin
            cnt <= 0;
            clk_out <= 1'b0;
        end
        else if(cnt < fraction) begin
            cnt <= cnt + denominator;
            clk_out <= 1'b0;
        end
        else begin
            cnt <= cnt + denominator - fraction;
            clk_out <= 1'b1;
        end
    end
    
endmodule