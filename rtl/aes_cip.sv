// This module holds the entire block cipher of AES

module aes_cip(
    input logic clk,
    input logic [127:0] input_data,
    output logic [127:0] key,
    output logic [127:0] output_data
);

logic [127:0] round_out_0;
logic [127:0] round_out_1;
logic [127:0] round_out_2;
logic [127:0] round_out_3;
logic [127:0] round_out_4;
logic [127:0] round_out_5;
logic [127:0] round_out_6;
logic [127:0] round_out_7;
logic [127:0] round_out_8;
logic [127:0] round_out_9;

logic [127:0] key_out_1;
logic [127:0] key_out_2;
logic [127:0] key_out_3;
logic [127:0] key_out_4;
logic [127:0] key_out_5;
logic [127:0] key_out_6;
logic [127:0] key_out_7;
logic [127:0] key_out_8;
logic [127:0] key_out_9;

assign round_out_0 = input_data ^ key; // XOR Rounding in the zeroth output

round r1 (.clk(clk), .rc(4'b0000), .data(round_out_0), .in_key(key), .out_key(key_out_1), .round_out(round_out_1));
round r2 (.clk(clk), .rc(4'b0001), .data(round_out_1), .in_key(key_out_1), .out_key(key_out_2), .round_out(round_out_2));
round r3 (.clk(clk), .rc(4'b0010), .data(round_out_2), .in_key(key_out_2), .out_key(key_out_3), .round_out(round_out_3));
round r4 (.clk(clk), .rc(4'b0011), .data(round_out_3), .in_key(key_out_3), .out_key(key_out_4), .round_out(round_out_4));
round r5 (.clk(clk), .rc(4'b0100), .data(round_out_4), .in_key(key_out_4), .out_key(key_out_5), .round_out(round_out_5));
round r6 (.clk(clk), .rc(4'b0101), .data(round_out_5), .in_key(key_out_5), .out_key(key_out_6), .round_out(round_out_6));
round r7 (.clk(clk), .rc(4'b0110), .data(round_out_6), .in_key(key_out_6), .out_key(key_out_7), .round_out(round_out_7));
round r8 (.clk(clk), .rc(4'b0111), .data(round_out_7), .in_key(key_out_7), .out_key(key_out_8), .round_out(round_out_8));
round r9 (.clk(clk), .rc(4'b1000), .data(round_out_8), .in_key(key_out_8), .out_key(key_out_9), .round_out(round_out_9));
roundlast r10 (.clk(clk), .rc(4'b1001), .round_in(round_out_9), .last_key_in(key_out_9), .final_out(output_data));

endmodule