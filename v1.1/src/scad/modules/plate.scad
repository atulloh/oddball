include<../config.scad>;
use<./switch.scad>;
use<./keycap.scad>;

// returns the rows of a 2D array
function rows(positions) = len(positions);

// returns the columns of a 2D array
function columns(positions) = len(positions[0]);

// returns the bolt positions of a 2D key grid
function boltPositions(keyPositions, keyHeight) = 
    [[keyPositions[0][0].x + 1, ((keyPositions[0][1].y + keyPositions[0][0].y + 1) * keyHeight - 1) / 2] * 1U,
     [keyPositions[0][columns(keyPositions) - 1].x, ((keyPositions[0][columns(keyPositions) - 1].y + keyPositions[0][columns(keyPositions) - 2].y + 1) * keyHeight - 1) / 2] * 1U,
     [keyPositions[rows(keyPositions) - 1][columns(keyPositions) - 1].x, ((keyPositions[rows(keyPositions) - 1][columns(keyPositions) - 1].y + keyPositions[rows(keyPositions) - 1][columns(keyPositions) - 2].y + 1) * keyHeight + 1) / 2] * 1U,
     [keyPositions[rows(keyPositions) - 1][0].x + 1, ((keyPositions[rows(keyPositions) - 1][0].y + keyPositions[rows(keyPositions) - 1][1].y + 1) * keyHeight + 1) / 2] * 1U];

// draws a 2D circle representing a bolt hole
module boltHole(){
    circle(d = BOLT_DIAMETER + BOLT_TOLERENCE);
}

trackballZ = 
    PLATE_THICKNESS * 0.5 +
    -STANDOFF_HEIGHT +
    TRACKBALL_LENS_HEIGHT_ABOVE_BOARD +
    TRACKBALL_LENS_CLEARANCE +
    TRACKBALL_DIAMETER * 0.5;

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
        
    for(i = [0 : rows(keyPositions) - 1])
        for(j = [0 : columns(keyPositions) - 1])
            translate([keyPositions[i][j].x, keyPositions[i][j].y * keyHeight] * 1U + [PLATE_BEZEL,PLATE_BEZEL])
            
                if(keyPositions[i][j].z == "trackball")
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
    cutSwitchHoles = true,
    cutBoltHoles = true){

    difference(){
        
        // outline
        minkowski() {
            offset(delta = -PLATE_CURVE_RADIUS)
                for(i = [0 : rows(keyPositions) - 1])
                    for(j = [0 : columns(keyPositions) - 1])
                        translate([keyPositions[i][j].x, keyPositions[i][j].y * keyHeight] * 1U)

                            if(keyPositions[i][j].z == "trackball")
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
                for(i = [0 : rows(keyPositions) - 1])
                    for(j = [0 : columns(keyPositions) - 1])
                        translate([keyPositions[i][j].x + 0.5, (keyPositions[i][j].y + 0.5) * keyHeight] * 1U)

                        if(keyPositions[i][j].z == "trackball")
                            trackballHole();
                        else
                            translate(-[SWITCH_WIDTH, SWITCH_WIDTH] * 0.5)
                                square([SWITCH_WIDTH,SWITCH_WIDTH]);                        
        
            if(cutBoltHoles)
                for(boltPosition = boltPositions(keyPositions, keyHeight))
                    translate(boltPosition)
                        boltHole();
        }
    }
}

plate(FINGER_GRID);