// this module generates the key

module key_gen(
    input logic [3:0] rc,
    input logic [127:0] key,
    output logic [127:0] out_key
);

logic [31:0] word0, word1, word2, word3, temp;

assign word0 = key[127:96];
assign word1 = key[95:64];
assign word2 = key[63:32];
assign word3 = key[31:0];

assign out_key[127:96] = word0 ^ temp ^ rcon(rc);
assign out_key[95:64] = word0 ^ temp ^ rcon(rc) ^ word1;
assign out_key[63:32] = word0 ^ temp ^ rcon(rc) ^ word1 ^ word2;
assign out_key[31:0] = word0 ^ temp ^ rcon(rc) ^ word1 ^ word2 ^ word3;

s_box s1 (.a(word3[23:16]), .c(temp[31:24]));
s_box s2 (.a(word3[15:8]), .c(temp[23:16]));
s_box s3 (.a(word3[7:0]), .c(temp[15:8]));
s_box s4 (.a(word3[31:24]), .c(temp[7:0]));

function [31:0] rcon;
    input logic [3:0] rc;
    case(rc)
        4'h0: rcon=32'h01000000;
        4'h1: rcon=32'h02000000;
        4'h2: rcon=32'h04000000;
        4'h3: rcon=32'h08000000;
        4'h4: rcon=32'h10000000;
        4'h5: rcon=32'h20000000;
        4'h6: rcon=32'h40000000;
        4'h7: rcon=32'h80000000;
        4'h8: rcon=32'h1b000000;
        4'h9: rcon=32'h36000000;
        default: rcon=32'h00000000;
    endcase
endfunction

endmodule
