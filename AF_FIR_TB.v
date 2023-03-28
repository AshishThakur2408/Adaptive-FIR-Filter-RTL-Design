`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.03.2023 15:33:07
// Design Name: 
// Module Name: AF_FIR_TB
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module AF_FIR_TB();

reg signed [15:0] data_in;
reg signed [15:0] coeff_in;
wire signed [31:0] data_out;
reg clk;
reg rst;

adaptive_fir_filter uut(.data_in(data_in),.coeff_in(coeff_in),.data_out(data_out),.clk(clk),.rst(rst));
initial 
begin
rst = 1;
#100;
rst = 0;
end

begin   
clk = 0;
#100;
end 



begin
data_in
coeff_in
end

endmodule
