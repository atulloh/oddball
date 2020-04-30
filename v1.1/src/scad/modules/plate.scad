include<../config.scad>;
use<./switch.scad>;
use<./keycap.scad>;

trackballZ = 
    PLATE_THICKNESS * 0.5 +
    -STANDOFF_HEIGHT +
    TRACKBALL_LENS_HEIGHT_ABOVE_BOARD +
    TRACKBALL_LENS_CLEARANCE +
    TRACKBALL_DIAMETER * 0.5;

// draws a 2D circle representing a bolt hole
module boltHole(){
    circle(d = BOLT_DIAMETER + BOLT_TOLERENCE);
}

module trackballHole(){
    holeRadius = 
        sqrt(
            (TRACKBALL_DIAMETER * TRACKBALL_DIAMETER) / 4 -
            trackballZ * trackballZ)
            + TRACKBALL_PLATE_CLEARANCE;
            
    circle(r = holeRadius);
}

// draws 3D keycaps and trackballs with the given positions in 1U space
module keys(
    keyPositions = [],
    keyHeight = 1.0){
        
    for(keyPosition = keyPositions)
        translate([keyPosition.x, keyPosition.y * keyHeight] * 1U + [PLATE_BEZEL,PLATE_BEZEL])
        
            if(keyPosition.z == "trackball")
                translate([0.5, 0.5 * keyHeight, 0] * 1U){
                    
                    translate([0, 0, trackballZ])
                        sphere(d = TRACKBALL_DIAMETER);
                    
                    translate([0, TRACKBALL_PCB_MOUNT_OFFSET, -STANDOFF_HEIGHT])
                        cylinder(r = BOLT_DIAMETER, h = STANDOFF_HEIGHT);
                    
                    translate([0, -TRACKBALL_PCB_MOUNT_OFFSET, -STANDOFF_HEIGHT])
                        cylinder(r = BOLT_DIAMETER, h = STANDOFF_HEIGHT);

                    translate([0, 0, -STANDOFF_HEIGHT - TRACKBALL_PCB_THICKNESS])
                        cylinder(d = TRACKBALL_PCB_DIAMETER, h = TRACKBALL_PCB_THICKNESS);
                }

            else
                translate([0,  (keyHeight - 1) * 1U * 0.5, PLATE_THICKNESS]){
                    keycap(keyHeight);
                    switch();
                }
}

// draws a 2D plate with the given key positions in 1U space
module plate(
    keyPositions = [],
    keyHeight = 1.0,
    boltPositions = [],
    cutSwitchHoles = true){

    difference(){
        
        // outline
        minkowski() {
            offset(delta = -PLATE_CURVE_RADIUS)
                for(keyPosition = keyPositions)
                    translate([keyPosition.x, keyPosition.y * keyHeight] * 1U)

                        if(keyPosition.z == "trackball")
                            translate([0.5, 0.5 * keyHeight] * 1U + [PLATE_BEZEL,PLATE_BEZEL])
                                offset(r = PLATE_BEZEL + (1U - SWITCH_WIDTH) * 0.5)
                                    trackballHole();

                        else
                            square([1, keyHeight] * (1U + PLATE_BEZEL * 2));

            circle(r = PLATE_CURVE_RADIUS);
        }
        
        // cutouts
        translate([PLATE_BEZEL, PLATE_BEZEL]){

            if(cutSwitchHoles)
                for(keyPosition = keyPositions)
                    translate([keyPosition.x + 0.5, (keyPosition.y + 0.5) * keyHeight] * 1U)

                    if(keyPosition.z == "trackball")
                        trackballHole();
                    else
                        translate(-[SWITCH_WIDTH, SWITCH_WIDTH] * 0.5)
                            square([SWITCH_WIDTH,SWITCH_WIDTH]);                        

            for(boltPosition = boltPositions)
                translate([boltPosition.x, boltPosition.y * keyHeight] * 1U)
                    boltHole();
        }
    }
}

plate(
    keyPositions = FINGER_GRID,
    keyHeight = 1.0,
    boltPositions = FINGER_BOLT_HOLES,
    cutSwitchHoles = true);