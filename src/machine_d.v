module machine_d(
    input wire x,
    input wire CLK,
    input wire RESET,
    output wire F,
    output wire [2:0] S
);
	
	
    	wire D_input_not1, D_input_or1, D_input_and1;

    	not not1(D_input_not1,x);
	and and1(D_input_and1 , S[1], D_input_not1);
	or or1(D_input_or1, D_input_and1, S[2]);

	
	wire D_input_not2,D_input_not3, D_input_or2, D_input_and2,D_input_and3,D_input_and4;

	not not2(D_input_not2,x);
	not not3(D_input_not3,S[1]);
	and and2(D_input_and2, D_input_not2,D_input_not3);
	and and3(D_input_and3, S[1], x);
	and and4(D_input_and4, S[2],S[1]);
	or or2(D_input_or2, D_input_and2, D_input_and3, D_input_and4);
	
	
	wire D_input_not4,D_input_not5, D_input_or3, D_input_and5,D_input_and6;

	not not4(D_input_not4,x);
	not not5(D_input_not5,S[0]);
	and and5(D_input_and5, D_input_not5, x);
	and and6(D_input_and6, S[0], D_input_not4);
	or or3(D_input_or3, D_input_and5,D_input_and6);
	

	dff flip_flop_0(.D(D_input_or3), .RESET(RESET), .CLK(CLK), .Q(S[0])); // C Flip-Flop
	dff flip_flop_1(.D(D_input_or2), .RESET(RESET), .CLK(CLK), .Q(S[1])); // B Flip-Flop
	dff flip_flop_2(.D(D_input_or1), .RESET(RESET), .CLK(CLK), .Q(S[2])); // A Flip-Flop
	
	wire and11,not11,and12;
	not not6(not11,S[0]);
	and and7(F, S[2],S[1],not11);
	
	

    // Your code goes here.  DO NOT change anything that is already given! Otherwise, you will not be able to pass the tests!
endmodule

