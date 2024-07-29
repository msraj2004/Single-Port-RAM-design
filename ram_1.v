module single_port_ram(
  input[7:0] data,
  input [5:0] addr,
  input we,
  input clk,
  output [7:0] q
);
  reg [7:0] ram [63:0];// 64 bit ram
  reg [5:0] addr_reg; // address register
   
  always@(posedge clk)
    begin
      if(we)
        ram[addr]<= data;
      else
        addr_reg<= addr;
      
    end
  assign q= ram[addr_reg];
endmodule