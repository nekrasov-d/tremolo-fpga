/*
 * Copyright (C) 2023 Dmitriy Nekrasov
 *
 * This work is free. You can redistribute it and/or modify it under the
 * terms of the Do What The Fuck You Want To Public License, Version 2,
 * as published by Sam Hocevar. See the COPYING file or http://www.wtfpl.net/
 * for more details.
 *
 * Simple hadcoded cordic implementation. Supports only 8 angles.
 */

module cordic #(
  parameter X0 = 9'd155, // 256*0.607
  parameter Y0 = 0
) (
  input [8:0]        angle_i, // 402 = 90 degrees
  output logic [7:0] sin_o,
  output logic [7:0] cos_o
);

parameter NUMSTEPS = 8;
parameter DW       = 9;
parameter AW       = 10;

typedef bit signed [9:0] atan_t [7:0];

parameter atan_t ATAN = '{10'sd2, 10'sd4, 10'sd8, 10'sd16, 10'sd32, 10'sd63, 10'sd119, 10'sd201};

logic signed [DW-1:0]       x [NUMSTEPS:0];
logic signed [DW-1:0]       y [NUMSTEPS:0];
logic signed [AW-1:0]   angle [NUMSTEPS:0];

assign x[0] = X0;
assign y[0] = Y0;
assign angle[0]  = {1'b0, angle_i};

genvar i;
generate
  for( i = 0; i < NUMSTEPS; i++ )
    begin : gen_rotators
      rotator #(
        .DW      ( DW           ),
        .AW      ( 10           ),
        .SHIFT   ( i            ),
        .ATAN    ( ATAN[i]      )
      ) r (
        .x_i     ( x[i]         ),
        .y_i     ( y[i]         ),
        .a_i     ( angle[i]     ),
        .a_o     ( angle[i+1]   ),
        .x_o     ( x[i+1]       ),
        .y_o     ( y[i+1]       )
      );
    end // gen_rotators
endgenerate

assign sin_o = y[NUMSTEPS][7:0];
assign cos_o = x[NUMSTEPS][7:0];

endmodule
