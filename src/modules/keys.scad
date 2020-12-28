include <../config.scad>;
use <./plate.scad>;
use <./adnsCover.scad>;
use <./pmwCover.scad>;
use <./bearingMount.scad>;
use <./switch.scad>;
use <./keycap.scad>;

// draws 3D keycaps and trackballs with the given positions in 1U space
module keys(
    keyPositions = [],
    keyHeight = 1.0){
        
    for(keyPosition = keyPositions)
        translate([keyPosition.x, keyPosition.y * keyHeight] * 1U + [PLATE_BEZEL,PLATE_BEZEL])
        
            if(keyPosition.z == "adns" || keyPosition.z == "pmw")
                translate([0.5, 0.5 * keyHeight, 0] * 1U){
                    
                    // trackball
                    translate([0, 0, TRACKBALL_POSITION_Z])
                        sphere(d = TRACKBALL_DIAMETER);
                        
                    // trackball mount
                    translate([0,0, PLATE_THICKNESS])
                        bearingMount();

                    // sensor cover                    
                    translate([0, 0, -getStandoffHeight()]){
                        if(keyPosition.z == "adns")
                            adnsCover();
                        else
                            pmwCover();
                    }

                    // sensor
                    translate([0, 0, -getStandoffHeight() - SENSOR_PCB_THICKNESS]){
                        if(keyPosition.z == "adns")
                            cylinder(d = TRACKBALL_BOLT_HOLES_DIAMETER, h = SENSOR_PCB_THICKNESS);
                        else
                            translate([0, 0, SENSOR_PCB_THICKNESS * 0.5])
                                cube([PMW_PCB_WIDTH, PMW_PCB_HEIGHT, SENSOR_PCB_THICKNESS], center = true);
                    }                            
                }

            else
                translate([0,  (keyHeight - 1) * 1U * 0.5, PLATE_THICKNESS]){
                    keycap(keyHeight);
                    switch();
                }
}

keys(FINGER_GRID, $fn = 100);