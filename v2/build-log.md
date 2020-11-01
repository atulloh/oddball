---
title: Build Log
parent: v2
---

# v2 Build Log

<figure>
  <img src="{{site.baseurl}}/assets/images/todo.jpg" alt="Assembled"/>
  <figcaption>TODO: add pic</figcaption>
</figure>

## Round 2... Fight! 

I've been using my [Oddball v1]({{site.baseurl}}/v1/build-guide) for around 6 months. I really like it; having a trackball embedded in the keyboard really exceeded my expectations. It helps with all kinds of everyday tasks, and saves you from blindly having to find your way to your mouse and back again. I actually found it a bit limiting when I had to switch back to my more traditional keyboard with a separate mouse; so much so I decided to build another so I could have one for both work and at home. However, if I was going to make another, there were some improvements I wanted to make!

### Trackball

#### Position

The trackball was a _tiny_ bit of a stretch. While not a dealbreaker, it would have been nice if it was a little lower and closer to the thumb.

<figure>
  <img src="{{site.baseurl}}/assets/images/thumb-plate-v1.PNG" alt="Thumb plate v1"/>
  <figcaption>v1 right thumb plate</figcaption>
</figure>

<figure>
  <img src="{{site.baseurl}}/assets/images/thumb-plate-v2.PNG" alt="Thumb plate v2"/>
  <figcaption>v2 right thumb plate; trackball closer to hand/wrist</figcaption>
</figure>

### Sensor and housing

The ADNS9800 sensor was fine, but I'd noticed the [Ploopy trackball](https://www.ploopy.co/) was using the PMW33600 internally, which was slightly newer, offered higher DPI, ran with more flexible input voltages, along with a few other features. The PMW3360 was a slightly newer sensor, and although seeemed to be manufactured by different companies, the interfacing code needed was nearly identical, so it was pretty easy to switch. Again, [JACK Enterprise on Tindie had a breakout board](https://www.tindie.com/products/jkicklighter/pmw3360-motion-sensor/) with the necessary resistors/capactiros/etc ready to go.

It was a slightly different shape, so it forced me to increase the plate and housing a little around the trackball. I printed a cover to fit it nicely, rather than relying on M2 standoffs, as previously the lens could fall out if you jiggled the whole thing upsidedown.

<figure>
  <img src="{{site.baseurl}}/assets/images/pmw-cover.jpg" alt="PMW cover"/>
  <figcaption>Piece to sit under switch plate and above PMW sensor</figcaption>
</figure>

<figure>
  <img src="{{site.baseurl}}/assets/images/pmw-cover-assembled.jpg" alt="PMW cover assembled"/>
  <figcaption>Sensor lens held snuggly in place</figcaption>
</figure>

<figure>
  <img src="{{site.baseurl}}/assets/images/thumb-test-1.jpg" alt="Thumb assembly top"/>
  <figcaption>Testing thumb section assembly top</figcaption>
</figure>

<figure>
  <img src="{{site.baseurl}}/assets/images/thumb-test-2.jpg" alt="Thumb assembly bottom"/>
  <figcaption>Testing thumb section assembly bottom</figcaption>
</figure>

As a bonus, going over the trackball code for v1 for the PMW changes, I found a few bugs and improved the trackball motion for v1!

I also went back and added a simliar thing for the ADNS9800, which I'd used in v1, but also wanted to support in v2:

<figure>
  <img src="{{site.baseurl}}/assets/images/adns-cover-top.jpg" alt="ADNS cover top"/>
  <figcaption>ADNS 9800 cover</figcaption>
</figure>

<figure>
  <img src="{{site.baseurl}}/assets/images/adns-cover-bottom.jpg" alt="ADNS cover bottom"/>
  <figcaption>Much better</figcaption>
</figure>

### PCB

Oddball v1 had included my first PCB design, and in it I'd made a few mistakes. The main issues were a few silkscreens were back-to-font (diodes and TRRS sockets), and not enough clearance between the TRRS jacks and the switches. These were relatively easy fixes, which I ammended in the [r1.1 PCB](https://github.com/atulloh/oddball/tree/master/output/pcbs/v1.1), and doubled checked for [r2.0 PCB](https://github.com/atulloh/oddball/tree/master/output/pcbs/v2.0).

I'd used Teensy 2.0 MCUs in v1, which used Micro USB ports, which are pretty daggy. USB-C is much cooler, especially when you are plugging into a socket behind a keyboard you can't really see. As another bonus, the pinout is similar to Pro Micros or something like the (nice!nano)[https://nicekeyboards.com/products/nice-nano-v1-0] if I/someone ever wanted to make the Oddball wireless.

<figure>
  <img src="{{site.baseurl}}/assets/images/r2-pcb-1.jpg" alt="r2.0 PCB side A"/>
  <figcaption>Fixed a few issues</figcaption>
</figure>

<figure>
  <img src="{{site.baseurl}}/assets/images/r2-pcb-2.jpg" alt="r2.0 PCB side B"/>
  <figcaption>And switched to use an Elite C</figcaption>
</figure>

### Look

#### Plates

The kids-toy-vibe of the v1 was cute, but I thought I'd try to go a bit more stylish for v2. This involved _not_ painting the plates, and getting brass plates instead.

<figure>
  <img src="{{site.baseurl}}/assets/images/brass-plates.jpg" alt="Brass plates"/>
  <figcaption>Brass plates cut by LaserBoost</figcaption>
</figure>

#### Keycaps

I also thought I'd lube my switches, go all out on keycaps, and leverage the 8-ball which feels like the epitome of pool imagry/iconography.

// TODO: keycaps/closeup

// TODO: polishing info

### Clean code

#### Case

I doubt many people will care, but I completely rewrote the OpenSCAD code for v2. I even nearly managed to do it all with barely any (magic numbers)[https://en.wikipedia.org/wiki/Magic_number_(programming)], but a few snuck in. The rewrite should make it much easier for me if I (or perhaps someone else) ever come back to this code base and needs to change something.

<figure>
  <img src="{{site.baseurl}}/assets/images/open-scad-1.png" alt="Open SCAD 1"/>
  <figcaption>Nicer code plus debug drawing</figcaption>
</figure>

<figure>
  <img src="{{site.baseurl}}/assets/images/open-scad-2.png" alt="Open SCAD 2"/>
  <figcaption>Can quickly and easily change values to generate different layouts</figcaption>
</figure>

#### QMK

As I mentioned earlier, in adding suport for the PMW3600, I also came across some bugs in my initial code which I've now fixed:
- failed debounces (key pressed)
- mouse jittering
- keyboard failing to start

### Assembly

// TODO:

## Closing throughts
