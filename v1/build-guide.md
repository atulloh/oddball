---
title: Build Guide
parent: v1
---

# v1 Build Guide

## Bill of materials

| Part | Quantity | Link/Store | Notes |
| - | - | - | - |
| Teensy 2.0 | 2 | [PJRC](https://www.pjrc.com/store/teensy.html)
| ADNS 9800 breakout board | 1 | [Tindie](https://www.tindie.com/products/jkicklighter/adns-9800-laser-motion-sensor/)
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
| Left case | 1 | [GitHub](http://www.google.com/search?q=mini+usb+cable) |
| Pin headers (strip of 4 at 2.54mm) | 8 (x4) | [Amazon](https://www.amazon.com/MCIGICM-Header-2-45mm-Arduino-Connector/dp/B07PKKY8BX/ref=sr_1_3?dchild=1&keywords=pin+headers&qid=1602500107&sr=8-3)
| 4 pin jumper wire ~10cm | 4 | [Amazon](https://www.amazon.com/uxcell-Jumper-Breadboard-Arduino-Multicolor/dp/B07VSPRS21/ref=sr_1_10?dchild=1&keywords=4+pin+jumper+wire&qid=1602500226&sr=8-10)
| MX style switch | 39 |

## Steps

Each half of the keyboard has **L** and **R** annotated for each component, corresponding to the left and right sides respectively. When soldering components, insert them from the side that matches their letter.

_TODO: add step summary_

_TODO: add images to steps below_

### 1. Diodes

On the bottom of the PCBs, solder on diodes, marked on the silk screen square rectangles with a black line on one end. The black lines on the diodes (cathodes) should align with the black lines on the silkscreen.

_Note: if you are using the v1 revision of the PCB, the diode silkscreen is back-to-front. Therefore, either reverse the diode directions physically, or update the `DIODE_DIRECTION` in the your keymap `config.h` when compiling the firmware:_
{: .bg-yellow-200 }

```
#undef DIODE_DIRECTION
#define DIODE_DIRECTION ROW2COL
```

### 2. Resistors

Resistors only needed to be added to the bottom of the right side of the keyboard; the orientation doesn't matter.

### 3. TRRS jacks

A TRRS jack needs to be added to each side of the keyboard. They are a bit of a tight fit: make sure not to cover up the holes on either side that will later be used for switches.

_Note: if you are using the v1 revision of the PCB, the TRRS silkscreen is back-to-front. Therefore, make sure to solder the TRRS jack on to the bottom side of the PCB (same side as diodes)_
{: .bg-yellow-200 }

### 4. Reset switches

_TODO_

### 5. Teensy sockets

_TODO_

### 6. Pin headers

_TODO_

### 7. Flash Teensies

_TODO_

### 8. Sanity check

_TODO_

### 9. Clean up

_TODO_

### 10. Switches

_TODO_

### 11. Assemble

_TODO_