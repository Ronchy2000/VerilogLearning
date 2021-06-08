module genDAC(clk,sel,data);
input clk;
input[1:0] sel;
output[7:0] data;
reg[5:0] adr;
always@(posedge clk)
begin
	adr <= adr +1'b1;
end

wave4	wave4_inst (
	.address ( adr ),
	.clock ( clk ),
	.q ( data )
	);
endmodule
