---
title:  "Oddball build log"
---

<style>
    figure {
        text-align: center;
        font-style: italic;
        font-size: 15px;
        padding-bottom: 30px;
    }
    figure > img {
      margin-bottom: 0;
    }
</style>

_TODO: links_

# Build Log

## Out with the old

I program full time, and a bit in my spare time, so I'm typing on a keyboard a fair bit.

I'd been using the ErgoDox EZ for a couple of years, along with a regular mouse and a trackball mouse. I really liked a lot of things about the EZ. It had a split layout, along with column-staggered keys (vertically aligned), allowing for more comfortable wrist rotation. I used multiple thumb keys to switch layers, meaning  I didn't have to move my hands as much, improving accuracy and speed. Having a new layout encouraged me to learn to touch type "properly". It was relatively easy to change the layout via the site confiurator of which I went through over 20 revisions. And lastly, I thought it looked pretty weird and cool.

However, some things were slightly frustrating. I found it had too many buttons; after multiple keymap iterations, there were a bunch of keys that were unneeded, which irked the OCD programmer part of my brain. I also noticed my typing accuracy still dropped, or performance slowed, when moving jumping my right hand to the mouse/trackball and back (not specific to the EZ). I found it also made a pingy noise when typing, however this probably could have been mitigated via modding.

I started looking around, and started to see all thsese cool boards people were making. I realised it was might not be as complicated as I thought to create exactly what I wanted. I'd also recently read Cal Newport's "Digital Minimalism" which recommends trying to build something physical rather than digital. With all that in mind, I decided to try to keep what I loved about the EZ: a split ergonomic layout, however with fewer keys and an integrated trackball.

<figure>
  <img src="{{site.baseurl}}/assets/images/ergodox.jpg" alt="ErgoDox EZ"/>
  <figcaption>The ErgoDox was great but had some issues</figcaption>
</figure>

# Keymap

