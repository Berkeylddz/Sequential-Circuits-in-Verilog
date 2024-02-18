`timescale 1ns / 1ps

module machine_jk_tb;
    reg x, CLK, RESET;
    wire F;
    wire [2:0] S;

    // Instantiate machine_jk module
    machine_jk JK_DUT (
        .x(x),
        .CLK(CLK),
        .RESET(RESET),
        .F(F),
        .S(S)
    );

    // Clock generation
    initial begin
        CLK = 0;
        forever #5 CLK = ~CLK; // Assuming a 10ns clock period
    end

    // Reset generation
    initial begin
        RESET = 1; // Assuming active-high reset
        #10 RESET = 0;
    end

    // Stimulus generation
    initial begin
        // Your input stimulus goes here
        // For example:
        // #20 x = 1; // Set input x to 1 after 20 time units
        // #30 x = 0; // Set input x to 0 after 30 time units
        // ...

        // You can continue adding more stimulus as needed.
    end

    // Monitor the outputs
    always @(posedge CLK) begin
        // Display the outputs at every rising edge of the clock
        $display("Time=%t, F=%b, S=%b", $time, F, S);
    end

endmodule
