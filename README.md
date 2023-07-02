# tremolo-fpga

Simple hardcoded sine wave tremolo for fpga with the lookup table 256-step
frequency control.

See tremolo_scheme.png

## Features

  * 256 frequencies availavle (pre-calculated offline, select online)
  * Default settings: 1 to 27.5 Hz with linear interpolated values inbetween
  * 2^x frequency divisor (static configuration).
  * Default setting is 2 (range is 0.5 Hz to 13.75 Hz)
  * 8-bit cordic sine wave generator for the modulation signal.
  * Modulation depth control (8-bit)

## Verification / testing

The testbench provided in tb have no coverage, only raw workability estimation
with waveforms.

The design was verified in the real hardware, works just fine, smooth frequency
switch, no extra noises caused relativaly small cordic bitwidth.

## Authors

 -- Dmitry Nekrasov <bluebag@yandex.ru>  Sun, 18 Jun 2023 11:39:30 +0300

## License

WTFPL 2.0
