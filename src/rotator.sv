/*
 * Copyright (C) 2023 Dmitriy Nekrasov
 *
 * This work is free. You can redistribute it and/or modify it under the
 * terms of the Do What The Fuck You Want To Public License, Version 2,
 * as published by Sam Hocevar. See the COPYING file or http://www.wtfpl.net/
 * for more details.
 *
 * Basic cordic element. Performs one elementary rotation operation.
*/

module rotator #(
  parameter DW  = 8,
  parameter AW  = 10,
  parameter SHIFT = 0,
  parameter ATAN = 0
) (
  input signed  [DW-1:0] x_i,
  input signed  [DW-1:0] y_i,
  input signed  [AW-1:0] a_i,
  output signed [AW-1:0] a_o,
  output signed [DW-1:0] x_o,
  output signed [DW-1:0] y_o
);

logic a_sign;
logic signed [DW-1:0] x_shift;
logic signed [DW-1:0] y_shift;

assign a_sign = a_i[AW-1];
assign x_shift = x_i >>> SHIFT;
assign y_shift = y_i >>> SHIFT;

assign x_o = a_sign ? x_i + y_shift : x_i - y_shift;
assign y_o = a_sign ? y_i - x_shift : y_i + x_shift;
assign a_o = a_sign ? a_i + ATAN    : a_i - ATAN;

endmodule
