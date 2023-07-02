/*
 * Copyright (C) 2023 Dmitriy Nekrasov
 *
 * This work is free. You can redistribute it and/or modify it under the
 * terms of the Do What The Fuck You Want To Public License, Version 2,
 * as published by Sam Hocevar. See the COPYING file or http://www.wtfpl.net/
 * for more details.
 *
 * This module takes "probability", ranged from 0.0 to 1.0 and scaled to
 * "TOKENS_FOR_1" value as 1. Every time module receives generate_bit_i signal
 * it generates 1 at output_bit_o with given probability. In total the relation
 * of amount of ones to amount of zeroes approaches to the given "probability".
*/

module biased_bitstream_generator #(
  // Assignable
  parameter TOKENS_FOR_1 = 2**16, // Precision
  // Non-assignable
  parameter PROBABILITY_W = $clog2(TOKENS_FOR_1) + 1, // + 1 to code 'b1000...000
  parameter BUCKET_W      = PROBABILITY_W + 1
) (
  input                     clk_i,
  input                     srst_i,
  input                     generate_bit_i,
  input [PROBABILITY_W-1:0] probability_of_1_i,
  output logic              output_bit_o
);

logic [BUCKET_W-1:0] token_bucket;
logic                enough_to_generate_1;

assign enough_to_generate_1 = ( token_bucket >= TOKENS_FOR_1 );

always_ff @( posedge clk_i )
  if( srst_i )
    token_bucket <= probability_of_1_i;
  else
    if( generate_bit_i )
      token_bucket <= enough_to_generate_1 ? token_bucket + probability_of_1_i - TOKENS_FOR_1 :
                                             token_bucket + probability_of_1_i;

assign output_bit_o = generate_bit_i && enough_to_generate_1;

endmodule
