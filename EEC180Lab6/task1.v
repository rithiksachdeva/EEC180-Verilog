module mac(

output reg signed [18:0] s,
input signed [7:0] x,
input signed [7:0] y, 
input macc_clear, clk

);

always @(posedge clk) begin
	if(macc_clear) begin
		s <= x * y;
	end
	else begin
		s <= s + (x * y);
	end
end
endmodule