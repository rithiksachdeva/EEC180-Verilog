module ram( 
	input clk, write_enable,
	input [6:0] address, 
	input [18:0] data_in,
	output reg [18:0] data_out
 ); 

	reg signed [18:0] mem [63:0]; 
	//integer i = 0;

	//write enable on (1) writing into the ram  -> data_out: address where data is being written to
	//write enable off (0) reading the ram -> data_in: address where data is being read from
	//data_out is one output at a time 
	
	always @(posedge clk) begin 
	
		if (write_enable == 1'b1) begin //on 
			//mem[address] = data_in;
			data_out = mem[address];
			$display(" ______________ current mem: %d, data_out: %d______________",mem[address], data_out); end 
		else begin 					  		  //off 
			 mem[address-1] = data_in; end 
			 
	end 
	
endmodule 	