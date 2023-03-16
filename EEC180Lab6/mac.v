module mac (
  input signed [7:0] x,
  input signed [7:0] y,
  input macc_clear,
  input clk,
  output reg signed [18:0] s
);

  always @(posedge clk) begin
    if (macc_clear) begin
      s <= x * y;
    end
    else begin
      s <= s + (x * y);
    end
  end
  
endmodule