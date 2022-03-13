`timescale 1ns / 1ps

module tb ();

reg clk;
reg btnC;
reg [0:0] sw;
wire [15:0] led;


initial clk = 0;
initial forever #5 clk = ~clk;

initial
  begin
         sw[0:0] <= 1;
#1000    sw[0:0] <= 0;
#6000    $display("made it to 6000 @ %t", $time);
#5000 	 btnC <= 1;
#1000    btnC <= 0;
#5000   $finish;
  end

always @(led)
    $display("led = %x at time %t", led, $time);

counter counter (
                 .clk(clk),
                 .sw(sw),
		 .btnC(btnC),
                 .led(led));


initial 
    $dumpfile("verilog.dmp");

initial
    $dumpvars;


endmodule
