module dff (
    input D,      // Data input
    input CLK,    // Clock input
    input RESET,  // Asynchronous reset, active high
    output reg Q  // Output
);
    // D flip-flop logic
    always @(posedge CLK or posedge RESET) begin
        if (RESET) begin
            Q <= 1'b0; // Asynchronous reset
        end else begin
            Q <= D;    // Flip-flop operation
        end
    end
endmodule
