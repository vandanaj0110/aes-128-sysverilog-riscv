// This module is to substitute bytes in the array

module sub_bytes(
    input logic [127:0] in_data,
    output logic [127:0] s1
);

    s_box ss1 (.a(in_data[127:120]), .c(s1[127:120]));  
    s_box ss2 (.a(in_data[119:112]), .c(s1[119:112]));
    s_box ss3 (.a(in_data[111:104]), .c(s1[111:104]));
    s_box ss4 (.a(in_data[103:96]), .c(s1[103:96]));

    s_box ss5 (.a(in_data[95:88]), .c(s1[95:88]));
    s_box ss6 (.a(in_data[87:80]), .c(s1[87:80]));
    s_box ss7 (.a(in_data[79:72]), .c(s1[79:72]));
    s_box ss8 (.a(in_data[71:64]), .c(s1[71:64]));

    s_box ss9 (.a(in_data[63:56]), .c(s1[63:56]));
    s_box ss10 (.a(in_data[55:48]), .c(s1[55:48]));
    s_box ss11 (.a(in_data[47:40]), .c(s1[47:40]));
    s_box ss12 (.a(in_data[39:32]), .c(s1[39:32]));

    s_box ss13 (.a(in_data[31:24]), .c(s1[31:24]));
    s_box ss14 (.a(in_data[23:16]), .c(s1[23:16]));
    s_box ss15 (.a(in_data[15:8]), .c(s1[15:8]));
    s_box ss16 (.a(in_data[7:0]), .c(s1[7:0]));

endmodule
