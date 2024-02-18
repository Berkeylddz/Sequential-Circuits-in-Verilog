`timescale 1ns / 1ps

module machine_d_tb();

    reg x, rst, clk;
    wire F;
    
    machine_d circuit(.x(x), .rst(rst), .clk(clk), .F(F));
    // clock initialize
    initial clk = 1;
    always #5 clk = ~clk;
    
    initial begin
            x = 0;
        #22 x = 1;
        #10 x = 0;
        #30 x = 1;
        #30 x = 0;
        #60 x = 1;
        #40 x = 0;
        #25
        $finish;
    end
    // reset initialize
    initial begin 
            rst = 1;
        #27 rst = 0;
        #93 rst = 1;
        #2  rst = 0;
    end
endmodule