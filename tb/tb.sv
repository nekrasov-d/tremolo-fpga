/*
 * Copyright (C) 2023 Dmitriy Nekrasov
 *
 * This work is free. You can redistribute it and/or modify it under the
 * terms of the Do What The Fuck You Want To Public License, Version 2,
 * as published by Sam Hocevar. See the COPYING file or http://www.wtfpl.net/
 * for more details.
 *
 * A very, very dumb testbench just to observe waveforms and see that in general
 * this thing works as expected
*/

`timescale 1ns/1ns

module tb;
bit clk;
bit srst;

initial forever #1 clk = ~clk;

initial
  begin
    @( posedge clk ) srst <= 1'b1;
    @( posedge clk ) srst <= 1'b0;
  end

bit [7:0] freq_num;

initial
begin
  freq_num = 9'd20;
  #1000000;
  freq_num = 9'd200;
  #1000000;
  $stop;
end

tremolo #(
  .DW                  ( 24                          ),
  .FREQ_TABLE_FILE     ( "tremolo_frequency_table.mif" ),
  .FREQ_DIVISOR_FACTOR ( 2                           )
) dut (
  .clk_i               ( clk                         ),
  .srst_i              ( srst                        ),
  .sample_tick_i       ( 1'b1                        ),
  .frequency_number_i  ( freq_num                    ),
  .level_i             ( 8'd128                      ),
  .enable_i            ( 1'b1                        ),
  .data_i              ( 24'd10000                   ),
  .data_o              (                             )
);

endmodule
