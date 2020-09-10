include <../config.scad>;
use <./plate.scad>;

module hole(){

    linear_extrude(BEARING_BOLT_CLEARANCE_Z)
        boltHole();

    translate([0,0, BEARING_BOLT_CLEARANCE_Z])
        linear_extrude(BEARING_MOUNT_HEIGHT)
            circle(d = BOLT_TOP_DIAMETER + BOLT_TOLERENCE * 2);
}

module bearingMount(){

    trackballRadius = getTrackballHoleRadius();
    ringWidthBottom = TRACKBALL_PLATE_BEZEL + (1U - SWITCH_WIDTH) * 0.5;
    
    difference(){
        
        union(){

            rotate_extrude(convexity = 10)
                minkowski(){
                    polygon([
                        [trackballRadius + BEARING_MOUNT_TOP_CURVE_RADIUS,0],
                        [trackballRadius + ringWidthBottom - BEARING_MOUNT_TOP_CURVE_RADIUS, 0],
                        [trackballRadius - BEARING_MOUNT_TOP_CURVE_RADIUS + BEARING_MOUNT_TOP_X_MAX, BEARING_MOUNT_HEIGHT - BEARING_MOUNT_TOP_CURVE_RADIUS],
                        [trackballRadius + BEARING_MOUNT_TOP_CURVE_RADIUS + BEARING_MOUNT_TOP_X_MIN, BEARING_MOUNT_HEIGHT - BEARING_MOUNT_TOP_CURVE_RADIUS],
                    ]);
                    
                    difference(){
                        circle(r = BEARING_MOUNT_TOP_CURVE_RADIUS);
                        translate([-BEARING_MOUNT_TOP_CURVE_RADIUS, -BEARING_MOUNT_TOP_CURVE_RADIUS * 2])
                            square([BEARING_MOUNT_TOP_CURVE_RADIUS * 2, BEARING_MOUNT_TOP_CURVE_RADIUS * 2]);
                    }
                }
        }

        // bearing holes

        bearingOffsetXY = 
            sqrt(
                (TRACKBALL_DIAMETER * TRACKBALL_DIAMETER) / 4 -
                ((BEARING_OFFSET_Z + PLATE_THICKNESS) * (BEARING_OFFSET_Z + PLATE_THICKNESS)))
                + BEARING_DIAMETER * 0.5;

        translate([0,0, BEARING_OFFSET_Z])
            for (i = [0:2]) {
                
                angle = 120 * i;

                translate([cos(angle), sin(angle), 0] * bearingOffsetXY){
                    rotate([0, 0, angle])                
                        sphere(d = BEARING_DIAMETER);
                }
            }
            
        // standoff holes

        translate([0, SENSOR_PCB_MOUNT_OFFSET])
            hole();

        translate([0, -SENSOR_PCB_MOUNT_OFFSET])
            hole();
        
    }
}

bearingMount($fn = 100);