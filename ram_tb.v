`timescale 1ns/1ns
 `include "ram_1.v"
 module single_port_ram_tb;
  reg[7:0]data;
  reg [5:0] addr;
  reg we;
  reg clk;
  wire [7:0] q;
  
  single_port_ram spr1(
    .data(data),
    .addr(addr),
    .we(we),
    .clk(clk),
    .q(q));
  initial 
    begin
      $dumpfile("ram_tb.vcd");
      $dumpvars(0,single_port_ram_tb);
      $monitor($time,"data=%h, addr=%d, we=%b",data,addr,we);
      
      clk=1'b1;
      forever #5 clk=~clk;
    end
  
  initial
    begin 
      data =8'b01;
      addr=5'd0;
      we=1'b1;
      #10;
      
      data =8'h02;
      addr=5'd1;
      #10;
      
      data =8'h03;
      addr =5'd2;
      #10;
      addr=5'd0;
      we=1'b0;
      #10;
      
      addr=5'd1;
      #10;
      
      addr =5'd2;
      #10
      
      data=8'h04;
      addr=5'd1;
      we=1'b1;
      #10;
      
      addr=5'd1;
      we=1'b0;
      #10;
      
       $finish;
      #10;
    end
endmodule