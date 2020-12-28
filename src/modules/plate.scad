include <../config.scad>;

function getStandoffHeight() = 
    -TRACKBALL_POSITION_Z +
    SENSOR_LENS_HEIGHT_ABOVE_BOARD +
    SENSOR_LENS_CLEARANCE +
    TRACKBALL_DIAMETER * 0.5;
    
function getTrackballHoleRadius() =
    sqrt(
        (TRACKBALL_DIAMETER * TRACKBALL_DIAMETER) / 4 -
        TRACKBALL_POSITION_Z * TRACKBALL_POSITION_Z)
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
    cutHoles = true,
    hull = false){

    module solidPlate(){
        offset(delta = -PLATE_CURVE_RADIUS)
            for(keyPosition = keyPositions)
                translate([keyPosition.x, keyPosition.y * keyHeight] * 1U)

                    if(keyPosition.z == "adns" || keyPosition.z == "pmw")
                        translate([0.5, 0.5 * keyHeight] * 1U + [PLATE_BEZEL,PLATE_BEZEL])
                            offset(delta = TRACKBALL_PLATE_BEZEL)
                                circle(r = getTrackballHoleRadius());

                    else
                        square([1, keyHeight] * 1U + [1, 1] * PLATE_BEZEL * 2);
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

            if(cutHoles){
                for(keyPosition = keyPositions)
                    translate([keyPosition.x + 0.5, (keyPosition.y + 0.5) * keyHeight] * 1U)

                    if(keyPosition.z == "adns" || keyPosition.z == "pmw")
                        circle(r = getTrackballHoleRadius());
                    else
                        translate(-[SWITCH_WIDTH, SWITCH_WIDTH] * 0.5)
                            square([SWITCH_WIDTH,SWITCH_WIDTH]);                        

                for(keyPosition = keyPositions){
                    translate([keyPosition.x + 0.5, (keyPosition.y + 0.5) * keyHeight] * 1U){
                        if(keyPosition.z == "adns" || keyPosition.z == "pmw"){
                            translate([0, SENSOR_PCB_MOUNT_OFFSET, 0])
                                boltHole();
                            translate([0, -SENSOR_PCB_MOUNT_OFFSET, 0])
                                boltHole();
                        }
                    }
                }

                for(boltPosition = boltPositions)
                    translate([boltPosition.x, boltPosition.y * keyHeight] * 1U)
                        boltHole();
            }
        }
    }
}

plate(
    keyPositions = FINGER_GRID,
    keyHeight = 1.0,
    boltPositions = FINGER_BOLT_HOLES,
    cutHoles = true,
    $fn = 100);