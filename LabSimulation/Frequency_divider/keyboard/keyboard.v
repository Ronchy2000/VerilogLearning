module keyboard (
    clk,key1,key2,key3,key4,key5,key6,key7,key8,f_out,
    light
);
    parameter n = 32;
    parameter DO = 8'b00000001, RE = 8'b00000010,MI = 8'b00000100,FA = 8'b00001000
            ,SO = 8'b00010000,LA = 8'b00100000,SI = 8'b01000000,DOO = 8'b10000000;
    input clk;
    input key1,key2,key3,key4,key5,key6,key7,key8;
    output reg [7:0] light;
    output reg f_out;
    reg[n-1:0] acc = 0;
always @(posedge clk) begin
    case({key8,key7,key6,key5,key4,key3,key2,key1})
        DO:begin acc <= acc + 32'h0000AF93;light <= 8'b10110010; end
        RE:begin acc <= acc + 32'h0000C513;light <= 8'b11001011; end
        MI:begin acc <= acc + 32'h0000DD36;light <= 8'b01010010; end
        FA:begin acc <= acc + 32'h0000EA5D;light <= 8'b11010011; end
        SO:begin acc <= acc + 32'h00010710;light <= 8'b01101010; end
        LA:begin acc <= acc + 32'h00012747;light <= 8'b01011001; end
        SI:begin acc <= acc + 32'h00014B71;light <= 8'b11001001; end
        DOO:begin acc <= acc +32'h00015F26;light <= 8'b00101010; end
		  default:begin acc <=0;light <= 8'b00000000;end
    endcase
    f_out <= acc[n-1];
end
endmodule