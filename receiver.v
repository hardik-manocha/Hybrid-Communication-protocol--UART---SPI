`timescale 1ns / 1ps
module receiver(
    input select,clk,ready,rst,
    input [8:0]in_bus_9,
    output reg ack,
    output reg [1:0]nxt_data,
    output reg [31:0]stored_data,
    output reg ready_r2,
    output reg rst_r2,
    input  ack_r2,
    output reg [8:0]data_9,
    input [1:0]nxt_data_r
    );
	 
reg [7:0]state_r;
reg [8:0]in_bus_9_r;
reg def;	
reg [31:0]data_store;
reg b=1;
reg parity1_r;
reg check1;
reg [1:0]status_datastore;

//reg ready_r2; //receiver2 
//reg rst_r2; //receiver2
//wire ack_r2; //receiver2
reg check_r2; //receiver2
wire [31:0]data_31;  //receiver2
//wire [1:0]nxt_data_r; //receiver2
reg [7:0]a1;  //receiver2
reg parity_r2;  //receiever2
//reg [8:0]data_9;  //receiver2

function parity_r;
input [7:0]a1;
integer i;
begin
	parity_r=0;
	for(i=0;i<8;i=i+1)begin
	  parity_r=parity_r^a1[i];
	 end
end
endfunction

//receiver2 r2 (clk,ready_r2,rst_r2,data_9,ack_r2,nxt_data_r,data_31);  //receiver2
 
always @(clk,ready,in_bus_9)begin
  
  if(rst)begin
    state_r=0;
    status_datastore=0;
    rst_r2=1'b1;
  end
  else begin
  
  case (state_r)
    0:begin

		    if(b==1'b1)begin
			   state_r=1;
			  end
			  else 
			   state_r=0;
		   end	
    
    1:begin

		    if(b==1'b1)begin
			   state_r=2;
			  end
			  else 
			   state_r=1;
		   end	
    
    2:begin

		    if(b==1'b1)begin
			   state_r=3;
			  end
			  else 
			   state_r=2;
		   end	
    
    3:begin

		    if(b==1'b1)begin
			   state_r=4;
			  end
			  else 
			   state_r=3;
		   end	
    
    4:begin

		    if(b==1'b1)begin
			   state_r=5;
			  end
			  else 
			   state_r=4;
		   end	
    
    5:begin

		    if(b==1'b1)begin
			   state_r=6;
			  end
			  else 
			   state_r=5;
		   end	
    
    6:begin

		    if(b==1'b1)begin
			   state_r=7;
			  end
			  else 
			   state_r=6;
		   end	
    
    7:begin

		    if(b==1'b1)begin
			   state_r=8;
			  end
			  else 
			   state_r=7;
		   end	
    
    8:begin

		    if(b==1'b1)begin
			   state_r=9;
			  end
			  else 
			   state_r=8;
		   end	
    
    9:begin

		    if(b==1'b1)begin
			   state_r=10;
			  end
			  else 
			   state_r=9;
		   end	
    
    10:begin

		    if(b==1'b1)begin
			   state_r=11;
			  end
			  else 
			   state_r=10;
		   end	
    
    11:begin

		    if(b==1'b1)begin
			   state_r=12;
			  end
			  else 
			   state_r=11;
		   end	
    
    12:begin

		    if(b==1'b1)begin
			   state_r=13;
			  end
			  else 
			   state_r=12;
		   end	
    
    13:begin

		    if(b==1'b1)begin
			   state_r=14;
			  end
			  else 
			   state_r=13;
		   end	
    
    14:begin

		    if(b==1'b1)begin
			   state_r=15;
			  end
			  else 
			   state_r=14;
		   end	
    
    15:begin

		    if(b==1'b1)begin
			   state_r=16;
			  end
			  else 
			   state_r=15;
		   end	
    
    16:begin

		    if(b==1'b1)begin
			   state_r=17;
			  end
			  else 
			   state_r=16;
		   end	
    
    17:begin

		    if(b==1'b1)begin
			   state_r=18;
			  end
			  else 
			   state_r=17;
		   end	
    
    18:begin

		    if(b==1'b1)begin
			   state_r=19;
			  end
			  else 
			   state_r=18;
		   end	
    
    19:begin
      if(ready==1)begin
			  ack=1'b1;
			end
			if(b==1'b1)begin
			  state_r=20;
			end
			else 
			  state_r=19;
		  end	
		  
		  
		
		20:begin
		   $display("reached here");
		    in_bus_9_r=in_bus_9;
		    if(b==1'b1)begin
			   state_r=21;
			  end
			  else 
			   state_r=20;
		   end	
		    
		 21:begin
		    parity1_r=parity_r(in_bus_9_r[8:1]);
		    if(b==1'b1)begin
			   state_r=22;
			  end
			  else 
			   state_r=21;
		 end 
		 
		 22:begin
		    if(parity1_r==in_bus_9_r[0])begin
		      check1=1'b1;
		      end
		      if(b==1'b1)begin
			    state_r=23;
			    end
		      else begin
  	       state_r=22;
		    end 
		      
		 end  
		 
		 23: begin
		   //set of first 8 bits
		    if(status_datastore==2'b00)begin
		    data_store[31:24]=in_bus_9_r[8:1];
		    status_datastore=2'b01;
		    nxt_data=2'b01;
		    end
		    
		    if(b==1'b1)begin
			    state_r=24;
			    end
		      else begin
  	       state_r=23;
		    end 
		  end
		  
		  //second packet starts
		  
		  24: begin
		      if(b==1'b1)begin
			    state_r=25;
			    end
		      else begin
  	       state_r=24;
		      end 
		   end
		   
		   25: begin
		      if(b==1'b1)begin
			    state_r=26;
			    end
		      else begin
  	       state_r=25;
		      end 
		   end
		   
		   26: begin
		      if(b==1'b1)begin
			    state_r=27;
			    end
		      else begin
  	       state_r=26;
		      end 
		   end
		   
		   27: begin
		      if(b==1'b1)begin
			    state_r=28;
			    end
		      else begin
  	       state_r=27;
		      end 
		   end
		   
		   28: begin
		      if(b==1'b1)begin
			    state_r=29;
			    end
		      else begin
  	       state_r=28;
		      end 
		   end
		   
		   
		   
		   29: begin
		      if(b==1'b1)begin
			    state_r=30;
			    end
		      else begin
  	       state_r=29;
		      end 
		   end
		   
		   30: begin
		      if(b==1'b1)begin
			    state_r=31;
			    end
		      else begin
  	       state_r=30;
		      end 
		   end
		   
		   31: begin
		     in_bus_9_r=in_bus_9;
		      if(b==1'b1)begin
			    state_r=32;
			    end
		      else begin
  	       state_r=31;
		      end 
		   end
		   
		   32: begin
		      parity1_r=parity_r(in_bus_9_r[8:1]);
		      if(b==1'b1)begin
			    state_r=33;
			    end
		      else begin
  	       state_r=32;
		      end 
		   end
		   
		   33: begin
		      if(parity1_r==in_bus_9_r[0])begin
		      check1=1'b1;
		      end
		      if(b==1'b1)begin
			    state_r=34;
			    end
		      else begin
  	       state_r=33;
		      end 
		   end
		   
		   34: begin
		      if(b==1'b1)begin
			    state_r=35;
			    end
		      else begin
  	       state_r=34;
		      end 
		   end
		  
		  35: begin 
		    //set second 8 bits
		    if(status_datastore==2'b01)begin
		    data_store[23:16]=in_bus_9_r[8:1];
		    status_datastore=2'b10;
		    nxt_data=2'b10;
		    end
		    
		    if(b==1'b1)begin
			   state_r=36;
			  end
		    else begin
  	       state_r=35;
		    end 
		   end 
		   
		   /////////////for 3rd set of 8 bits
		   36: begin
		      if(b==1'b1)begin
			    state_r=37;
			    end
		      else begin
  	       state_r=36;
		      end 
		   end
		   
		   37: begin
		      if(b==1'b1)begin
			    state_r=38;
			    end
		      else begin
  	       state_r=37;
		      end 
		   end
		   
		   38: begin
		      if(b==1'b1)begin
			    state_r=39;
			    end
		      else begin
  	       state_r=38;
		      end 
		   end
		   
		   39: begin
		      if(b==1'b1)begin
			    state_r=40;
			    end
		      else begin
  	       state_r=39;
		      end 
		   end
		   
		   40: begin
		      if(b==1'b1)begin
			    state_r=41;
			    end
		      else begin
  	       state_r=40;
		      end 
		   end
		   
		   
		   
		   41: begin
		      if(b==1'b1)begin
			    state_r=42;
			    end
		      else begin
  	       state_r=41;
		      end 
		   end
		   
		   42: begin
		      if(b==1'b1)begin
			    state_r=43;
			    end
		      else begin
  	       state_r=42;
		      end 
		   end
		   
		   43: begin
		     in_bus_9_r=in_bus_9;
		      if(b==1'b1)begin
			    state_r=44;
			    end
		      else begin
  	       state_r=43;
		      end 
		   end
		   
		   44: begin
		      parity1_r=parity_r(in_bus_9_r[8:1]);
		      if(b==1'b1)begin
			    state_r=45;
			    end
		      else begin
  	       state_r=44;
		      end 
		   end
		   
		   45: begin
		      if(parity1_r==in_bus_9_r[0])begin
		      check1=1'b1;
		      end
		      if(b==1'b1)begin
			    state_r=46;
			    end
		      else begin
  	       state_r=45;
		      end 
		   end
		   
		   46: begin
		      if(b==1'b1)begin
			    state_r=47;
			    end
		      else begin
  	       state_r=46;
		      end 
		   end
		   
		   47: begin 
		    
		    if(status_datastore==2'b10)begin
		    data_store[15:8]=in_bus_9_r[8:1];
		    status_datastore=2'b11;
		    nxt_data=2'b11;
		    end
		    
		    if(b==1'b1)begin
			   state_r=48;
			  end
		    else begin
  	       state_r=47;
		    end 
		   end 
		   
		   48: begin
		      if(b==1'b1)begin
			    state_r=49;
			    end
		      else begin
  	       state_r=48;
		      end 
		   end
		   
		   49: begin
		      if(b==1'b1)begin
			    state_r=50;
			    end
		      else begin
  	       state_r=49;
		      end 
		   end
		   
		   50: begin
		      if(b==1'b1)begin
			    state_r=51;
			    end
		      else begin
  	       state_r=50;
		      end 
		   end
		   
		   51: begin
		      if(b==1'b1)begin
			    state_r=52;
			    end
		      else begin
  	       state_r=51;
		      end 
		   end
		   
		   52: begin
		      if(b==1'b1)begin
			    state_r=53;
			    end
		      else begin
  	       state_r=52;
		      end 
		   end
		   
		   
		   
		   53: begin
		      if(b==1'b1)begin
			    state_r=54;
			    end
		      else begin
  	       state_r=53;
		      end 
		   end
		   
		   54: begin
		      if(b==1'b1)begin
			    state_r=55;
			    end
		      else begin
  	       state_r=54;
		      end 
		   end
		   
		   55: begin
		      in_bus_9_r=in_bus_9;
		      if(b==1'b1)begin
			    state_r=56;
			    end
		      else begin
  	       state_r=55;
		      end 
		   end
		   
		   56: begin
		      parity1_r=parity_r(in_bus_9_r[8:1]);
		      if(b==1'b1)begin
			    state_r=57;
			    end
		      else begin
  	       state_r=56;
		      end 
		   end
		   
		   57: begin
		      if(parity1_r==in_bus_9_r[0])begin
		      check1=1'b1;
		      end
		      if(b==1'b1)begin
			    state_r=58;
			    end
		      else begin
  	       state_r=57;
		      end 
		   end
		   
		   58: begin
		      if(b==1'b1)begin
			    state_r=59;
			    end
		      else begin
  	       state_r=58;
		      end 
		   end
		   
		   59: begin 
		    
		    if(status_datastore==2'b11)begin
		    data_store[7:0]=in_bus_9_r[8:1];
		    status_datastore=2'b11;
		    nxt_data=2'b11;
		    stored_data=data_store;
		    end
		    
		    if(b==1'b1 & select==1'b1)begin
			   state_r=60;
			  end
		    else begin
  	       state_r=59;
		    end 
		   end 
		   
		   //till these statees uart is runned.
		   
		   60:begin //receiver2
		     if(b==1'b1)begin
			   state_r=61;
			  end
		    else begin
  	       state_r=60;
		    end 
		   end
		   
		   61:begin //receiver2
		        rst_r2=1'b0;
		     if(b==1'b1)begin
			   state_r=62;
			  end
		    else begin
  	       state_r=61;
		    end 
		   end
		   
		   62:begin //receiver2
		     ready_r2=1'b1;
		      if(b==1'b1)begin
			   state_r=63;
			  end
		    else begin
  	       state_r=62;
		    end 
		   end 
		   
		   63:begin //receiver2
		      if(ack_r2==1'b1)begin
		          check_r2=1'b1;
		        end
		       if(b==1'b1)begin
			     state_r=64;
			     end
		       else begin
  	         state_r=63;
		    end 
		     end
		     
		     
		    64:begin  //receiver2
              a1=data_store[31:24];
              if(b==1'b1)begin
			        state_r=65;
			        end
		          else begin
  	           state_r=64;
	            end
		      end
		      
		    65:begin  //receiver2
		       parity_r2=parity_r(a1);
		          if(b==1'b1)begin
			        state_r=66;
			        end
		          else begin
  	           state_r=65;
	            end
		    end  
		    
		    66:begin  //receiver2
		        data_9[8:1]=a1;
		        data_9[0]=parity_r2;
		        		if(b==1'b1)begin
			        state_r=67;
			        end
		          else begin
  	           state_r=66;
	            end
		      end
		      
		      67:begin  //receiver2
		        	 if(b==1'b1)begin
			        state_r=68;
			        end
		          else begin
  	           state_r=67;
	            end
		        end
		        
		        68: begin //receiver2
		            if(nxt_data_r==2'b01)begin
		                  a1=data_store[23:16];
		        	          if(b==1'b1)begin
			                 state_r=69;
			                 end
		                   else begin
  	                    state_r=68;
	                     end
		              end
		          end
		          
		         69:begin  //receiver2
		            parity_r2=parity_r(a1);
		            if(b==1'b1)begin
			           state_r=70;
			         end
		            else begin
  	             state_r=69;
	             end
		          end  
		          
		          70:begin  //receiver2
		            data_9[8:1]=a1;
		            data_9[0]=parity_r2;
		        	     if(b==1'b1)begin
			           state_r=71;
			           end
		              else begin
  	               state_r=70;
	               end
		           end 
		           
		        71:begin  //receiver2
		        	 if(b==1'b1)begin
			        state_r=72;
			        end
		          else begin
  	           state_r=71;
	            end
		        end
		        
		        72: begin //receiver2
		            if(nxt_data_r==2'b10)begin
		                  a1=data_store[15:8];
		        	          if(b==1'b1)begin
			                 state_r=73;
			                 end
		                   else begin
  	                    state_r=72;
	                     end
		              end
		          end
		          
		        73:begin  //receiver2
		            parity_r2=parity_r(a1);
		            if(b==1'b1)begin
			           state_r=74;
			         end
		            else begin
  	             state_r=73;
	             end
		          end 
		          
		        74:begin  //receiver2
		            data_9[8:1]=a1;
		            data_9[0]=parity_r2;
		        	     if(b==1'b1)begin
			           state_r=75;
			           end
		              else begin
  	               state_r=74;
	               end
		           end  
		           
		        75:begin  //receiver2
		        	 if(b==1'b1)begin
			        state_r=76;
			        end
		          else begin
  	           state_r=75;
	            end
		        end 
		        
		        76: begin //receiver2
		            if(nxt_data_r==2'b11)begin
		                  a1=data_store[7:0];
		        	          if(b==1'b1)begin
			                 state_r=77;
			                 end
		                   else begin
  	                    state_r=76;
	                     end
		              end
		          end
		          
		        77:begin  //receiver2
		            parity_r2=parity_r(a1);
		            if(b==1'b1)begin
			           state_r=78;
			         end
		            else begin
  	             state_r=77;
	             end
		          end 
		          
		        78:begin  //receiver2
		            data_9[8:1]=a1;
		            data_9[0]=parity_r2;
		        	     if(b==1'b1)begin
			           state_r=79;
			           end
		              else begin
  	               state_r=78;
	               end
		           end  
		           
		        79:begin  //receiver2
		        	 if(b==1'b1)begin
			        state_r=79;
			        end
		          else begin
  	           state_r=79;
	            end
		        end  
		        
		         
		        
		   
		 
		 default : begin
		    def=1'b1;
		   end
		   
		endcase//of case
		end
		
end//of always
endmodule