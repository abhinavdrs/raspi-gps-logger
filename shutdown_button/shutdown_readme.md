i# Combined Restart / Shutdown Button for Raspberry Pi

A very simple systemd service for Raspberry Pi that provides a
software-controlled restart / shutdown button.

## Use

Default behaviour is:

* your Raspberry Pi will *reset* if the button is held for more than two
  seconds but fewer than five seconds;

* your Raspberry Pi will *shut down* if the button is held for more than five
  seconds.

By default, the software assumes the switch is connected to pin [BCM
27](https://pinout.xyz/pinout/pin13_gpio27#). Both the pin and the
timing can be changed in the Python source file.
