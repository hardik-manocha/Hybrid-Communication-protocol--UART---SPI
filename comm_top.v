`timescale 1ns/1ps
module comm_top (
  input clk,
  input select,
  input rst,
  input [31:0]data,
  input b,
  output reg uart_data_match,
  output reg spi_data,
  output reg [31:0]dataout
  );

wire[31:0]store_register_r2;
wire[31:0]store_register;
wire ready11;
wire [8:0]bus_9_bits;
wire ack11;
wire [1:0]nxt_data;
//reg clk1;
wire ready_r2;
wire rst_r2;
wire ack_2;
wire [8:0]data_9;
wire [1:0]nxt_data_r;

//signals for giving data back to transmitter
wire rst_r21;
wire ready_r21;
wire ack_r21;
wire [8:0]data_9_r2;
wire [1:0]nxt_data_r21;
wire [31:0]rounded_data;

//signal ends here


transmitter t1 (clk,rst,b,data,ready11,bus_9_bits,ack11,nxt_data,rst_r21,data_9_r2,ready_r21,ack_r21,nxt_data_r21,rounded_data);
receiver r1 (select,clk,ready11,rst,bus_9_bits,ack11,nxt_data,store_register,ready_r2,rst_r2,ack_2,data_9,nxt_data_r);
receiver2 r11 (clk,ready_r2,rst_r2,data_9,ack_2,nxt_data_r,store_register_r2,rst_r21,ready_r21,ack_r21,data_9_r2,nxt_data_r21);


always @ (clk,rst,data,store_register)begin
 // clk1=clk/2;
  
  if(store_register==data & select==1'b0)begin
      uart_data_match=1'b1;
      dataout=store_register;
    end
    else if(rounded_data==data)begin
        spi_data=1'b1;
        dataout=rounded_data;
      end
  //end
  
end
endmodule  