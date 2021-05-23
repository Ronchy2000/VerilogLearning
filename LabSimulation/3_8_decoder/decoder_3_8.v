module decoder_3_8 (
    EN,A,B,C,COUT
);
    input EN,A,B,C;
    output[7:0] COUT;
    parameter s0 = 3'b000,s1= 3'b001,s2= 3'b010,s3 = 3'b011,
    s4 = 3'b100,s5 = 3'b101,s6 = 3'b110,s7 = 3'b111;
    reg[7:0] COUT;
    reg[2:0] ADR;
    always @(A,B,C,EN) begin
        ADR = {C,B,A};
        if(!EN) COUT <= ~8'b11111111;
        else
            case(ADR)
                s0: COUT <= ~8'b11111110;
                s1: COUT <= ~8'b11111101;
                s2: COUT <= ~8'b11111011;
                s3: COUT <= ~8'b11110111;
                s4: COUT <= ~8'b11101111;
                s5: COUT <= ~8'b11011111;
                s6: COUT <= ~8'b10111111;
                s7: COUT <= ~8'b01111111;
					 default:COUT<=~8'b11111111;
            endcase
    end 
endmodule