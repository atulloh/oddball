---
title: Build Guide
parent: v2
---

# v1 Build Guide

## Bill of materials

| Part | Quantity | Link/Store | Notes |
| - | - | - | - |
| Elite C 2.0 | 2 | [Keebio](https://keeb.io/products/elite-c-low-profile-version-usb-c-pro-micro-replacement-atmega32u4)
| ADNS 9800 or PMW 3360 breakout board | 1 | [ADNS](https://www.tindie.com/products/jkicklighter/adns-9800-laser-motion-sensor/) [PMW](https://www.tindie.com/products/jkicklighter/pmw3360-motion-sensor/)
| TRRS socket PJ-320A | 2 | [Amazon](https://www.amazon.com/uxcell-Connector-Female-Socket-PJ-320A/dp/B07KY7CJCJ)
| Reset switch | 2 | [Sparkfun](https://www.sparkfun.com/products/10791)
| Through-hole diode | 39 | [Amazon](https://www.amazon.com/McIgIcM-1n4148-switching-Standard-Through/dp/B06XB1R2NK/ref=sr_1_3?dchild=1&keywords=1n4148+diode&qid=1602499817&sr=8-3)
| Through-hole 4.7k resistor | 2 | [Amazon](https://www.amazon.com/EDGELEC-Resistor-Tolerance-Multiple-Resistance/dp/B07QJB3LGN/ref=sr_1_3?dchild=1&keywords=4.7k+resistor&qid=1602499759&sr=8-3)
| Hand plate | 2 | [GitHub](https://github.com/atulloh/oddball/blob/master/output/plates/v2.0/leftPlate.stl) | Recommended 1.5mm thick when manufacturing
| Left thumb plate | 1 | [GitHub](https://github.com/atulloh/oddball/blob/master/output/plates/v2.0/leftThumbPlate.stl)
| Right thumb plate | 1 | [GitHub](https://github.com/atulloh/oddball/blob/master/output/plates/v2.0/rightThumbPlate.stl)
| Hand PCB v2.1 | 2 | [GitHub](https://github.com/atulloh/oddball/tree/master/output/pcbs/v2.1/hand)
| Thumb PCB v2.1 | 2 | [GitHub](https://github.com/atulloh/oddball/tree/master/output/pcbs/v2.1/thumb)
| Male-to-male TRRS cable | 1 | [Google](http://www.google.com/search?q=male+to+male+trrs+cable)
| USB Type-C cable | 1 | [Google](http://www.google.com/search?q=usb+c+cable) | To connect keyboard to host (e.g. PC); you probably want USB-A on the other end
| Left case | 1 | [GitHub](https://github.com/atulloh/oddball/tree/master/output/case/v2.0/leftCase.stl) |
| Right case | 1 | [GitHub](https://github.com/atulloh/oddball/tree/master/output/case/v2.0/rightCase.stl) |
| Bearing mount | 1 | [GitHub](https://github.com/atulloh/oddball/tree/master/output/case/v2.0/bearingMount.stl) |
| ADNS or PMW cover | 1 | [ADNS](https://github.com/atulloh/oddball/tree/master/output/case/v1.0/adnsCover.stl) [PMW](https://github.com/atulloh/oddball/tree/master/output/case/v1.0/pmwCover.stl) 
| Right-angled pin headers (strip of 4 at 2.54mm) | 4 (x4) | [SparkFun](https://www.sparkfun.com/products/553) | Will need [stacked pin headers](https://core-electronics.com.au/break-away-headers-right-angle-2x40.html?utm_source=google_shopping&gclid=CjwKCAiA2O39BRBjEiwApB2IkuX_UGqj735nCN4a0wE4y39f2ijxMvBihztlwV53G4i79JJKzz9BshoC6ngQAvD_BwE) if using the ADNS9800
| 4 pin jumper wire ~10cm | 4 | [Amazon](https://www.amazon.com/uxcell-Jumper-Breadboard-Arduino-Multicolor/dp/B07VSPRS21/ref=sr_1_10?dchild=1&keywords=4+pin+jumper+wire&qid=1602500226&sr=8-10) | Only needs the pin sockets at one end, but if two-ended (female-to-female), can just chop one end off
| MX style switch | 39 |

## Steps

Each half of the keyboard has **L** and **R** annotated for each component, corresponding to the left and right sides respectively. When soldering components, insert them from the side that matches their letter.

_TODO: add step summary_

_TODO: add images to steps below_

### 1. Snap

Grab some pliers, or two pairs, and break one of the thumb PCBs in half.

<figure>
  <img src="{{site.baseurl}}/assets/images/snap-pcb.jpg" alt="Snap PCB"/>
  <figcaption>Snap it</figcaption>
</figure>

### 2. Diodes

On the bottom of the PCBs, solder on diodes, marked on the silk screen square rectangles with a black line on one end. The black lines on the diodes (cathodes) should align with the black lines on the silkscreen. On the right thumb PCB, you only need to do the diode above the 4 breakout pin holes. Use flush cutters to snip off the diode legs after soldering.

<figure>
  <img src="{{site.baseurl}}/assets/images/bent-diode.jpg" alt="Bent diode"/>
  <figcaption>Bend the diodes any way you can manage</figcaption>
</figure>

<figure>
  <img src="{{site.baseurl}}/assets/images/soldered-diode.jpg" alt="Diode"/>
  <figcaption>Match the black line on diode with the solid line on silkscreen</figcaption>
</figure>

<figure>
  <img src="{{site.baseurl}}/assets/images/soldered-diodes-thumb.jpg" alt="Left thumb diodes"/>
  <figcaption>Same for the left thumb</figcaption>
</figure>

<figure>
  <img src="{{site.baseurl}}/assets/images/snap-pcb-soldered.jpg" alt="Right thumb diode"/>
  <figcaption>Right thumb only has one diode</figcaption>
</figure>

<figure>
  <img src="{{site.baseurl}}/assets/images/clip-diodes.jpg" alt="Clip diodes"/>
  <figcaption>Clip when done</figcaption>
</figure>

### 3. Resistors

Resistors only needed to be added to the bottom of the right side of the keyboard; the orientation doesn't matter.

<figure>
  <img src="{{site.baseurl}}/assets/images/soldered-resistors.jpg" alt="Diode"/>
  <figcaption>Only do this for the right side</figcaption>
</figure>

### 4. TRRS jacks

A TRRS jack needs to be added to each side of the keyboard.

<figure>
  <img src="{{site.baseurl}}/assets/images/soldered-trrs-1.jpg" alt="TRRS"/>
  <figcaption>Note the TRRS jack is slightly higher on v2.1 PCBs; this was also soldered from the other</figcaption>
</figure>

### 5. Reset switches

A reset switch needs to be added to each side of the keyboard.

<figure>
  <img src="{{site.baseurl}}/assets/images/soldered-reset.jpg" alt="Reset"/>
  <figcaption>Note the reset switch is slightly higher on v2.1 PCBs; this was also soldered from the other side</figcaption>
</figure>

### 6. Elite C headers/sockets

_TODO_

### 7. Pin headers

While the wires could just be soldered directly, it is a lot easier to assemble or disassemble the keyboard with pluggable sockets and headers. If you have a female-to-female jumper wire, snip of the socket at one end.

One the left side, solder the four ends of one jumper cable into the 4 breakout holes next to the resistors.

One the right side, do as above. Also, solder two jumper cables into the 8 breakout holes near the bottom edge of the board.

<figure>
  <img src="{{site.baseurl}}/assets/images/jumper-cables.jpg" alt="Thumb jumpers"/>
  <figcaption>Do this for both the left and right sides</figcaption>
</figure>

_TODO pic of sensor wire_

Headers are needed on the thumb PCBs for the wires to attach to. On both thumb PCBs, solder on a set of right-angled headers.

<figure>
  <img src="{{site.baseurl}}/assets/images/thumb-headers.jpg" alt="Thumb headers"/>
  <figcaption>Do this for both left and right sides</figcaption>
</figure>

Headers are also needed on the respective sensor breakout board. For the ADNS, use 2x4, stacked, right-angled headers.

<figure>
  <img src="{{site.baseurl}}/assets/images/pmw-headers.jpg" alt="PMW headers"/>
  <figcaption>PMW with headers</figcaption>
</figure>

### 8. Elite Cs

Checkout [my QMK fork from GitHub](https://github.com/atulloh/qmk_firmware). See the [QMK docs](https://docs.qmk.fm/#/) on how to set up your build envioronment.

To build for the ADNS sensor, run `make oddball/v2:default`.

To build for the PMW sensor, run `make oddball/v2:pmw3360`.

### 9. Sanity check

_TODO_

### 10. Clean up

_TODO_

### 11. Switches

_TODO_

### 12. Assemble

_TODO_