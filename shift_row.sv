// This module is to shift rows left descending down the array.

module shift_row(
    input logic [127:0] s1,
    output logic [127:0] s2
);

assign s2[127:120] = s1[127:120];
assign s2[119:112] = s1[87:80];
assign s2[111:104] = s1[47:40];
assign s2[103:96] = s1[7:0];

assign s2[95:88] = s1[95:88];
assign s2[87:80] = s1[55:48];
assign s2[79:72] = s1[15:8];
assign s2[71:64] = s1[103:96];

assign s2[63:56] = s1[63:56];
assign s2[55:48] = s1[23:16];
assign s2[47:40] = s1[111:104];
assign s2[39:32] = s1[71:64];

assign s2[31:24] = s1[31:24];
assign s2[23:16] = s1[119:112];
assign s2[15:8] = s1[79:72];
assign s2[7:0] = s1[39:32];

endmodule
