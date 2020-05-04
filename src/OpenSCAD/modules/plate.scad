include <../config.scad>;

function getTrackballZ() = 
    PLATE_THICKNESS +
    -STANDOFF_HEIGHT +
    TRACKBALL_LENS_HEIGHT_ABOVE_BOARD +
    TRACKBALL_LENS_CLEARANCE +
    TRACKBALL_DIAMETER * 0.5;
    
function getTrackballHoleRadius() =
    sqrt(
        (TRACKBALL_DIAMETER * TRACKBALL_DIAMETER) / 4 -
        getTrackballZ() * getTrackballZ())
        + TRACKBALL_PLATE_CLEARANCE;

// draws a 2D circle representing a bolt hole
module boltHole(){
    circle(d = BOLT_DIAMETER + BOLT_TOLERENCE * 2);
}

// draws a 2D plate with the given key positions in 1U space
module plate(
    keyPositions = [],
    keyHeight = 1.0,
    boltPositions = [],
    cutSwitchHoles = true,
    hull = false){

    module solidPlate(){
        offset(delta = -PLATE_CURVE_RADIUS)
            for(keyPosition = keyPositions)
                translate([keyPosition.x, keyPosition.y * keyHeight] * 1U)

                    if(keyPosition.z == "trackball")
                        translate([0.5, 0.5 * keyHeight] * 1U + [PLATE_BEZEL,PLATE_BEZEL])
                            offset(r = PLATE_BEZEL + (1U - SWITCH_WIDTH) * 0.5)
                                circle(r = getTrackballHoleRadius());

                    else
                        square([1, keyHeight] * (1U + PLATE_BEZEL * 2));
    }

    difference(){
        
        // outline
        minkowski() {
            if(hull)
                hull()
                    solidPlate();
            else
                solidPlate();
            
            circle(r = PLATE_CURVE_RADIUS);
        }
        
        // cutouts
        translate([PLATE_BEZEL, PLATE_BEZEL]){

            if(cutSwitchHoles)
                for(keyPosition = keyPositions)
                    translate([keyPosition.x + 0.5, (keyPosition.y + 0.5) * keyHeight] * 1U)

                    if(keyPosition.z == "trackball")
                        circle(r = getTrackballHoleRadius());
                    else
                        translate(-[SWITCH_WIDTH, SWITCH_WIDTH] * 0.5)
                            square([SWITCH_WIDTH,SWITCH_WIDTH]);                        

            for(keyPosition = keyPositions)
                if(keyPosition.z == "trackball")
                    translate([keyPosition.x + 0.5, (keyPosition.y + 0.5) * keyHeight] * 1U){
                        translate([0, TRACKBALL_PCB_MOUNT_OFFSET, 0])
                            boltHole();
                        translate([0, -TRACKBALL_PCB_MOUNT_OFFSET, 0])
                            boltHole();
                    }

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
    cutSwitchHoles = true,
    $fn = 100);