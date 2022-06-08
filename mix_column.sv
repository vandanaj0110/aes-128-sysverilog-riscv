// This module is to mix up the columns of the 16 bit wide 2d array.

module mix_column(
    input logic [127:0] in1,
    output logic [127:0] s3
);

assign s3[127:120] = mix_column_func (in1[127:120], in1[119:112], in1[111:104], in1[103:96]);
assign s3[119:112] = mix_column_func (in1[119:112], in1[111:104], in1[103:96], in1[127:120]);
assign s3[111:104] = mix_column_func (in1[111:104], in1[103:96], in1[127:120], in1[119:112]);
assign s3[103:96] = mix_column_func (in1[103:96], in1[127:120], in1[119:112], in1[111:104]);

assign s3[95:88] = mix_column_func (in1[95:88], in1[87:80], in1[79:72], in1[71:64]);
assign s3[87:80] = mix_column_func (in1[87:80], in1[79:72], in1[71:64], in1[95:88]);
assign s3[79:72] = mix_column_func (in1[79:72], in1[71:64], in1[95:88], in1[87:80]);
assign s3[71:64] = mix_column_func (in1[71:64], in1[95:88], in1[87:80], in1[79:72]);

assign s3[63:56] = mix_column_func (in1[63:56], in1[55:48], in1[47:40], in1[39:32]);
assign s3[55:48] = mix_column_func (in1[55:48], in1[47:40], in1[39:32], in1[63:56]);
assign s3[47:40] = mix_column_func (in1[47:40], in1[39:32], in1[63:56], in1[55:48]);
assign s3[39:32] = mix_column_func (in1[39:32], in1[63:56], in1[55:48], in1[47:40]);

assign s3[31:24] = mix_column_func (in1[31:24], in1[23:16], in1[15:8], in1[7:0]);
assign s3[23:16] = mix_column_func (in1[23:16], in1[15:8], in1[7:0], in1[31:24]);
assign s3[15:8] = mix_column_func (in1[15:8], in1[7:0], in1[31:24], in1[23:16]);
assign s3[7:0] = mix_column_func (in1[7:0], in1[31:24], in1[23:16], in1[15:8]);

function [7:0] mix_column_func;
    input logic [7:0] i1, i2, i3, i4;
    begin 
        mix_column_func[7] = i1[6] ^ i2[6] ^ i2[7] ^ i3[7] ^ i4[7];
        mix_column_func[6] = i1[5] ^ i2[5] ^ i2[6] ^ i3[6] ^ i4[6];
        mix_column_func[5] = i1[4] ^ i2[4] ^ i2[5] ^ i3[5] ^ i4[5];
        mix_column_func[4] = i1[3] ^ i1[7] ^ i2[3] ^ i2[4] ^ i2[7] ^ i3[4] ^ i4[4];
        mix_column_func[3] = i1[2] ^ i1[7] ^ i2[2] ^ i2[3] ^ i2[7] ^ i3[3] ^ i4[3];
        mix_column_func[2] = i1[1] ^ i2[1] ^ i2[2] ^ i3[2] ^ i4[2];
        mix_column_func[1] = i1[0] ^ i1[7] ^ i2[0] ^ i2[1] ^ i2[7] ^ i3[1] ^ i4[1];
        mix_column_func[0] = i1[7] ^ i2[7] ^ i2[0] ^ i3[0] ^ i4[0];
    end
endfunction

endmodule
