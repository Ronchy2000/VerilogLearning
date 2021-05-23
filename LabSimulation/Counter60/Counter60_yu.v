module Counter60_yu(rst_n,clk,EN,cout,cnt);
	input	rst_n; 
   input	clk; 
	input	EN;
   output reg  cout;
   output reg[7:0]  cnt;
	always@(posedge clk or negedge rst_n)
	begin 
		if(!rst_n)
			begin
			cnt<=1'b0;            
			cout<=1'b0;
			end
		else if(EN)
		begin
			if(cnt<8'b1011001)
			begin
				if(cnt[3:0]>=4'd9)
				begin 
					cnt[3:0]<=1'b0;
					cnt[7:4]<=cnt[7:4]+1'b1;    
				end
				else
				begin 
					cnt<=cnt+1'b1;
					cout<=1'b0;
				end 
			end
		else 
			begin
			cnt<=1'b0;
			cout<=1'b1;
			end
		end
	end 
endmodule
