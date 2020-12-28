include <../config.scad>;
use <./plate.scad>;

bearingOffsetXY = 
    sqrt(
        (TRACKBALL_DIAMETER * TRACKBALL_DIAMETER) / 4 -
        ((BEARING_OFFSET_Z + PLATE_THICKNESS) * (BEARING_OFFSET_Z + PLATE_THICKNESS)))
        + BEARING_DIAMETER * 0.5;

module hole(){

    linear_extrude(BEARING_BOLT_CLEARANCE_Z){
        boltHole();

        translate([0,-SENSOR_PCB_MOUNT_OFFSET * 0.5])
            square([BOLT_DIAMETER + BOLT_TOLERENCE * 2, SENSOR_PCB_MOUNT_OFFSET], center = true);
    }

    translate([0,0, BEARING_BOLT_CLEARANCE_Z])
        linear_extrude(BOLT_TOP_HEIGHT + BEARING_MOUNT_BOLT_TOP_CLEARANCE){

            circle(d = BOLT_TOP_DIAMETER + BOLT_TOLERENCE * 2);            
            
            translate([0,-SENSOR_PCB_MOUNT_OFFSET * 0.5])
                square([BOLT_TOP_DIAMETER + BOLT_TOLERENCE * 2, SENSOR_PCB_MOUNT_OFFSET], center = true);
        }    
}

module bearingMount(){
    
    difference()
    {
        trackballRadius = getTrackballHoleRadius();
        ringWidthBottom = TRACKBALL_PLATE_BEZEL;
        
        // general ring
        
        rotate_extrude(convexity = 10)
            minkowski(){
                difference(){
                    polygon([
                        [0,0],
                        [trackballRadius + ringWidthBottom - BEARING_MOUNT_TOP_CURVE_RADIUS, 0],
                        [trackballRadius - BEARING_MOUNT_TOP_CURVE_RADIUS + BEARING_MOUNT_TOP_X_MAX, BEARING_MOUNT_HEIGHT - BEARING_MOUNT_TOP_CURVE_RADIUS],
                        [0, BEARING_MOUNT_HEIGHT - BEARING_MOUNT_TOP_CURVE_RADIUS],
                    ]);
                    
                    ballCutoutRadius = TRACKBALL_DIAMETER * 0.5 + TRACKBALL_BEARING_MOUNT_CLEARANCE;

                    translate([0,TRACKBALL_POSITION_Z])
                        intersection(){
                            circle(r = ballCutoutRadius);
                            translate([0, -ballCutoutRadius])
                                square([ballCutoutRadius, ballCutoutRadius] * 2);
                        }
                }
                
                difference(){
                    circle(r = BEARING_MOUNT_TOP_CURVE_RADIUS);
                    translate([-BEARING_MOUNT_TOP_CURVE_RADIUS, -BEARING_MOUNT_TOP_CURVE_RADIUS * 2])
                        square([BEARING_MOUNT_TOP_CURVE_RADIUS * 2, BEARING_MOUNT_TOP_CURVE_RADIUS * 2]);
                }
            }

        // bearing holes

        for (i = [0:2]) {
            
            angle = 120 * i;

            translate([cos(angle), sin(angle), 0] * bearingOffsetXY)
                rotate([0, 0, angle])
                    translate([0,0, BEARING_OFFSET_Z])
                        sphere(d = BEARING_DIAMETER + BEARING_TOLERENCE * 2);
        }
            
        // bolt holes

        for (i = [0:1]) {
            
            angle = 180 * i;
            
            rotate([0, 0, angle])                
                translate([0, SENSOR_PCB_MOUNT_OFFSET])
                    hole();
        }        
    }
}

bearingMount($fn = 20);