I decided to do all this while I was away at the beach for a few days with my family. Armed with only a pencil and some paper, I set to designing a relatively minimal keymap (I'm now aware that with stenography/chording you can take this even further!). I worked out the main key combinations. Over many pages. My wife probably thought I was crazed.

<figure>
  <img src="{{site.baseurl}}/assets/images/layout_test.jpg" alt="Layout draft"/>
  <figcaption>It took a while to figure out a functional, minimal layout</figcaption>
</figure>

<figure>
  <img src="{{site.baseurl}}/assets/images/layout.png" alt="Final layout"/>
  <figcaption>My current layout</figcaption>
</figure>

# Scultping

To start off with, I thought I'd try to find what was comfortable. I made some playdough, and started playing around with different shapes and angles to try to find what was comfortable.

<figure>
  <img src="{{site.baseurl}}/assets/images/dough-2.jpg" alt="Play dough"/>
  <figcaption>Quick and messy way to play with angles</figcaption>
</figure>

# Handwire and initial print

Next up was getting something working to see if my layout was feasible. I ended up chipping in with a friend for a relatively low-end 3D printer, a Creality Ender 3. There was a lot of information around about handwiring a keyboard and using using QMK. I used the links on [diimeep's list or awesome split keyboards](https://github.com/diimdeep/awesome-split-keyboards#do-it-yourself). I used this prototype for around 6 months before decomissioning it. I really liked the layout, but some of the connections were a bit flakey, leading to missed characters. It was very frustrating in that respect.

<figure>
  <img src="{{site.baseurl}}/assets/images/proto-1.jpg" alt="Test plate"/>
  <figcaption>Intial print to test 1.5mm PLA plate</figcaption>
</figure>

<figure>
  <img src="{{site.baseurl}}/assets/images/breadboard.jpg" alt="Breadboard"/>
  <figcaption>Pro Micros running QMK over I2C</figcaption>
</figure>

<figure>
  <img src="{{site.baseurl}}/assets/images/proto-2.jpg" alt="Test plate"/>
  <figcaption>Used this until the playdough went mouldy (trackball non-functioning)</figcaption>
</figure>

<figure>
  <img src="{{site.baseurl}}/assets/images/proto-3.jpg" alt="Test plate"/>
  <figcaption>Made some stands for tenting</figcaption>
</figure>

# Tracking motion

I also had to figure out how to do a trackball. There didn't seem to be too many ready-to-go options. One existing solution was to take apart an old PS/2 mouse, flip the sensor upside down, and put a track ball on top. I tried this, but it wasn't very successful as the older optical sensors weren't very good at picking up on the motion of my mini, plastic pool balls I'd decided to use for trackballs. It was also really hard to solder on to the Pro-Micro clock pad, which on this board was on the back of one of the LEDs.

I had a look around for some alternatives. I settled on an ADNS9800 sensor. Intially I started to make my own design to house the sensor, but this was quite a steep learning curve for me. I ended up getting a board from BLA. I also switched to using Teensy 2.0s for controllers, as they have a breakout pin for the clock. Once it arrived in the mail, I soon got the sample code working with the sensor. It was a start. It took a lot longer to get things working with the Teensy, running QMK, communicating with the sensor, although not as long as I feared. I was pretty stoked when I finally got it all working, as I couldn't really find anyone else (at the time) who had it working, so it could have been a showstopper!

<figure>
  <img src="{{site.baseurl}}/assets/images/pro-micro.png" alt="Pro Micro"/>
  <figcaption>The pad on the Pro Micro used to access the clock; a bit hard for me to solder!</figcaption>
</figure>

<figure>
  <img src="{{site.baseurl}}/assets/images/breadboard_adns.jpg" alt="ADNS"/>
  <figcaption>Teensy 2.0s running QMK, communicating over I2C, connected to ADNS9800, communication over serial</figcaption>
</figure>

# Case/plate design

### Blender

I'd used Maya, a 3D rendering package, in uni, so I thought I'd try out a free alternative: Blender. I had a play around, learnt the basics, and made a rough draft. However, I quickly came across some limits, or rather some friction, when dealing with technical designs in Blender. While you can stack modifiers on top of each other, it's hard to parameterise _everything_. So I started to look into other options.

<figure>
  <img src="{{site.baseurl}}/assets/images/blender.png" alt="Blender"/>
  <figcaption>Blender looked nice but was hard to do technical modelling</figcaption>
</figure>

### OpenSCAD

I looked thought a few options, and settled on OpenSCAD, which allows you to code the whole your whole design, and tweak values wherever you want. This was also a relatively easy learning curve for me as programmer, and works pretty nicely with source control as a bonus. It took a while, but eventually I had my plates, case and PCB outline modelled.

<figure>
  <img src="{{site.baseurl}}/assets/images/scad.png" alt="OpenSCAD"/>
  <figcaption>OpenSCAD final model</figcaption>
</figure>

# Plates

I generated my plate files, two per hand and two per thumb, which I'd decided to get laser cut in 1.5mm steel. I looked at a few services, and sent off the right thumb piece to [Lasergist](https://lasergist.com/) for an initial test. While waiting for it's delievery, I found [LaserBoost](https://www.laserboost.com/) (note, not _Lasergist_), took direct .dxf files, which made things a little easier. I'd just allocated a bit of extra money so I just sent it all off to LaserBoost. Comparing the experience, I found Lasergist to be a little slow, although to be fair it was in the middle of the Christmas break. I also found LaserBoost to have neater cuts, and also allow for higher precision on designs (LaserBoost min. hole diameter 1.5mm on 1.5mm thick steel, whereas Lasergist is 3.0mm).

As my plates were going to be exposed in the case design, I also decided to paint them. I used a couple coats of primer, a couple of neon pink, and a clear satin coat to finish. It came out great, however I stored them a little prematurely, causing some blemishes on the still-wet paint.

<figure>
  <img src="{{site.baseurl}}/assets/images/laserboost_lasergist.jpg" alt="Cut comparison"/>
  <figcaption>Lasergist vs LaserBoost; LaserBoost (right) allows for smaller drill holes, and neater cuts (see corners of bottom square)</figcaption>
</figure>

<figure>
  <img src="{{site.baseurl}}/assets/images/spray-2.jpg" alt="Painting plates"/>
  <figcaption>Painting plates, learning as I go</figcaption>
</figure>

<figure>
  <img src="{{site.baseurl}}/assets/images/spray-3.jpg" alt="Painted plates"/>
  <figcaption>Came out pretty good</figcaption>
</figure>

# PCB

I didn't want a repeat of my dodgy, flakey handwire. I thought it would also be nice to have something reproducible, plus I'd also partly started to endeaver to learn new things. So I decided to design my on PCB (printed circuit board). To save money, I decided to make the thing reversible, so the same PCB could be used for both left and right sides. Unsurprisingly, it all turned out to be a lot more work than I anticipated. 

I ended up going with [JLCPCB](http://jlcpcb.com/), a Chinese PCB manufacturor with really cheap prices. I was really happy with the result. I orded during Chinese New Year (2020), so COVID-19 was just starting to hit. At the time of writing a lot is still unknown about the virus, but I definitely wouldn't be expecting any international deliveries to arrive promptly.

<figure>
  <img src="{{site.baseurl}}/assets/images/schematic.png" alt="Schematic"/>
  <figcaption>KiCad schematic</figcaption>
</figure>

<figure>
  <img src="{{site.baseurl}}/assets/images/footprint.png" alt="Footprint"/>
  <figcaption>Physical PCB layout</figcaption>
</figure>

<figure>
  <img src="{{site.baseurl}}/assets/images/pcb-1.jpg" alt="PCBs"/>
  <figcaption>PCBs printed by JLCPCB</figcaption>
</figure>

<figure>
  <img src="{{site.baseurl}}/assets/images/soldered-1.jpg" alt="Soldered"/>
  <figcaption>Components and switches soldered into PCB</figcaption>
</figure>

<figure>
  <img src="{{site.baseurl}}/assets/images/soldered-3.jpg" alt="Soldered"/>
  <figcaption>From the top</figcaption>
</figure>

<figure>
  <img src="{{site.baseurl}}/assets/images/soldered-2.jpg" alt="Soldered"/>
  <figcaption>Top and bottom</figcaption>
</figure>

# Construction