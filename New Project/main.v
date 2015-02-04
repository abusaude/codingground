module main;
reg [1:0] s;
wire [3:0] num1=4'b0000;
wire [3:0] num2=4'b0001;
wire [3:0] num3=4'b0010;
wire [3:0] num4=4'b0011;
wire [3:0] result2, result4;

mux4 m4(num1,num2,num3,num4,s,result4);
mux2 m2(num1,num2,s[1],result2);
  initial 
    begin
      $display("Hello, World");

      #10 $monitor("time:%g",$time," s= %b",s," r2 = %b", result2," r4 = %b", result4 );
      s=0; #10;
      s=1; #10;
      s=2; #10;
      s=3; #10;
      
      $finish ;
    end
endmodule

module mux2( input [3:0] a,b,
             input s,
             output [3:0] y);
    reg y;
    assign y=s ? b : a;
endmodule

module mux4( input [3:0] d0,d1,d2,d3,
             input [1:0] s,
             output [3:0] y);
    //wire [1:0] s1;
    reg y;
    wire [3:0] h,l;
   /* mux2 m1(d0,d1,s[0],l);
    mux2 m2(d2,d3,s[0],h);
    mux2 m3(l,h,s[1],y);*/
    always @(s[1]) begin
    if (s[1]==1'b1) 
         // y=d0;
        mux2 m1(d0,d1,s[0],y);
     else 
         mux2 m2(d2,d3,s[0],y);
         // y=d3;
     end
        //assign y=s[1] ? d0 : d3;
        //mux2 m2(d2,d3,s[0],y);
        
       
endmodule
