/*
 * Copyright (C) 2023 Dmitriy Nekrasov
 *
 * This work is free. You can redistribute it and/or modify it under the
 * terms of the Do What The Fuck You Want To Public License, Version 2,
 * as published by Sam Hocevar. See the COPYING file or http://www.wtfpl.net/
 * for more details.
 *
 * Contaits frequency_control module that transforms the number of the lookup
 * table frequency into increment enable signal which controls sawtooth/cordic.
 * And cordic, which takes sawtooth and prodices sine wave.
*/

module sine_generator #(
  parameter FREQ_TABLE_FILE = "",
  // 1            = no division
  // 2 and more   = division by 2**(FREQ_TABLE_FILE-1)
  parameter FREQ_DIVISOR_FACTOR = 1
  ) (
  input        clk_i,
  input        srst_i,
  input        sample_tick_i,
  input [7:0]  frequency_number_i,
  output [8:0] sine_o
);

// Highest Angle In Cordic
// Cordic accepts angles in range 0 to 90 degrees not including
// 90 degrees. It is designed the way that input of 402 corresponds
// to 90 degrees. So the highest value we increment up to is 401.
// this is the height of our sawtooth we control frequency with.
localparam HIAC = 9'd401;

logic           phase_switch;
logic [$clog2(HIAC)-1:0] angle;
logic [1:0]              phase;
logic [7:0]              quarter_sin;
logic signed [8:0]       sine_signed;
logic                    angle_incr_en;

frequency_control #(
  .FREQ_TABLE_FILE     ( FREQ_TABLE_FILE     ),
  .FREQ_DIVISOR_FACTOR ( FREQ_DIVISOR_FACTOR )
) fc (
  .clk_i               ( clk_i               ),
  .srst_i              ( srst_i              ),
  .sample_tick_i       ( sample_tick_i       ),
  .frequency_number_i  ( frequency_number_i  ),
  .angle_incr_en_o     ( angle_incr_en       )
);

assign phase_switch = ( angle == HIAC );

always_ff @( posedge clk_i )
  if( srst_i )
    phase <= 1'b0;
  else
    if( phase_switch )
      phase <= phase + 1'b1;


always_ff @( posedge clk_i )
  if( srst_i | phase_switch )
    angle <= '0;
  else
    if( angle_incr_en )
      angle <= angle + 1'b1;


cordic cordic(
  .angle_i      ( phase[0] ? HIAC-angle : angle ),
  .sin_o        ( quarter_sin                   ),
  .cos_o        (                               )
);

assign sine_signed = phase[1] ? { 1'b1, -quarter_sin } : { 1'b0, quarter_sin };

// Scale up to unsigned values
always_ff @( posedge clk_i )
  sine_o <= { sine_signed[8]^1'b1, sine_signed[7:0] };

endmodule











