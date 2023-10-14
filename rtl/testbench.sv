module tb_shift_row;
reg [127:0]s1;
wire [127:0]s2;
shift_row dut(
	.s1(s1);
	.s2(s2)
);
initial begin
	$display("Simulation started");
	s1=128'b1011010100101001011001010110001001111001100111010010100101011001;
	#5;
	if (s2 !== s1) $display("Test 1 failed");
        else $display("Test 1 passed");

        // Test case 2: Shifting by 1
        s1 = 128'b1011010100101001011001010110001001111001100111010010100101011001;
        #5;
        // Expected result after shifting by 1
        if (s2 !== 128'b0101101010010100101100101011000100111100110011101001010010101100) $display("Test 2 failed");
        else $display("Test 2 passed");

        // Test case 3: Shifting by 2
        s1 = 128'b1011010100101001011001010110001001111001100111010010100101011001;
        #5;
        // Expected result after shifting by 2
        if (s2 !== 128'b1010110101001010010110010101100010011110011001110100101001010110) $display("Test 3 failed");
        else $display("Test 3 passed");

        // Additional test cases can be added for different shift amounts.

        $display("Simulation completed");
        $finish;
    end

endmodule
