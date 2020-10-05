---
comments: true
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

# Oddball v2: Build Log

<figure>
  <img src="{{site.baseurl}}/assets/images/todo.jpg" alt="Assembled"/>
  <figcaption>TODO: add pic</figcaption>
</figure>

## Round 2... Fight! 

I've been using my [Oddball v1]({{site.baseurl}}/v1/build-guide) for around 6 months. I really like it; having a trackball embedded in the keyboard really exceeded my expectations. It helps with all kinds of everyday tasks, and saves you from blindly having to find your way to your mouse and back again. I actually found it a bit limiting when I had to switch back to my more traditional keyboard with a separate mouse; so much so I decided to build another so I could have one for both work and at home. However, if I was going to make another, there were some improvements I wanted to make!

### Trackball position

The trackball was a _tiny_ bit of a stretch. While not a dealbreaker, it would have been nice if it was a little lower and closer to the thumb.

TODO: before/after picture


### Trackball sensor

The ADNS9800 sensor was fine, but I'd noticed the [Ploopy trackball](https://www.ploopy.co/) was using the PMW33600 internally, which was slightly newer, offered higher DPI, ran with more flexible input voltages, along with a few other features. The PMW3360 was a slightly newer sensor, and although seeemed to be manufactured by different companies, the interfacing code needed was nearly identical, so it was pretty easy to switch. Again, [JACK Enterprise on Tindie had a breakout board](https://www.tindie.com/products/jkicklighter/pmw3360-motion-sensor/) with the necessary resistors/capactiros/etc ready to go.

It was a slightly different shape, so it forced me to increase the plate and housing a little around the trackball.

TODO: sensor photos vs housing shapes

As a bonus, going over the trackball code for v1 for the PMW changes, I found a few bugs and improved the trackball motion for v1!

### Ease-of-build

Oddball v1 had included my first PCB design, and in it I'd made a few mistakes. The main issues were a few silkscreens were back-to-font (diodes and TRRS sockets), and not enough clearance between the TRRS jacks and the switches. These were relatively easy fixes, which I ammended in the (r1.1 PCB)[] //TODO fix link.

// TODO: improvement pcb pics

The other issues were actually with the case: the tolerences were pretty slim and things were a tight fit. I knocked off one of the TRRS jacks just trying to get it all assembled, and the screws I was planning on using to hold it together weren't actually long enough.

### Changing to use Elite-C

I'd used Teensy 2.0 MCUs in v1, which used Micro USB ports, which are pretty daggy. USB-C is much cooler, especially when you are plugging into a socket behind a keyboard you can't really see. As another bonus, the pinout is similar to Pro Micros or something like the (nice!nano)[https://nicekeyboards.com/products/nice-nano-v1-0] if I/someone ever wanted to make the Oddball wireless.

//TODO: elite c pic

### Look

The kids-toy-vibe of the v1 was cute, but I thought I'd try to go a bit more stylish for v2. This involved _not_ painting the plates, and getting brass plates instead.

// TODO brass plates

I also thought I'd lube my switches, go all out on keycaps, and leverage the 8-ball which feels like the epitome of pool imagry/iconography.

// TODO: keycaps/closeup

### Clean code

#### Case

I doubt many people will care, but I completely rewrote the OpenSCAD code for v2. I even nearly managed to do it all with barely any (magic numbers)[https://en.wikipedia.org/wiki/Magic_number_(programming)], but a few snuck in. The rewrite should make it much easier for me if I (or perhaps someone else) ever come back to this code base and needs to change something.

#### QMK

As I mentioned earlier, in adding suport for the PMW3600, I also came across some bugs in my initial code which I've now fixed:
- failed debounces (key pressed)
- mouse jittering
- keyboard failing to start

## Closing throughts
