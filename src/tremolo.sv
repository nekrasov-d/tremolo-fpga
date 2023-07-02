/*
 * Copyright (C) 2023 Dmitriy Nekrasov
 *
 * This work is free. You can redistribute it and/or modify it under the
 * terms of the Do What The Fuck You Want To Public License, Version 2,
 * as published by Sam Hocevar. See the COPYING file or http://www.wtfpl.net/
 * for more details.
 *
 * Top level module. Contain sine wave generator and two gain stages, one for
 * generated modulation signal, and one for the modulation itself.
*/

module tremolo #(
  // Data width
  parameter DW              = 16,
  //
  parameter FREQ_TABLE_FILE = "",
  // 1            = no division
  // 2 and more   = division by 2**(FREQ_TABLE_FILE-1)
  parameter FREQ_DIVISOR_FACTOR = 1
) (
  input        clk_i,
  input        srst_i,
  input        sample_tick_i,
  input [7:0]  frequency_number_i,
  input [7:0]  level_i,
  input        enable_i,
  input signed [DW-1:0] data_i,
  output logic signed [DW-1:0] data_o
);

logic [8:0] sine;

sine_generator #(
  .FREQ_TABLE_FILE     ( FREQ_TABLE_FILE     ),
  .FREQ_DIVISOR_FACTOR ( FREQ_DIVISOR_FACTOR )
) sg (
  .clk_i               ( clk_i               ),
  .srst_i              ( srst_i              ),
  .sample_tick_i       ( sample_tick_i       ),
  .frequency_number_i  ( frequency_number_i  ),
  .sine_o              ( sine                )
);

logic [8:0]  gain;
logic [16:0] mult1;

assign mult1 = sine * level_i;
assign gain = 10'd511 - (mult1 >> 8);

logic signed [DW+9-1:0] mult2;
logic signed [DW-1:0]   modulated_data;

assign mult2 = data_i * $signed({1'b0, gain});
assign modulated_data = mult2 >> 9;

assign data_o = enable_i ? modulated_data : data_i;

endmodule
