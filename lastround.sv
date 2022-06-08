module lastround(
    input logic clk,
    input logic [3:0] rc,
    input logic [127:0] round_in,
    input logic [127:0] last_key_in,
    output logic [127:0] final_out
);

logic [127:0] s1, s2, s3, out_key;

key_gen k1 (rc, last_key_in, out_key);
sub_bytes k2 (round_in, s1);
shift_row k3 (s1, s2);

assign final_out = out_key ^ s2;

endmodule