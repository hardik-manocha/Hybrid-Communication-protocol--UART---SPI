`timescale 1ns / 1ps
module receiver2(
    input clk,ready,rst,
    input [8:0] in_bus_9,
    output reg ack,
    output reg [1:0]nxt_data,
    //output [8:0] out_bus_9,
    output reg[31:0]stored_data,
    
    //now outputs inputs to usart_top for giving back data to transmitter
    output reg rst_r21,
    output reg ready_r21,
    input ack_r21,
    output reg [8:0]data_9_r2,
    input [1:0]nxt_data_r21
    
    );
    
reg [7:0]state_r2; 
reg b_r2; 
reg [8:0]data_9_store;
reg parity_r2_local;
reg check_r2;
reg [31:0]data_32;

//signals transmitting data to transmitter
//reg rst_r21;
//reg ready_r21;
//wire ack_r21;
reg check_r21;
reg a1_r2;
reg parity_r21;
reg [7:0]a1_r21;
//reg [8:0]data_9;
//wire [1:0]nxt_data_r21;
////all registers ends here for transmitting data back to transmitter.

function parity_r2;
input [7:0]a1;
integer i;
begin
	parity_r2=0;
	for(i=0;i<8;i=i+1)begin
	  parity_r2=parity_r2^a1[i];
	 end
end
endfunction
    
//transmitter t1 ();    
    
always @ (clk,rst,ready,in_bus_9)begin
  
    if(rst)begin
    state_r2=0;
    //status_datastore=0;
    b_r2=1'b1;
    //rst_r2=1'b1;
  end
  
  else begin
    
    case (state_r2)
      
    0: begin
      if(ready==1'b1)begin
        ack=1'b1;
           if(b_r2==1'b1)begin
			     state_r2=1;
			     end
		       else begin
  	         state_r2=0;
		       end
      end
    end
    
    
    1:begin
        if(b_r2==1'b1)begin
			     state_r2=2;
			     end
		       else begin
	         state_r2=1;
		    end
    end
    
    2:begin
        if(b_r2==1'b1)begin
			     state_r2=3;
			     end
		       else begin
	         state_r2=2;
		    end
    end
    
    3:begin
        if(b_r2==1'b1)begin
			     state_r2=4;
			     end
		       else begin
	         state_r2=3;
		    end
    end
    
    4:begin
        if(b_r2==1'b1)begin
			     state_r2=5;
			     end
		       else begin
	         state_r2=4;
		    end
    end
    
    5:begin
        if(b_r2==1'b1)begin
			     state_r2=6;
			     end
		       else begin
	         state_r2=5;
		    end
    end
    
    6:begin
        if(b_r2==1'b1)begin
			     state_r2=7;
			     end
		       else begin
	         state_r2=6;
		    end
    end
    
    7:begin
        if(b_r2==1'b1)begin
			     state_r2=8;
			     end
		       else begin
	         state_r2=7;
		    end
    end
    
    8:begin
        data_9_store=in_bus_9;
        if(b_r2==1'b1)begin
			     state_r2=9;
			     end
		       else begin
	         state_r2=8;
		    end
    end
    
    9:begin
        if(b_r2==1'b1)begin
			     state_r2=10;
			     end
		       else begin
	         state_r2=9;
		    end
    end
    
    10:begin
        if(b_r2==1'b1)begin
			     state_r2=11;
			     end
		       else begin
	         state_r2=10;
		    end
    end
    
    
    
    11:begin
        parity_r2_local=parity_r2(data_9_store[8:1]);
        if(b_r2==1'b1)begin
			     state_r2=12;
			     end
		       else begin
	         state_r2=11;
		    end
    end
    
    12:begin
        if(b_r2==1'b1)begin
			     state_r2=13;
			     end
		       else begin
	         state_r2=12;
		    end
    end
    
    13:begin
        if(b_r2==1'b1)begin
			     state_r2=14;
			     end
		       else begin
	         state_r2=13;
		    end
    end
    
    
    
    14:begin
        if(parity_r2_local==data_9_store[0])begin
            check_r2=1'b1;
            data_32[31:24]=data_9_store[8:1];
            nxt_data=2'b01;  
        end
        if(b_r2==1'b1)begin
			  state_r2=15;
			  end
		    else begin
	      state_r2=14;
		    end
    end
    
    15:begin
        if(b_r2==1'b1)begin
			     state_r2=16;
			     end
		       else begin
	         state_r2=15;
		    end
    end
    
    16:begin
        if(b_r2==1'b1)begin
			     state_r2=17;
			     end
		       else begin
	         state_r2=16;
		    end
    end
    
    17:begin
        if(b_r2==1'b1)begin
			     state_r2=18;
			     end
		       else begin
	         state_r2=17;
		    end
    end
    
    18:begin
        if(b_r2==1'b1)begin
			     state_r2=19;
			     end
		       else begin
	         state_r2=18;
		    end
    end
    
    19:begin
        if(b_r2==1'b1)begin
			     state_r2=20;
			     end
		       else begin
	         state_r2=19;
		    end
    end
    
    20:begin
        data_9_store=in_bus_9;
        if(b_r2==1'b1)begin
			     state_r2=21;
			     end
		       else begin
	         state_r2=20;
		    end
		   end 
    
    21:begin
        if(b_r2==1'b1)begin
			     state_r2=22;
			     end
		       else begin
	         state_r2=21;
		    end
    end
    
    22:begin
        if(b_r2==1'b1)begin
			     state_r2=23;
			     end
		       else begin
	         state_r2=22;
		    end
    end
    
    23:begin
        parity_r2_local=parity_r2(data_9_store[8:1]);
        if(b_r2==1'b1)begin
			     state_r2=24;
			     end
		       else begin
	         state_r2=23;
		    end
    end
    
    24:begin
        if(b_r2==1'b1)begin
			     state_r2=25;
			     end
		       else begin
	         state_r2=24;
		    end
    end
    
     25:begin
        if(b_r2==1'b1)begin
			     state_r2=26;
			     end
		       else begin
	         state_r2=25;
		    end
    end
    
     26:begin
        if(parity_r2_local==data_9_store[0])begin
            check_r2=1'b1;
            data_32[23:16]=data_9_store[8:1];
            nxt_data=2'b10;  
        end
        if(b_r2==1'b1)begin
			     state_r2=27;
			     end
		       else begin
	         state_r2=26;
		    end
    end
    
    27:begin
        if(b_r2==1'b1)begin
			     state_r2=28;
			     end
		       else begin
	         state_r2=27;
		    end
    end
    
    
    28:begin
        if(b_r2==1'b1)begin
			     state_r2=29;
			     end
		       else begin
	         state_r2=28;
		    end
    end
    
    29:begin
        if(b_r2==1'b1)begin
			     state_r2=30;
			     end
		       else begin
	         state_r2=29;
		    end
    end
    
    30:begin
        if(b_r2==1'b1)begin
			     state_r2=31;
			     end
		       else begin
	         state_r2=30;
		    end
    end
    
    31:begin
        if(b_r2==1'b1)begin
			     state_r2=32;
			     end
		       else begin
	         state_r2=31;
		    end
    end
    
    32:begin
        if(b_r2==1'b1)begin
			     state_r2=33;
			     end
		       else begin
	         state_r2=32;
		    end
    end
    
    33:begin
        data_9_store=in_bus_9;
        if(b_r2==1'b1)begin
			     state_r2=34;
			     end
		       else begin
	         state_r2=33;
		    end
		   end 
    
    34:begin
        if(b_r2==1'b1)begin
			     state_r2=35;
			     end
		       else begin
	         state_r2=34;
		    end
    end
    
    35:begin
        if(b_r2==1'b1)begin
			     state_r2=36;
			     end
		       else begin
	         state_r2=35;
		    end
    end
    
    36:begin
        parity_r2_local=parity_r2(data_9_store[8:1]);
        if(b_r2==1'b1)begin
			     state_r2=37;
			     end
		       else begin
	         state_r2=36;
		    end
    end
    
    37:begin
        if(b_r2==1'b1)begin
			     state_r2=38;
			     end
		       else begin
	         state_r2=37;
		    end
    end
    
     38:begin
        if(b_r2==1'b1)begin
			     state_r2=39;
			     end
		       else begin
	         state_r2=38;
		    end
    end
    
     39:begin
        if(parity_r2_local==data_9_store[0])begin
            check_r2=1'b1;
            data_32[15:8]=data_9_store[8:1];
            nxt_data=2'b11;  
        end
        if(b_r2==1'b1)begin
			     state_r2=40;
			     end
		       else begin
	         state_r2=39;
		    end
    end
    
    40:begin
        if(b_r2==1'b1)begin
			     state_r2=41;
			     end
		       else begin
	         state_r2=40;
		    end
    end
    
    //here
    
    41:begin
        if(b_r2==1'b1)begin
			     state_r2=42;
			     end
		       else begin
	         state_r2=41;
		    end
    end
    
    42:begin
        if(b_r2==1'b1)begin
			     state_r2=43;
			     end
		       else begin
	         state_r2=42;
		    end
    end
    
    43:begin
        if(b_r2==1'b1)begin
			     state_r2=44;
			     end
		       else begin
	         state_r2=43;
		    end
    end
    
    44:begin
        if(b_r2==1'b1)begin
			     state_r2=45;
			     end
		       else begin
	         state_r2=44;
		    end
    end
    
    45:begin
        if(b_r2==1'b1)begin
			     state_r2=46;
			     end
		       else begin
	         state_r2=45;
		    end
    end
    
    46:begin
        data_9_store=in_bus_9;
        if(b_r2==1'b1)begin
			     state_r2=47;
			     end
		       else begin
	         state_r2=46;
		    end
		   end 
    
    47:begin
        if(b_r2==1'b1)begin
			     state_r2=48;
			     end
		       else begin
	         state_r2=47;
		    end
    end
    
    48:begin
        if(b_r2==1'b1)begin
			     state_r2=49;
			     end
		       else begin
	         state_r2=48;
		    end
    end
    
    49:begin
        parity_r2_local=parity_r2(data_9_store[8:1]);
        if(b_r2==1'b1)begin
			     state_r2=50;
			     end
		       else begin
	         state_r2=49;
		    end
    end
    
    50:begin
        if(b_r2==1'b1)begin
			     state_r2=51;
			     end
		       else begin
	         state_r2=50;
		    end
    end
    
     51:begin
        if(b_r2==1'b1)begin
			     state_r2=52;
			     end
		       else begin
	         state_r2=51;
		    end
    end
    
     52:begin
        if(parity_r2_local==data_9_store[0])begin
            check_r2=1'b1;
            data_32[7:0]=data_9_store[8:1];
            nxt_data=2'b11;  
        end
        if(b_r2==1'b1)begin
			     state_r2=53;
			     end
		       else begin
	         state_r2=52;
		    end
    end
    
    53:begin
      stored_data=data_32;
        if(b_r2==1'b1)begin
			     state_r2=54;
			     end
		       else begin
	         state_r2=53;
		    end
    end
    
    ////////here making stored data of 32 bits to pass back onto transmitter
    
    54:begin //for transmitter
		     if(b_r2==1'b1)begin
			   state_r2=55;
			  end
		    else begin
  	       state_r2=54;
		    end 
		   end
		   
		   55:begin //for transmitter
		        rst_r21=1'b0;
		     if(b_r2==1'b1)begin
			   state_r2=56;
			  end
		    else begin
  	       state_r2=55;
		    end 
		   end
		   
		   56:begin //for transmitter
		     ready_r21=1'b1;
		      if(b_r2==1'b1)begin
			   state_r2=57;
			  end
		    else begin
  	       state_r2=56;
		    end 
		   end 
		   
		   57:begin //for transmitter
		      if(ack_r21==1'b1)begin
		          check_r21=1'b1;
		        end
		       if(b_r2==1'b1)begin
			     state_r2=58;
			     end
		       else begin
  	         state_r2=57;
		    end 
		     end
		     
		     
		    58:begin  //for transmitter
              a1_r21=data_32[31:24];
              if(b_r2==1'b1)begin
			        state_r2=59;
			        end
		          else begin
  	           state_r2=58;
	            end
		      end
		      
		    59:begin  //for transmitter
		       parity_r21=parity_r2(a1_r21);
		          if(b_r2==1'b1)begin
			        state_r2=60;
			        end
		          else begin
  	           state_r2=59;
	            end
		    end  
		    
		    60:begin  //for transmitter
		        data_9_r2[8:1]=a1_r21;           
		        data_9_r2[0]=parity_r21;
		        		if(b_r2==1'b1)begin
			        state_r2=61;
			        end
		          else begin
  	           state_r2=60;
	            end
		      end
		      
		      61:begin  //for transmitter
		        	 if(b_r2==1'b1)begin
			        state_r2=62;
			        end
		          else begin
  	           state_r2=61;
	            end
		        end
		        
		        62: begin //for transmitter
		            if(nxt_data_r21==2'b01)begin
		                  a1_r21=data_32[23:16];
		        	          if(b_r2==1'b1)begin
			                 state_r2=63;
			                 end
		                   else begin
  	                    state_r2=62;
	                     end
		              end
		          end
		          
		         63:begin  //for transmitter
		            parity_r21=parity_r2(a1_r21);
		            if(b_r2==1'b1)begin
			           state_r2=64;
			         end
		            else begin
  	             state_r2=63;
	             end
		          end  
		          
		          64:begin  //for transmitter
		            data_9_r2[8:1]=a1_r21;
		            data_9_r2[0]=parity_r21;
		        	     if(b_r2==1'b1)begin
			           state_r2=65;
			           end
		              else begin
  	               state_r2=64;
	               end
		           end 
		           
		        65:begin  //for transmitter
		        	 if(b_r2==1'b1)begin
			        state_r2=66;
			        end
		          else begin
  	           state_r2=65;
	            end
		        end
		        
		        66: begin //for transmitter
		            if(nxt_data_r21==2'b10)begin
		                  a1_r21=data_32[15:8];
		        	          if(b_r2==1'b1)begin
			                 state_r2=67;
			                 end
		                   else begin
  	                    state_r2=66;
	                     end
		              end
		          end
		          
		        67:begin  //for transmitter
		            parity_r21=parity_r2(a1_r21);
		            if(b_r2==1'b1)begin
			           state_r2=68;
			         end
		            else begin
  	             state_r2=67;
	             end
		          end 
		          
		        68:begin  //for transmitter
		            data_9_r2[8:1]=a1_r21;
		            data_9_r2[0]=parity_r21;
		        	     if(b_r2==1'b1)begin
			           state_r2=69;
			           end
		              else begin
  	               state_r2=68;
	               end
		           end  
		           
		        69:begin  //for transmitter
		        	 if(b_r2==1'b1)begin
			        state_r2=70;
			        end
		          else begin
  	           state_r2=69;
	            end
		        end 
		        
		        70: begin //for transmitter
		            if(nxt_data_r21==2'b11)begin
		                  a1_r21=data_32[7:0];
		        	          if(b_r2==1'b1)begin
			                 state_r2=71;
			                 end
		                   else begin
  	                    state_r2=70;
	                     end
		              end
		          end
		          
		        71:begin  //for transmitter
		            parity_r21=parity_r2(a1_r21);
		            if(b_r2==1'b1)begin
			           state_r2=72;
			         end
		            else begin
  	             state_r2=71;
	             end
		          end 
		          
		        72:begin  //for transmitter
		            data_9_r2[8:1]=a1_r21;
		            data_9_r2[0]=parity_r21;
		        	     if(b_r2==1'b1)begin
			           state_r2=73;
			           end
		              else begin
  	               state_r2=72;
	               end
		           end  
		           
		        73:begin  //for transmitter
		        	 if(b_r2==1'b1)begin
			        state_r2=73;
			        end
		          else begin
  	           state_r2=73;
	            end
		        end  
		        
    
    
          default: begin
            b_r2=1'b1;
          end
  
  endcase
end
end
endmodule    
    
    
