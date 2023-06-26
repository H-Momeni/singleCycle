module Mux2 (readData2, extend, alu_src, data2);
input [15:0] readData2, extend;
input alu_src;
output [15:0] data2;
assign data2 = (readData2 & ~alu_src) | (extend & alu_src);
endmodule