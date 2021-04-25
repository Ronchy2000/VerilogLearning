module converter (
    NIN,NOUT,SGN
);
    input[3:0] NIN;
    output[3:0] NOUT;
    output SGN;

    reg[3:0] NOUT;
    reg SGN = 1'b0;
    always @(NIN) begin
        if(NIN == 4'b0000)
		  begin
            NOUT = 4'b0000;
				SGN = 1'b0 ;
			end
        else if(NIN == 4'b0001)
		  begin
            NOUT = 4'b0001;
				SGN = 1'b0 ;
			end
        else if(NIN == 4'b0011)
		  begin
            NOUT = 4'b0010;
				SGN = 1'b0 ;
			end
        else if(NIN == 4'b0010)
		  begin
            NOUT = 4'b0011;
				SGN = 1'b0 ;
			end
        else if(NIN == 4'b0110)
		  begin
            NOUT = 4'b0100;
				SGN = 1'b0 ;
			end
        else if(NIN == 4'b0111)
		  begin
            NOUT = 4'b0101;
				SGN = 1'b0 ;
			end
        else if(NIN == 4'b0101)
		  begin
            NOUT = 4'b0110;
				SGN = 1'b0 ;
			end
        else if(NIN == 4'b0100)
		  begin
            NOUT = 4'b0111;
				SGN = 1'b0 ;
         end   
        else if(NIN == 4'b1100)
		  begin
            NOUT = 4'b1000;
				SGN = 1'b0 ;
			end
        else
        begin
            NOUT = 4'b0000;
            SGN = 1'b1 ;
        end
    end
endmodule