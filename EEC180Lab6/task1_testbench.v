`timescale 1ps/1ps

module task1_testbench; 

////OUTPUTS - wire////
wire signed [18:0] out;

////INPUTS - reg////
reg signed [7:0] x, y; 
reg clk = 1'b0;
reg clear; 

mac math(.x(x), .y(y), .s(out), .macc_clear(clear), .clk(clk));

always begin 
#100
clk = ~clk; end

initial begin
	x = 8'b1111_1111; // -1 
	y = 8'b0000_0010; // 2
	clear = 1'b1; 
	#200
	$display ("x = %d, y= %d, clear = %b", x, y, clear);
	$display("output = %b, output = %d", out, out);
	//repeat (2) begin
		repeat (10) begin 	
			clear = 1'b0;
			#200
			$display ("x = %d, y= %d, clear = %b", x, y, clear);
			$display("output = %b, output = %d", out, out);
		end 
		clear = 1'b1;
		#200
		$display("-----------CLEARED-----------");
		$display("output = %b,output = %d", out, out);
	//end 
end 
endmodule 
