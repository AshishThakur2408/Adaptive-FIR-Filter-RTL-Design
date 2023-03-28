`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.03.2023 10:33:52
// Design Name: 
// Module Name: Adaptive_FIR
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


module adaptive_fir_filter (
  input signed [15:0] data_in,
  input signed [15:0] coeff_in,
  output reg signed [31:0] data_out,
  input clk,
  input rst
);

  reg signed [15:0] x[0:31];
  reg signed [15:0] coeff[0:31];
  reg signed [31:0] acc;
  reg [4:0] n;
  integer i;

  always @(posedge clk) begin
    if (rst) begin
      acc <= 0;
      n <= 0;
      x[0] <= 0;
      x[1] <= 0;
      x[2] <= 0;
      x[3] <= 0;
      x[4] <= 0;
      x[5] <= 0;
      x[6] <= 0;
      x[7] <= 0;
      x[8] <= 0;
      x[9] <= 0;
      x[10] <= 0;
      coeff[0] <= 0;
      coeff[1] <= 0;
      coeff[2] <= 0;
      coeff[3] <= 0;
      coeff[4] <= 0;
      coeff[5] <= 0;
      coeff[6] <= 0;
      coeff[7] <= 0;
      coeff[8] <= 0;
      coeff[9] <= 0;
      coeff[10] <= 0;
    end else begin
      // Shift input samples in
      x[0] <= data_in;
      for (i = 1; i < 32; i = i + 1) begin
        x[i] <= x[i-1];
      end

      // Shift coefficient samples in
      coeff[0] <= coeff_in;
      for (i = 1; i < 32; i = i + 1) begin
        coeff[i] <= coeff[i-1];
      end

      // Calculate output
      acc <= 0;
      for (i = 0; i < 32; i = i + 1) begin
        acc <= acc + x[i] * coeff[i];
      end
      data_out <= acc;

      // Update coefficients using LMS algorithm
      if (n < 32) begin
        n <= n + 1;
      end else begin
        n <= 0;
        for (i = 0; i < 32; i = i + 1) begin
          coeff[i] <= coeff[i] + ((data_in - data_out) * x[i]) >> 8;
        end
      end
    end
  end

endmodule

