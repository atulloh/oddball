include<../config.scad>;
use<../modules/plate.scad>;
use<../modules/bearingMount.scad>;

bearingMount($fn = 100);

if(DRAW_DEBUG)
    %translate([0,0,getTrackballZ()])
        sphere(d = TRACKBALL_DIAMETER);