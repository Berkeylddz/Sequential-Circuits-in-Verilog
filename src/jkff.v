module jkff (
    input J,      // Data input
    input K,      // Data input
    input CLK,    // Clock input
    input RESET,  // Asynchronous reset, active high
    output reg Q  // Output
);

    always @(posedge CLK or posedge RESET) begin
        if (RESET) begin
            Q <= 1'b0; // Reset the flip-flop
        end else begin
            if (J && K) begin
                // Do nothing when both J and K are asserted
            end else if (J) begin
                Q <= 1'b1; // Set Q when J is asserted
            end else if (K) begin
                Q <= 1'b0; // Reset Q when K is asserted
            end else begin
                Q <= Q; // No change when both J and K are deasserted
            end
        end
    end

endmodule

