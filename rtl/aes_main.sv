// This module is the top file for the AES-128 implementation

module aes_main(
    input logic clk,
    input logic [127:0] input_data,
    input logic [127:0] key,
    output logic [7:0] dataout
);

logic [127:0] temp_out;

aes_cip d1 (
    .clk(clk),
    .input_data(input_data),
    .key(key),
    .output_data(temp_out)
);

assign dataout = temp_out[127:120];

endmodule
