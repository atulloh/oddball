---
title: Build Guide
parent: v1
---

# v1 Build Guide

## Bill of materials

| Part | Quantity | Link/Store | Notes |
| - | - | - | - |
| Teensy 2.0 | 2 | [PJRC](https://www.pjrc.com/store/teensy.html)
| ADNS 9800 or PMW 3360 breakout board | 1 | [ADNS](https://www.tindie.com/products/jkicklighter/adns-9800-laser-motion-sensor/) [PMW](https://www.tindie.com/products/jkicklighter/pmw3360-motion-sensor/)
| TRRS socket PJ-320A | 2 | [Amazon](https://www.amazon.com/uxcell-Connector-Female-Socket-PJ-320A/dp/B07KY7CJCJ)
| Reset switch | 2 | [Sparkfun](https://www.sparkfun.com/products/10791)
| Through-hole diode | 39 | [Amazon](https://www.amazon.com/McIgIcM-1n4148-switching-Standard-Through/dp/B06XB1R2NK/ref=sr_1_3?dchild=1&keywords=1n4148+diode&qid=1602499817&sr=8-3)
| Through-hole 4.7k resistor | 2 | [Amazon](https://www.amazon.com/EDGELEC-Resistor-Tolerance-Multiple-Resistance/dp/B07QJB3LGN/ref=sr_1_3?dchild=1&keywords=4.7k+resistor&qid=1602499759&sr=8-3)
| Hand plate | 2 | [GitHub](https://github.com/atulloh/oddball/blob/master/output/plates/v1.0/leftPlate.stl) | Recommended 1.5mm thick when manufacturing
| Left thumb plate | 1 | [GitHub](https://github.com/atulloh/oddball/blob/master/output/plates/v1.0/leftThumbPlate.stl)
| Right thumb plate | 1 | [GitHub](https://github.com/atulloh/oddball/blob/master/output/plates/v1.0/rightThumbPlate.stl)
| Hand PCB v1.1 | 2 | [GitHub](https://github.com/atulloh/oddball/tree/master/output/pcbs/v1.1/hand)
| Thumb PCB v1.1 | 2 | [GitHub](https://github.com/atulloh/oddball/tree/master/output/pcbs/v1.1/thumb)
| Male-to-male TRRS cable | 1 | [Google](http://www.google.com/search?q=male+to+male+trrs+cable)
| Mini-USB cable | 1 | [Google](http://www.google.com/search?q=mini+usb+cable) | To connect keyboard to host (e.g. PC); you probably want USB-A on the other end
| Left case | 1 | [GitHub](https://github.com/atulloh/oddball/tree/master/output/case/v1.0/leftCase.stl) |
| Right case | 1 | [GitHub](https://github.com/atulloh/oddball/tree/master/output/case/v1.0/rightCase.stl) |
| Bearing mount | 1 | [GitHub](https://github.com/atulloh/oddball/tree/master/output/case/v1.0/bearingMount.stl) |
| ADNS or PMW cover | 1 | [ADNS](https://github.com/atulloh/oddball/tree/master/output/case/v1.0/adnsCover.stl) [PMW](https://github.com/atulloh/oddball/tree/master/output/case/v1.0/pmwCover.stl)
| Right-angled pin headers (strip of 4 at 2.54mm) | 4 (x4) | [SparkFun](https://www.sparkfun.com/products/553) | Will need [stacked pin headers](https://core-electronics.com.au/break-away-headers-right-angle-2x40.html?utm_source=google_shopping&gclid=CjwKCAiA2O39BRBjEiwApB2IkuX_UGqj735nCN4a0wE4y39f2ijxMvBihztlwV53G4i79JJKzz9BshoC6ngQAvD_BwE) if using the ADNS9800
| 4 pin jumper wire ~10cm | 4 | [Amazon](https://www.amazon.com/uxcell-Jumper-Breadboard-Arduino-Multicolor/dp/B07VSPRS21/ref=sr_1_10?dchild=1&keywords=4+pin+jumper+wire&qid=1602500226&sr=8-10) | Only needs the pin sockets at one end, but if two-ended (female-to-female), can just chop one end off
| MX style switch | 39 |


## Steps

This build is essentially the same as the [v2 build guide]({{site.baseurl}}/v2/build-guide), with a few differences in the v1.0 PCB:
-  the diode silkscreen is back-to-front; either reverse the diode directions physically, or update the `DIODE_DIRECTION` in the your keymap `config.h` when compiling the firmware:
```
#undef DIODE_DIRECTION
#define DIODE_DIRECTION ROW2COL
```
- the TRRS silkscreen is back-to-front; make sure to solder the TRRS jack on to the bottom side of the PCB (same side as diodes)
- compile QMK firmware with one of the following depending on sendor type:
```
make oddball/v1:default
make oddball/v1:pmw3360
```
