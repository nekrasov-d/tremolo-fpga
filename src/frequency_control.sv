/*
 * Copyright (C) 2023 Dmitriy Nekrasov
 *
 * This work is free. You can redistribute it and/or modify it under the
 * terms of the Do What The Fuck You Want To Public License, Version 2,
 * as published by Sam Hocevar. See the COPYING file or http://www.wtfpl.net/
 * for more details.
 *
 * This module transforms input number of the lookup table frequency into
 * increment enable signal which controls sawtooth generator (which in turn
 * controls cordic). Lookup table values contain increment enable probability
 * per sample tick and are pre-calculated offline.
*/

module frequency_control #(
  parameter FREQ_TABLE_FILE = "",
  // 1            = no division
  // 2 and more   = division by 2**(FREQ_TABLE_FILE-1)
  parameter FREQ_DIVISOR_FACTOR = 1
) (
  input        clk_i,
  input        srst_i,
  input        sample_tick_i,
  input [7:0]  frequency_number_i,
  output logic angle_incr_en_o
);

localparam RESOLUTION = 16; // actually, resolution is 2 in power of this

logic [RESOLUTION:0] angle_increment_probability;
logic generate_bit_en;

rom #(
  .DWIDTH       ( RESOLUTION+1                ),
  .AWIDTH       ( 8                           ),
  .INIT_FILE    ( FREQ_TABLE_FILE             )
) frequency_table (
  .clk_i        ( clk_i                       ),
  .rdaddr_i     ( frequency_number_i          ),
  .rddata_o     ( angle_increment_probability )
);

generate
  if( FREQ_DIVISOR_FACTOR==1 )
    assign generate_bit_en = sample_tick_i;
  else
    begin
      logic [FREQ_DIVISOR_FACTOR-1:0] counter;
      always_ff @( posedge clk_i )
        if( srst_i )
          counter <= '0;
        else
          if( sample_tick_i )
            counter <= counter + 1'b1;

      assign generate_bit_en = counter[FREQ_DIVISOR_FACTOR-1] && sample_tick_i;
    end
endgenerate


biased_bitstream_generator #(
  .TOKENS_FOR_1          ( 2**RESOLUTION               )
) bbg (
  .clk_i                 ( clk_i                       ),
  .srst_i                ( srst_i                      ),
  .generate_bit_i        ( generate_bit_en           ),
  .probability_of_1_i    ( angle_increment_probability ),
  .output_bit_o          ( angle_incr_en_o             )
);

endmodule

