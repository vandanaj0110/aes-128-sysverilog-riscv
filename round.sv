// This module is for the rounding operation. 
// For a 128 bit impl, there will be 10 rounds. 
// For a 64 bit impl, there will be 6 rounds.

module round(
    input logic clk,
    input logic [3:0] rc,
    input logic [127:0] data,
    input logic [127:0] in_key,
    output logic [127:0] out_key,
    output logic [127:0] round_out
);

logic [127:0] s1, s2, s3;

key_gen k1 (rc, in_key, out_key);
sub_bytes k2 (data, s1);
shift_row k3 (s1, s2);
mix_column k4 (s2, s3);

assign round_out = out_key ^ s3; 

endmodule
