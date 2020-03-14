# Oddball

The Oddball is a split mechanical keyboard with an integrated trackball. While drawing inspiration from things like the [Dactyl Manuform](https://github.com/abstracthat/dactyl-manuform), it is instead designed with a switch place and PCB to give it durability, replicability, and a more utilitarian look. It has a relatively minilamal key layout, typically with 39 keys in total. The PCB is reversible so it can be built with 0, 1 or theoretically 2 trackballs. The trackball sensor is an ADNS900, using a board integration from [Jack Enterprises via Tindie](https://www.tindie.com/products/jkicklighter/adns-9800-laser-motion-sensor/). Due to the height and angle of the sensor, it requires a tented case.

![oddball.png]()

## Assembly

### Per Hand

#### Materials
- Teensy 2.0
- hand plate
- hand PCB
- thumb PCB x2
- diode x39
- MX style switch x39
- 4.7k resistor x2
- TRRS connector
- TRRS cable
- Mini USB cable
- 25mm ball



## Firmware

The Oddball is powered by [QMK Firmware](https://qmk.fm/). You can download and compile the firmware from the [QMK GitHub repository](https://github.com/qmk/qmk_firmware) or create a layout online with the [QMK Configurator](https://config.qmk.fm/#/oddball/LAYOUT). Note that for hands using a trackball, leave the outer 1.25u thumb key unassigned, as it will be replaced by the trackball.

# License

TODO