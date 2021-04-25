module ALU (
    OP,NIN1,NIN2,NOUT
);
    parameter add = 00;  // +
    parameter subtract = 01; // -
    parameter multi = 10;  // *
    parameter divid = 11;  //  /

    input[3:0] NIN1,NIN2;
    input[1:0] OP;
    output[7:0] NOUT;

    reg[3:0] TIN1,TIN2;
	 reg[7:0] NOUT;
    always@(OP,NIN1,NIN2) 
begin
    TIN1 = NIN1;
    TIN2 = NIN2;
    case(OP)
    //add
        2'b00: NOUT = TIN1 + TIN2; 
    //sub
        2'b01: NOUT = TIN1 - TIN2;
    //multi
        2'b10:NOUT = TIN1 * TIN2;
    //div
        2'b11:NOUT = TIN1 / TIN2;

        default:NOUT = 0;
    endcase
end
endmodule