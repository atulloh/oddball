---
title: Build Guide
parent: v2
---

# v2 Build Guide

## Bill of materials

| Part | Quantity | Link/Store | Notes |
| - | - | - | - |
| Elite C 2.0 | 2 | [Keebio](https://keeb.io/products/elite-c-low-profile-version-usb-c-pro-micro-replacement-atmega32u4)
| Mill-Max Low Profile sockets (or equivalent headers) (strip of 12 at 2.54mm) | 4 | [SplitKB](https://splitkb.com/products/mill-max-low-profile-sockets)
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
| Male-to-male TRRS cable | 1 | [Google](https://www.google.com/search?q=male+to+male+trrs+cable)
| USB Type-C cable | 1 | [Google](https://www.google.com/search?q=usb+c+cable) | To connect keyboard to host (e.g. PC); you probably want USB-A on the other end
| Left case | 1 | [GitHub](https://github.com/atulloh/oddball/tree/master/output/case/v2.0/leftCase.stl) |
| Right case | 1 | [GitHub](https://github.com/atulloh/oddball/tree/master/output/case/v2.0/rightCase.stl) |
| Bearing mount | 1 | [GitHub](https://github.com/atulloh/oddball/tree/master/output/case/v2.0/bearingMount.stl) |
| ADNS or PMW cover | 1 | [ADNS](https://github.com/atulloh/oddball/tree/master/output/case/v1.0/adnsCover.stl) [PMW](https://github.com/atulloh/oddball/tree/master/output/case/v1.0/pmwCover.stl) 
| Right-angled pin headers (strip of 4 at 2.54mm) | 4 (x4) | [SparkFun](https://www.sparkfun.com/products/553) | Will need [stacked pin headers](https://core-electronics.com.au/break-away-headers-right-angle-2x40.html?utm_source=google_shopping&gclid=CjwKCAiA2O39BRBjEiwApB2IkuX_UGqj735nCN4a0wE4y39f2ijxMvBihztlwV53G4i79JJKzz9BshoC6ngQAvD_BwE) if using the ADNS9800
| 4 pin jumper wire ~10cm | 4 | [Amazon](https://www.amazon.com/uxcell-Jumper-Breadboard-Arduino-Multicolor/dp/B07VSPRS21/ref=sr_1_10?dchild=1&keywords=4+pin+jumper+wire&qid=1602500226&sr=8-10) | Only needs the pin sockets at one end, but if two-ended (female-to-female), can just chop one end off
| 18mm M2 bolts | 12 | [Google](https://www.google.com/search?q=m2+18mm+bolts)
| 22mm M2 bolts | 2 | [Google](https://www.google.com/search?q=m2+22mm+bolts)
| M2 nuts | 14 | [Google](https://www.google.com/search?q=m2+nuts)
| Balls to support trackball, 3.175mm diameter | 3 | [Amazon](https://www.amazon.com/uxcell-Ceramic-Bearing-Silicon-Precision/dp/B07ZKTYTFJ/ref=sr_1_2?dchild=1&keywords=si3n4+balls+1%2F8&qid=1609759332&sr=8-2)
| 0.98" / 25mm diameter trackball | 1 | [I used mini pool balls](https://www.amazon.com/CAOREN-16pcs-Billiard-Children-Accessories/dp/B0836WQQF5)
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
  <img src="{{site.baseurl}}/assets/images/pmw-headers-1.jpg" alt="PMW headers"/>
  <figcaption>PMW with headers</figcaption>
</figure>

### 8. Elite Cs

#### Flashing

Checkout [my QMK fork from GitHub](https://github.com/atulloh/qmk_firmware). See the [QMK docs](https://docs.qmk.fm/#/) on how to set up your build envioronment.

To build for the ADNS sensor, run `make oddball/v2:default`.

To build for the PMW sensor, run `make oddball/v2:pmw3360`.

To check things are working:
- flash both sides separately over USB
- unplug USB
- link halves with TRRS cable
- plug in thumb modules with jumper cables
- plug in sensor module with jumper cables
- plug in USB to right half
- check keys of both sides are working
- check mouse sensor is working; hovering a finger over the sensor should move the mouse cursor

To customise functionality, [make a new keymap](https://docs.qmk.fm/#/newbs_building_firmware).

Special keycodes added for the Oddball keyboard are:
- `KC_SCROLL`: when held, the trackball becomes a scroll wheel
- `KC_CPI_1`: CPI option 1
- `KC_CPI_2`: CPI option 2
- `KC_CPI_3`: CPI option 3

In your keymaps `config.h`, you can modify the following:

##### CPI

```
// to override a CPI option, where symbol is either CPI_1, CPI_2 or CPI_3, and value is from 1 to 12000
#undef CPI_1
#def CPI_1 9000
```

##### SCROLL_DIVIDER

```
// to override the scroll speed, change SCROLL_DIVIDER, should be a positive number, where larger numbers equals slower scroll
#undef SCROLL_DIVIDER
#def SCROLL_DIVIDER 20
```

#### Soldering

At this stage you'll want to solder in the Elite C pin sockets.

None of the v2.X PCBs require the bottom strip of pins to be connected, although the v2.0 PCB requires the right pin as in the following image. This can be done with a single pin header. _This in not required for v2.1+._

<figure>
  <img src="{{site.baseurl}}/assets/images/sockets-front.jpg" alt="Sockets"/>
  <figcaption>Sockets; the 2.0 PCB requires an extra pin</figcaption>
</figure>

<figure>
  <img src="{{site.baseurl}}/assets/images/sockets-tape.jpg" alt="Sockets taped"/>
  <figcaption>Add some electrical tape to cover the PCB on the left half where the USB socket can touch the PCB.</figcaption>
</figure>

Now the Elite-Cs can be socketed; [here is a good guide thanks to 40% Keyboards](https://www.40percent.club/p/socketing-pro-micro.html).

If you want to skip socketing, go ahead. Keep in mind, the case is designed with Mill-Max Low Profile sockets in mind, so you'll need equivalent headers or spacing to algin the USB-C ports with the case.

### 10. Switches

Before soldering the switches in, cut component legs on the top of the PCB as flush as possible. This will give the switches room to sit flush on the PCB. Then solder your switches in; I often stard with the corners, then fill in the rest.

<figure>
  <img src="{{site.baseurl}}/assets/images/assembly-switches.jpg" alt="Switches"/>
  <figcaption>Switches soldered in</figcaption>
</figure>

### 11. Mouse thumb module

Insert the bearings into the trackball ring; it's a tight squeese, so you may need to use something hard/metal to push them in. Then bolt the ring, plate, sensor cover, and sensor, together with the 18mm M2 bolts and nuts.

<figure>
  <img src="{{site.baseurl}}/assets/images/thumb-test-2.jpg" alt="Thumb module"/>
  <figcaption>Trackball sensor and mounting ring bolted to switch plate; ignore the pins, they should be right-angled</figcaption>
</figure>

### 12. Assemble plates and modules

- test you can get all the nuts into the underside of the case; it's a tight fit, and you may need to scratch or dremel our some material to make room
- using some sort of marker or tool, make a note on each jumper set of what the wires/pins are (this will help you know what things are when the plate is inserted an PCB is hidden)
- put in the main hand plates
- check USB and TRRS ports line up with case cutouts; if not, use a file or dremel to make ports accessible
- thread jumper wires through thumb cutouts
- plug jumper wires into thumb modules
- plugin in TRRS and USB cable; check things are working
- put in thumb plates
- screw plates in with 18mm M2 bolts and nuts
 - thumb plate on right hand requires the 22mm M2 bolts

 ### 13. Learn to type again. Good luck!