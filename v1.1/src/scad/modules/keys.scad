include<../config.scad>;
use<./plate.scad>;
use<./bearing_mount.scad>;
use<./switch.scad>;
use<./keycap.scad>;

// draws 3D keycaps and trackballs with the given positions in 1U space
module keys(
    keyPositions = [],
    keyHeight = 1.0){
        
    for(keyPosition = keyPositions)
        translate([keyPosition.x, keyPosition.y * keyHeight] * 1U + [PLATE_BEZEL,PLATE_BEZEL])
        
            if(keyPosition.z == "trackball")
                translate([0.5, 0.5 * keyHeight, 0] * 1U){
                    
                    translate([0, 0, getTrackballZ()])
                        sphere(d = TRACKBALL_DIAMETER);
                    
                    translate([0, TRACKBALL_PCB_MOUNT_OFFSET, -STANDOFF_HEIGHT])
                        cylinder(r = BOLT_DIAMETER, h = STANDOFF_HEIGHT);
                    
                    translate([0, -TRACKBALL_PCB_MOUNT_OFFSET, -STANDOFF_HEIGHT])
                        cylinder(r = BOLT_DIAMETER, h = STANDOFF_HEIGHT);

                    translate([0, 0, -STANDOFF_HEIGHT - TRACKBALL_PCB_THICKNESS])
                        cylinder(d = TRACKBALL_PCB_DIAMETER, h = TRACKBALL_PCB_THICKNESS);

                    translate([0,0, PLATE_THICKNESS])
                        bearingMount();
                }

            else
                translate([0,  (keyHeight - 1) * 1U * 0.5, PLATE_THICKNESS]){
                    keycap(keyHeight);
                    switch();
                }
}

keys(FINGER_GRID, $fn = 50);