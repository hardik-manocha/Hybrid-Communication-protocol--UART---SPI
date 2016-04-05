`timescale 1ns / 1ps
module transmitter(
    input clk,rst,b,
    input [31:0]in,
    output reg ready1,
    output reg [8:0]in_bus_9_1,
    input ack1,
    input [1:0]nxt_data_t,
    
    //ports for taaking data back from receiver2
    
    input rst_r2,    //taking data back from receiver 2
    input [8:0]data_in_r2,   //taking data back from receiver 2
    input ready_r21,   //taking data back from receiver 2
    output reg ack_r21,   //taking data back from receiver 2
    output reg [1:0]nxt_data_r21,   //taking data back from receiver 2
    //output reg spi_rounded_check,
    output reg [31:0]received_data_32
    );


wire [31:0]s;
reg [8:0]a1;
reg parity1;
reg [7:0]state;
//reg ready1;
//reg [8:0]in_bus_9_1;
//wire [8:0]out_bus_9_1;
//wire ack1;
reg check,def;
//wire [1:0]nxt_data_t;

//signal for taking data back from receiver2
reg [8:0]data_receive_reg_9_r21;
reg parity_r21;
reg check_r21;
reg [1:0]data_store_status_r21;
reg [31:0]data_received_r21_store;
reg hardik;

function parity_t;
input [7:0]a1;
integer i;
begin
	parity_t=0;
	for(i=0;i<8;i=i+1)begin
	  parity_t=parity_t^a1[i];
	 end
end
endfunction

assign s=in;

//parity_check l1 (a1,clk,parity1);
//receiver l2 (clk,ready1,rst,in_bus_9_1,ack1,nxt_data_t,out_bus_9_1);

always @(clk,s,a1,parity1,state,ready1,ack1)
	begin
		if(rst==1'b1)begin
			state=0;
			in_bus_9_1=0;
			data_store_status_r21=2'b00;
		end
		else
		case (state)
			0:begin
	
				a1=s[31:24];
				if(b==1'b1)begin
				state=1;
				end
				else
				state=0;
			end
		
			1:begin
				parity1=parity_t(a1);
				if(b==1'b1)begin
				state=2;
				end
				else
				state=1;
			end
			
			2:begin
				if(b==1'b1)begin
				state=3;
				end
				else
				state=2;
			end
			
			3:begin
				if(b==1'b1)begin
				state=4;
				end
				else
				state=3;
			end
			
			4:begin
				if(b==1'b1)begin
				state=5;
				end
				else
				state=4;
			end
			
			5:begin
				if(b==1'b1)begin
				state=6;
				end
				else
				state=5;
			end
			
			6:begin
				if(b==1'b1)begin
				state=7;
				end
				else
				state=6;
			end
			
			7:begin
				if(b==1'b1)begin
				state=8;
				end
				else
				state=7;
			end
			
			8:begin
				if(b==1'b1)begin
				state=9;
				end
				else
				state=8;
			end
			
			9:begin
				if(b==1'b1)begin
				state=10;
				end
				else
				state=9;
			end
			
			10:begin
				if(b==1'b1)begin
				state=11;
				end
				else
				state=10;
			end
			
			11:begin
				if(b==1'b1)begin
				state=12;
				end
				else
				state=11;
			end
			
			12:begin
				if(b==1'b1)begin
				state=13;
				end
				else
				state=12;
			end
			
			13:begin
				if(b==1'b1)begin
				state=14;
				end
				else
				state=13;
			end
			
			14:begin
				if(b==1'b1)begin
				state=15;
				end
				else
				state=14;
			end
			
			
			15:begin//changed done before this state
				ready1=1'b1;
				if(b==1'b1)begin
				state=16;
				end
				else
				state=15;
			end
			
			16:begin
				check=ack1;
				
				  if(ack1)begin
				  in_bus_9_1[8:1]=a1;
					in_bus_9_1[0]=parity1;
					
					if(b==1'b1)begin
					state=17;
					end
					else
					state=16;
					end
				end
			
			17:begin
				if(b==1'b1)begin
				state=18;
				end
				else
				state=17;
			end
			
			18:begin

				if(b==1'b1)begin
				state=19;
				end
				else
				state=18;
			end
			
			19: begin
			 
			 if(b==1'b1)begin
				state=20;
				end
				else
				state=19;
			end
			
			20: begin
			 
			  if(b==1'b1)begin
				state=21;
				end
				else
				state=20;
			  end
			  
			 21: begin
			    if(nxt_data_t==2'b01)begin
			      a1=s[23:16];
			    end
			    if(b==1'b1)begin
				    state=22;
				  end
				  else
				    state=21;
			 end 
			 
			 22:begin
			     parity1=parity_t(a1);
			     if(b==1'b1)begin
				    state=23;
				   end
				   else
				    state=22;
			   end
			   
			 23: begin
			     in_bus_9_1[8:1]=a1;
					 in_bus_9_1[0]=parity1;
					 if(b==1'b1)begin
				    state=24;
				   end
				   else
				    state=23;
			 end  
			 
			 24: begin
			 
			 if(b==1'b1)begin
				state=25;
				end
				else
				state=24;
			end
			
			25: begin
			 
			 if(b==1'b1)begin
				state=26;
				end
				else
				state=25;
			end
			
			26: begin
			 
			 if(b==1'b1)begin
				state=27;
				end
				else
				state=26;
			end
			
			27: begin
			 
			 if(b==1'b1)begin
				state=28;
				end
				else
				state=27;
			end
			//hweeeeeeeeeet
			28: begin
			 
			 if(b==1'b1)begin
				state=29;
				end
				else
				state=28;
			end
			
			29: begin
			 
			 if(b==1'b1)begin
				state=30;
				end
				else
				state=29;
			end
			
			30: begin
			 
			 if(b==1'b1)begin
				state=31;
				end
				else
				state=30;
			end
			
			31: begin
			 if(nxt_data_t==2'b10)begin
			      a1=s[15:8];
			    end
			 if(b==1'b1)begin
				state=32;
				end
				else
				state=31;
			end
			
			32: begin
			  parity1=parity_t(a1);
			 if(b==1'b1)begin
				state=33;
				end
				else
				state=32;
			end
			
			33: begin
			  if(b==1'b1)begin
				state=34;
				end
				else
				state=33;
			end
			
			34: begin
			  in_bus_9_1[8:1]=a1;
				in_bus_9_1[0]=parity1;
			  if(b==1'b1)begin
				state=35;
				end
				else
				state=34;
			end
			
			35: begin
			  if(b==1'b1)begin
				state=36;
				end
				else
				state=35;
			end
			
			///changes made here
			 36: begin
			 
			 if(b==1'b1)begin
				state=37;
				end
				else
				state=36;
			end
			
			37: begin
			 
			 if(b==1'b1)begin
				state=38;
				end
				else
				state=37;
			end
			
			38: begin
			 if(b==1'b1)begin
				state=39;
				end
				else
				state=38;
			end
			
			39: begin
			 if(b==1'b1)begin
				state=40;
				end
				else
				state=39;
			end
			
			40: begin
			 if(b==1'b1)begin
				state=41;
				end
				else
				state=40;
			end
			
			41: begin
			 
			 if(b==1'b1)begin
				state=42;
				end
				else
				state=41;
			end
			
			42: begin
			 
			 if(b==1'b1)begin
				state=43;
				end
				else
				state=42;
			end
			
			43: begin
			 
			 if(b==1'b1)begin
				state=44;
				end
				else
				state=43;
			end
			
			44: begin
			 if(nxt_data_t==2'b11)begin
			      a1=s[7:0];
			    end
			 if(b==1'b1)begin
				state=45;
				end
				else
				state=44;
			end
			
			45: begin
			  parity1=parity_t(a1);
			 if(b==1'b1)begin
				state=46;
				end
				else
				state=45;
			end
			
			46: begin
			  if(b==1'b1)begin
				state=47;
				end
				else
				state=46;
			end
			
			47: begin
			  in_bus_9_1[8:1]=a1;
				in_bus_9_1[0]=parity1;
			  if(b==1'b1)begin
				state=48;
				end
				else
				state=47;
			end
			
			48: begin
			  if(b==1'b1)begin
				state=49;
				end
				else
				state=48;
			end
			
			49: begin
			  if(b==1'b1)begin
				state=50;
				end
				else
				state=49;
			end
			
			//receiving data from rceiver2
			50: begin
			  if(rst_r2==1'b0)begin
			    $display("starting receiving data from receiver2");
			    end
			  if(rst_r2==1'b0)begin
				state=100;
				end
				else
				state=50;
			end
			
			100: begin     // 1
			  if(b==1'b1)begin
				state=101;
				end
				else
				state=100;
			end
			
			101: begin //2
			  if(b==1'b1)begin
				state=102;
				end
				else
				state=101;
			end
			
			102: begin //3
			  if(b==1'b1)begin
				state=103;
				end
				else
				state=102;
			end
			
			103: begin //4
			  if(b==1'b1)begin
				state=104;
				end
				else
				state=103;
			end
			
			104: begin //5
			  if(b==1'b1)begin
				state=105;
				end
				else
				state=104;
			end
			
			105: begin //6
			  if(b==1'b1)begin
				state=51;
				end
				else
				state=105;
			end
			
			
			51: begin
			  if(ready_r21==1)begin
			     ack_r21=1'b1;
			   end
			  if(b==1'b1)begin
				state=52;
				end
				else
				  state=51;
				end
				
			52: begin
			  data_receive_reg_9_r21=data_in_r2;
			  if(b==1'b1)begin
				state=53;
				end
				else
				state=52;
			end	
			
			53: begin
			  parity_r21=parity_t(data_receive_reg_9_r21[8:1]);
			  if(b==1'b1)begin
				state=54;
				end
				else
				state=53;
			end	
			
			54: begin
			  if(parity_r21==data_receive_reg_9_r21[0])
			  check_r21=1'b1;
			  if(b==1'b1)begin
				state=55;
				end
				else
				state=54;
			end	
			
			
			
			55: begin
			  if(data_store_status_r21==2'b00)begin
		    data_received_r21_store[31:24]=data_receive_reg_9_r21[8:1];
		    data_store_status_r21=2'b01;
		    nxt_data_r21=2'b01;
		    end
			  if(b==1'b1)begin
				state=56;
				end
				else
				state=55;
			end	
			
			56: begin    //1
			  if(b==1'b1)begin
				state=57;
				end
				else
				state=56;
			end	
				
			57: begin    //2
			  if(b==1'b1)begin
				state=58;
				end
				else
				state=57;
			end
			
			58: begin    //3
			  if(b==1'b1)begin
				state=59;
				end
				else
				state=58;
			end		
			
			59: begin    //4
			  if(b==1'b1)begin
				state=60;
				end
				else
				state=59;
			end		
				
			60: begin    //5
			  if(b==1'b1)begin
				state=61;
				end
				else
				state=60;
			end		
			
			61: begin    //6
			  if(b==1'b1)begin
				state=62;
				end
				else
				state=61;
			end	
			
			62: begin    //7
			  if(b==1'b1)begin
				state=63;
				end
				else
				state=62;
			end
			
			63: begin  
			  data_receive_reg_9_r21=data_in_r2;
			  if(b==1'b1)begin
				state=64;
				end
				else
				state=63;
			end	
			
			64: begin  
			  parity_r21=parity_t(data_receive_reg_9_r21[8:1]);
			  if(b==1'b1)begin
				state=65;
				end
				else
				state=64;
			end
			
			65: begin  
			 if(parity_r21==data_receive_reg_9_r21[0])
			  check_r21=1'b1;
			  
			  if(b==1'b1)begin
				state=66;
				end
				else
				state=65;
			end
			
			66: begin  
			  if(b==1'b1)begin
				state=67;
				end
				else
				state=66;
			end
			
			67: begin  
			  if(data_store_status_r21==2'b01)begin
		    data_received_r21_store[23:16]=data_receive_reg_9_r21[8:1];
		    data_store_status_r21=2'b10;
		    nxt_data_r21=2'b10;
		    end
			  if(b==1'b1)begin
				state=68;
				end
				else
				state=67;
			end
			
			///
			68: begin    //1
			  if(b==1'b1)begin
				state=69;
				end
				else
				state=68;
			end	
				
			69: begin    //2
			  if(b==1'b1)begin
				state=70;
				end
				else
				state=69;
			end
			
			70: begin    //3
			  if(b==1'b1)begin
				state=71;
				end
				else
				state=70;
			end		
			
			71: begin    //4
			  if(b==1'b1)begin
				state=72;
				end
				else
				state=71;
			end		
				
			72: begin    //5
			  if(b==1'b1)begin
				state=73;
				end
				else
				state=72;
			end		
			
			73: begin    //6
			  if(b==1'b1)begin
				state=74;
				end
				else
				state=73;
			end	
			
			74: begin    //7
			  if(b==1'b1)begin
				state=75;
				end
				else
				state=74;
			end
			
			///
			75: begin  
			  data_receive_reg_9_r21=data_in_r2;
			  if(b==1'b1)begin
				state=76;
				end
				else
				state=75;
			end	
			
			76: begin  
			  parity_r21=parity_t(data_receive_reg_9_r21[8:1]);
			  if(b==1'b1)begin
				state=77;
				end
				else
				state=76;
			end
			
			77: begin  
			 if(parity_r21==data_receive_reg_9_r21[0])
			  check_r21=1'b1;
			  
			  if(b==1'b1)begin
				state=78;
				end
				else
				state=77;
			end
			
			78: begin  
			  if(b==1'b1)begin
				state=79;
				end
				else
				state=78;
			end
			
			79: begin  
			  if(data_store_status_r21==2'b10)begin
		    data_received_r21_store[15:8]=data_receive_reg_9_r21[8:1];
		    data_store_status_r21=2'b11;
		    nxt_data_r21=2'b11;
		    end
			  if(b==1'b1)begin
				state=80;
				end
				else
				state=79;
			end
			
			//////
			80: begin    //1
			  if(b==1'b1)begin
				state=81;
				end
				else
				state=80;
			end	
				
			81: begin    //2
			  if(b==1'b1)begin
				state=82;
				end
				else
				state=81;
			end
			
			82: begin    //3
			  if(b==1'b1)begin
				state=83;
				end
				else
				state=82;
			end		
			
			83: begin    //4
			  if(b==1'b1)begin
				state=84;
				end
				else
				state=83;
			end		
				
			84: begin    //5
			  if(b==1'b1)begin
				state=85;
				end
				else
				state=84;
			end		
			
			85: begin    //6
			  if(b==1'b1)begin
				state=86;
				end
				else
				state=85;
			end	
			
			86: begin    //7
			  if(b==1'b1)begin
				state=87;
				end
				else
				state=86;
			end
			
			///
			87: begin  
			  data_receive_reg_9_r21=data_in_r2;
			  if(b==1'b1)begin
				state=88;
				end
				else
				state=87;
			end	
			
			88: begin  
			  parity_r21=parity_t(data_receive_reg_9_r21[8:1]);
			  if(b==1'b1)begin
				state=89;
				end
				else
				state=88;
			end
			
			89: begin  
			 if(parity_r21==data_receive_reg_9_r21[0])
			  check_r21=1'b1;
			  
			  if(b==1'b1)begin
				state=90;
				end
				else
				state=89;
			end
			
			90: begin  
			  if(b==1'b1)begin
				state=91;
				end
				else
				state=90;
			end
			
			91: begin  
			  if(data_store_status_r21==2'b11)begin
		    data_received_r21_store[7:0]=data_receive_reg_9_r21[8:1];
		    data_store_status_r21=2'b11;
		    nxt_data_r21=2'b11;
		    end
			  if(b==1'b1)begin
				state=92;
				end
				else
				state=91;
			end
			
			92:begin
			  if(data_received_r21_store==s)begin
			    hardik=1'b1;
			    received_data_32=data_received_r21_store;
			    end
			    if(b==1'b1)begin
				    state=92;
				  end
				   else
				    state=92;
       end
			
			
			default:begin
				def=1'b1;
			end
		endcase

	end

endmodule

