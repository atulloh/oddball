---
title:  "Oddball build log"
---

_TODO: links_

# Intro

I do full time programming for a job, and a bit in my spare time, so I'm typing on a keyboard a fair bit. I'd been using the ErgoDox EZ for a couple of years, along with a regular mouse and a trackball mouse.

![]({{site.baseurl}}/assets/images/ergodox.jpg)

I really liked a lot of things about the Ergodox EZ:
- split layout, along with column staggered keys (vertically aligned), allowed for more comfortable wrist rotation
- using multiple thumb keys to switch layers means I didn't have to move your hands as much, improving accuracy and speed
- it encouraged me to learn to type type "properly"
- easy-ish to change layout
- looks weird and cool

Some things were slightly frustrating:
- too many buttons; after multiple keymap iterations, there were a bunch of keys that were unneeded, which irked my programmer-removing-dead-code part of my brain
- accuracy still dropped, or performance slowed, when moving jumping my right hand to the mouse/trackball and back
- pingy noise when typing, however probably could have been mitigated via modding

So I:
- looked around, started tp see all thsese cool boards people were making, realised it was not as complicated as I thought to design something
- read "Digital Minimalism" which recommends trying to build something physical rather than digital

Decided to try to design a keyboard, retaining what I loved about the ErgoDox and then some.

I'd keep:
- split halves
- column staggered keys
- looks weird and cool

I'd remove:
- as many keys as possible

I'd add:
- integrated trackball
- weirdness and coolness

# Keymap

I decided to do all these while I was away at the beach for a few days with my family. Armed with only a pencil and some paper, I set to designing a relatively minimal keymap (I'm now aware that with stenography/chording you can take this even further!). I worked out the main key combinations. Over many pages. My wife probably thought I was crazed.

![]({{site.baseurl}}/assets/images/layout_test.jpg)

Later while testing it out, I made some slight modifications. The keymap I ended up with was:

![]({{site.baseurl}}/assets/images/layout.png)

# Scultping

To start off with, I thought I'd try to find what was comfortable. I made some playdough, and started playing around with different shapes and angles to try to find what was comfortable.

![]({{site.baseurl}}/assets/images/dough-1.jpg)
![]({{site.baseurl}}/assets/images/dough-2.jpg)

# Handwire

Next up was getting something working to see if my layout was feasible. I ended up chipping in with a friend for a relatively low-end 3D printer, a Creality Ender 3. There was lots of information around about handwireing a keyboard and using 

![]({{site.baseurl}}/assets/images/breadboard.jpg)
![]({{site.baseurl}}/assets/images/proto-1.jpg)
![]({{site.baseurl}}/assets/images/proto-2.jpg)
![]({{site.baseurl}}/assets/images/proto-3.jpg)

I used this for around 6 months before decomissioning it. I really liked the layout, but some of the connections were a bit flakey, leading to missed characters. It was very frustrating in that respect.

# Tracking motion

I also had to figure out how to do a trackball. There didn't seem to be too many ready-to-go options. One existing solution was to take apart an old PS/2 mouse, flip the sensor upside down, and put a track ball on top. I tried this, but it wasn't very successful as the older optical sensors weren't very good at picking up on the motion of my mini, plastic pool balls I'd decided to use for trackballs. It was also really hard to solder on to the Pro-Micro clock pad, which on this board was on the back of one of the LEDs:

![]({{site.baseurl}}/assets/images/pro-micro.png)

I had a look around for some alternatives. I settled on an ADNS9800 sensor. Intially I started to make my own design to house the sensor, but this was quite a steep learning curve for me. I ended up getting a board from BLA. I also switched to using Teensy 2.0s for controllers, as they have a breakout pin for the clock.

Once I got it, I soon got the sample code working with the sensor. It was a start. It took a lot longer to get things working with the Teensy, running QMK, communicating with the sensor, although not as long as I feared.

![]({{site.baseurl}}/assets/images/breadboard_adns.jpg)

I was pretty stoked to get this working, as I couldn't really find anyone else (at the time) who had it working, so it could have been a showstopper.

# Case/plate design

### Blender

I'd used Maya, a 3D rendering package, in uni, so I thought I'd try out a free alternative, Blender. I had a play around, learnt the basics, and made a rough draft.

![]({{site.baseurl}}/assets/images/blender.png)

### OpenSCAD

However, I quickly came across some limits, or rather some friction, when dealing with technical designs in Blender. While you can stack modifiers on top of each other, it's hard to parameterise _everything_. I looked thought a few options, and settled on OpenSCAD, which allows you to code the whole thing, and tweak values wherever you want. This was also a relatively easy learning curve for me as programmer.

![]({{site.baseurl}}/assets/images/scad.png)

# Printing Plates

// laserboost vs lasergist etc

# PCB

### Design

I didn't want a repeat of my dodgy, flakey handwire. I thought it would also be nice to have something reproducible, plus I'd also partly started to endeaver to learn new things. So I decided to design my on PCB (printed circuit board).

Again, free, online resources really helped me here. I installed KiCad and got stuck in. This part of the process probably took me the longest.

![]({{site.baseurl}}/assets/images/schematic.png)
![]({{site.baseurl}}/assets/images/footprint.png)

### Printing

I was pretty low on discretionary funds at this point, so I spent a while trying to find the cheapest place. I wasn't overly concerned on getting top quality as I figured this was just a prototype and their might be some issues anyway.

I settled on JLCPB. It turned out to be a really good ser

![]({{site.baseurl}}/assets/images/soldered.jpg)

# Painting



# Construction

