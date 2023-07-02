/*
 * Copyright © 2023 Dmitriy Nekrasov
 * This work is free. You can redistribute it and/or modify it under the
 * terms of the Do What The Fuck You Want To Public License, Version 2,
 * as published by Sam Hocevar. See the COPYING file or http://www.wtfpl.net/
 * for more details.
 *
 * altsyncram from altera_mf.v failed simulation for some reason so i made this
 */

module rom #(
  parameter DWIDTH   = 16,
  parameter AWIDTH    = 9,
  parameter INIT_FILE = "some_file.mif"
) (
  input                     clk_i,
  input [AWIDTH-1:0]        rdaddr_i,
  output logic [DWIDTH-1:0] rddata_o
);

always_comb
  case( rdaddr_i )
    'h00000    :    rddata_o = 'h10000;
    'h00001    :    rddata_o = 'h0ff09;
    'h00002    :    rddata_o = 'h0fe13;
    'h00003    :    rddata_o = 'h0fd1c;
    'h00004    :    rddata_o = 'h0fc25;
    'h00005    :    rddata_o = 'h0fb2f;
    'h00006    :    rddata_o = 'h0fa38;
    'h00007    :    rddata_o = 'h0f941;
    'h00008    :    rddata_o = 'h0f84a;
    'h00009    :    rddata_o = 'h0f754;
    'h0000a    :    rddata_o = 'h0f65d;
    'h0000b    :    rddata_o = 'h0f566;
    'h0000c    :    rddata_o = 'h0f470;
    'h0000d    :    rddata_o = 'h0f379;
    'h0000e    :    rddata_o = 'h0f282;
    'h0000f    :    rddata_o = 'h0f18c;
    'h00010    :    rddata_o = 'h0f095;
    'h00011    :    rddata_o = 'h0ef9e;
    'h00012    :    rddata_o = 'h0eea8;
    'h00013    :    rddata_o = 'h0edb1;
    'h00014    :    rddata_o = 'h0ecba;
    'h00015    :    rddata_o = 'h0ebc4;
    'h00016    :    rddata_o = 'h0eacd;
    'h00017    :    rddata_o = 'h0e9d6;
    'h00018    :    rddata_o = 'h0e8df;
    'h00019    :    rddata_o = 'h0e7e9;
    'h0001a    :    rddata_o = 'h0e6f2;
    'h0001b    :    rddata_o = 'h0e5fb;
    'h0001c    :    rddata_o = 'h0e505;
    'h0001d    :    rddata_o = 'h0e40e;
    'h0001e    :    rddata_o = 'h0e317;
    'h0001f    :    rddata_o = 'h0e221;
    'h00020    :    rddata_o = 'h0e12a;
    'h00021    :    rddata_o = 'h0e033;
    'h00022    :    rddata_o = 'h0df3d;
    'h00023    :    rddata_o = 'h0de46;
    'h00024    :    rddata_o = 'h0dd4f;
    'h00025    :    rddata_o = 'h0dc59;
    'h00026    :    rddata_o = 'h0db62;
    'h00027    :    rddata_o = 'h0da6b;
    'h00028    :    rddata_o = 'h0d974;
    'h00029    :    rddata_o = 'h0d87e;
    'h0002a    :    rddata_o = 'h0d787;
    'h0002b    :    rddata_o = 'h0d690;
    'h0002c    :    rddata_o = 'h0d59a;
    'h0002d    :    rddata_o = 'h0d4a3;
    'h0002e    :    rddata_o = 'h0d3ac;
    'h0002f    :    rddata_o = 'h0d2b6;
    'h00030    :    rddata_o = 'h0d1bf;
    'h00031    :    rddata_o = 'h0d0c8;
    'h00032    :    rddata_o = 'h0cfd2;
    'h00033    :    rddata_o = 'h0cedb;
    'h00034    :    rddata_o = 'h0cde4;
    'h00035    :    rddata_o = 'h0cced;
    'h00036    :    rddata_o = 'h0cbf7;
    'h00037    :    rddata_o = 'h0cb00;
    'h00038    :    rddata_o = 'h0ca09;
    'h00039    :    rddata_o = 'h0c913;
    'h0003a    :    rddata_o = 'h0c81c;
    'h0003b    :    rddata_o = 'h0c725;
    'h0003c    :    rddata_o = 'h0c62f;
    'h0003d    :    rddata_o = 'h0c538;
    'h0003e    :    rddata_o = 'h0c441;
    'h0003f    :    rddata_o = 'h0c34b;
    'h00040    :    rddata_o = 'h0c254;
    'h00041    :    rddata_o = 'h0c15d;
    'h00042    :    rddata_o = 'h0c067;
    'h00043    :    rddata_o = 'h0bf70;
    'h00044    :    rddata_o = 'h0be79;
    'h00045    :    rddata_o = 'h0bd82;
    'h00046    :    rddata_o = 'h0bc8c;
    'h00047    :    rddata_o = 'h0bb95;
    'h00048    :    rddata_o = 'h0ba9e;
    'h00049    :    rddata_o = 'h0b9a8;
    'h0004a    :    rddata_o = 'h0b8b1;
    'h0004b    :    rddata_o = 'h0b7ba;
    'h0004c    :    rddata_o = 'h0b6c4;
    'h0004d    :    rddata_o = 'h0b5cd;
    'h0004e    :    rddata_o = 'h0b4d6;
    'h0004f    :    rddata_o = 'h0b3e0;
    'h00050    :    rddata_o = 'h0b2e9;
    'h00051    :    rddata_o = 'h0b1f2;
    'h00052    :    rddata_o = 'h0b0fc;
    'h00053    :    rddata_o = 'h0b005;
    'h00054    :    rddata_o = 'h0af0e;
    'h00055    :    rddata_o = 'h0ae17;
    'h00056    :    rddata_o = 'h0ad21;
    'h00057    :    rddata_o = 'h0ac2a;
    'h00058    :    rddata_o = 'h0ab33;
    'h00059    :    rddata_o = 'h0aa3d;
    'h0005a    :    rddata_o = 'h0a946;
    'h0005b    :    rddata_o = 'h0a84f;
    'h0005c    :    rddata_o = 'h0a759;
    'h0005d    :    rddata_o = 'h0a662;
    'h0005e    :    rddata_o = 'h0a56b;
    'h0005f    :    rddata_o = 'h0a475;
    'h00060    :    rddata_o = 'h0a37e;
    'h00061    :    rddata_o = 'h0a287;
    'h00062    :    rddata_o = 'h0a190;
    'h00063    :    rddata_o = 'h0a09a;
    'h00064    :    rddata_o = 'h09fa3;
    'h00065    :    rddata_o = 'h09eac;
    'h00066    :    rddata_o = 'h09db6;
    'h00067    :    rddata_o = 'h09cbf;
    'h00068    :    rddata_o = 'h09bc8;
    'h00069    :    rddata_o = 'h09ad2;
    'h0006a    :    rddata_o = 'h099db;
    'h0006b    :    rddata_o = 'h098e4;
    'h0006c    :    rddata_o = 'h097ee;
    'h0006d    :    rddata_o = 'h096f7;
    'h0006e    :    rddata_o = 'h09600;
    'h0006f    :    rddata_o = 'h0950a;
    'h00070    :    rddata_o = 'h09413;
    'h00071    :    rddata_o = 'h0931c;
    'h00072    :    rddata_o = 'h09225;
    'h00073    :    rddata_o = 'h0912f;
    'h00074    :    rddata_o = 'h09038;
    'h00075    :    rddata_o = 'h08f41;
    'h00076    :    rddata_o = 'h08e4b;
    'h00077    :    rddata_o = 'h08d54;
    'h00078    :    rddata_o = 'h08c5d;
    'h00079    :    rddata_o = 'h08b67;
    'h0007a    :    rddata_o = 'h08a70;
    'h0007b    :    rddata_o = 'h08979;
    'h0007c    :    rddata_o = 'h08883;
    'h0007d    :    rddata_o = 'h0878c;
    'h0007e    :    rddata_o = 'h08695;
    'h0007f    :    rddata_o = 'h0859f;
    'h00080    :    rddata_o = 'h084a8;
    'h00081    :    rddata_o = 'h083b1;
    'h00082    :    rddata_o = 'h082ba;
    'h00083    :    rddata_o = 'h081c4;
    'h00084    :    rddata_o = 'h080cd;
    'h00085    :    rddata_o = 'h07fd6;
    'h00086    :    rddata_o = 'h07ee0;
    'h00087    :    rddata_o = 'h07de9;
    'h00088    :    rddata_o = 'h07cf2;
    'h00089    :    rddata_o = 'h07bfc;
    'h0008a    :    rddata_o = 'h07b05;
    'h0008b    :    rddata_o = 'h07a0e;
    'h0008c    :    rddata_o = 'h07918;
    'h0008d    :    rddata_o = 'h07821;
    'h0008e    :    rddata_o = 'h0772a;
    'h0008f    :    rddata_o = 'h07634;
    'h00090    :    rddata_o = 'h0753d;
    'h00091    :    rddata_o = 'h07446;
    'h00092    :    rddata_o = 'h0734f;
    'h00093    :    rddata_o = 'h07259;
    'h00094    :    rddata_o = 'h07162;
    'h00095    :    rddata_o = 'h0706b;
    'h00096    :    rddata_o = 'h06f75;
    'h00097    :    rddata_o = 'h06e7e;
    'h00098    :    rddata_o = 'h06d87;
    'h00099    :    rddata_o = 'h06c91;
    'h0009a    :    rddata_o = 'h06b9a;
    'h0009b    :    rddata_o = 'h06aa3;
    'h0009c    :    rddata_o = 'h069ad;
    'h0009d    :    rddata_o = 'h068b6;
    'h0009e    :    rddata_o = 'h067bf;
    'h0009f    :    rddata_o = 'h066c8;
    'h000a0    :    rddata_o = 'h065d2;
    'h000a1    :    rddata_o = 'h064db;
    'h000a2    :    rddata_o = 'h063e4;
    'h000a3    :    rddata_o = 'h062ee;
    'h000a4    :    rddata_o = 'h061f7;
    'h000a5    :    rddata_o = 'h06100;
    'h000a6    :    rddata_o = 'h0600a;
    'h000a7    :    rddata_o = 'h05f13;
    'h000a8    :    rddata_o = 'h05e1c;
    'h000a9    :    rddata_o = 'h05d26;
    'h000aa    :    rddata_o = 'h05c2f;
    'h000ab    :    rddata_o = 'h05b38;
    'h000ac    :    rddata_o = 'h05a42;
    'h000ad    :    rddata_o = 'h0594b;
    'h000ae    :    rddata_o = 'h05854;
    'h000af    :    rddata_o = 'h0575d;
    'h000b0    :    rddata_o = 'h05667;
    'h000b1    :    rddata_o = 'h05570;
    'h000b2    :    rddata_o = 'h05479;
    'h000b3    :    rddata_o = 'h05383;
    'h000b4    :    rddata_o = 'h0528c;
    'h000b5    :    rddata_o = 'h05195;
    'h000b6    :    rddata_o = 'h0509f;
    'h000b7    :    rddata_o = 'h04fa8;
    'h000b8    :    rddata_o = 'h04eb1;
    'h000b9    :    rddata_o = 'h04dbb;
    'h000ba    :    rddata_o = 'h04cc4;
    'h000bb    :    rddata_o = 'h04bcd;
    'h000bc    :    rddata_o = 'h04ad7;
    'h000bd    :    rddata_o = 'h049e0;
    'h000be    :    rddata_o = 'h048e9;
    'h000bf    :    rddata_o = 'h047f2;
    'h000c0    :    rddata_o = 'h046fc;
    'h000c1    :    rddata_o = 'h04605;
    'h000c2    :    rddata_o = 'h0450e;
    'h000c3    :    rddata_o = 'h04418;
    'h000c4    :    rddata_o = 'h04321;
    'h000c5    :    rddata_o = 'h0422a;
    'h000c6    :    rddata_o = 'h04134;
    'h000c7    :    rddata_o = 'h0403d;
    'h000c8    :    rddata_o = 'h03f46;
    'h000c9    :    rddata_o = 'h03e50;
    'h000ca    :    rddata_o = 'h03d59;
    'h000cb    :    rddata_o = 'h03c62;
    'h000cc    :    rddata_o = 'h03b6b;
    'h000cd    :    rddata_o = 'h03a75;
    'h000ce    :    rddata_o = 'h0397e;
    'h000cf    :    rddata_o = 'h03887;
    'h000d0    :    rddata_o = 'h03791;
    'h000d1    :    rddata_o = 'h0369a;
    'h000d2    :    rddata_o = 'h035a3;
    'h000d3    :    rddata_o = 'h034ad;
    'h000d4    :    rddata_o = 'h033b6;
    'h000d5    :    rddata_o = 'h032bf;
    'h000d6    :    rddata_o = 'h031c9;
    'h000d7    :    rddata_o = 'h030d2;
    'h000d8    :    rddata_o = 'h02fdb;
    'h000d9    :    rddata_o = 'h02ee5;
    'h000da    :    rddata_o = 'h02dee;
    'h000db    :    rddata_o = 'h02cf7;
    'h000dc    :    rddata_o = 'h02c00;
    'h000dd    :    rddata_o = 'h02b0a;
    'h000de    :    rddata_o = 'h02a13;
    'h000df    :    rddata_o = 'h0291c;
    'h000e0    :    rddata_o = 'h02826;
    'h000e1    :    rddata_o = 'h0272f;
    'h000e2    :    rddata_o = 'h02638;
    'h000e3    :    rddata_o = 'h02542;
    'h000e4    :    rddata_o = 'h0244b;
    'h000e5    :    rddata_o = 'h02354;
    'h000e6    :    rddata_o = 'h0225e;
    'h000e7    :    rddata_o = 'h02167;
    'h000e8    :    rddata_o = 'h02070;
    'h000e9    :    rddata_o = 'h01f7a;
    'h000ea    :    rddata_o = 'h01e83;
    'h000eb    :    rddata_o = 'h01d8c;
    'h000ec    :    rddata_o = 'h01c95;
    'h000ed    :    rddata_o = 'h01b9f;
    'h000ee    :    rddata_o = 'h01aa8;
    'h000ef    :    rddata_o = 'h019b1;
    'h000f0    :    rddata_o = 'h018bb;
    'h000f1    :    rddata_o = 'h017c4;
    'h000f2    :    rddata_o = 'h016cd;
    'h000f3    :    rddata_o = 'h015d7;
    'h000f4    :    rddata_o = 'h014e0;
    'h000f5    :    rddata_o = 'h013e9;
    'h000f6    :    rddata_o = 'h012f3;
    'h000f7    :    rddata_o = 'h011fc;
    'h000f8    :    rddata_o = 'h01105;
    'h000f9    :    rddata_o = 'h0100e;
    'h000fa    :    rddata_o = 'h00f18;
    'h000fb    :    rddata_o = 'h00e21;
    'h000fc    :    rddata_o = 'h00d2a;
    'h000fd    :    rddata_o = 'h00c34;
    'h000fe    :    rddata_o = 'h00b3d;
    'h000ff    :    rddata_o = 'h00a46;
default:;
endcase
endmodule

