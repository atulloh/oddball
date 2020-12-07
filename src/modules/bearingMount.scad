include <../config.scad>;
use <./plate.scad>;

module hole(){

    linear_extrude(BEARING_BOLT_CLEARANCE_Z){
        boltHole();

        translate([0,-SENSOR_PCB_MOUNT_OFFSET * 0.5])
            square([BOLT_DIAMETER + BOLT_TOLERENCE * 2, SENSOR_PCB_MOUNT_OFFSET], center = true);
    }

    translate([0,0, BEARING_BOLT_CLEARANCE_Z])
        linear_extrude(BOLT_TOP_HEIGHT){

            circle(d = BOLT_TOP_DIAMETER + BOLT_TOLERENCE * 2);            
            
            translate([0,-SENSOR_PCB_MOUNT_OFFSET * 0.5])
                square([BOLT_TOP_DIAMETER + BOLT_TOLERENCE * 2, SENSOR_PCB_MOUNT_OFFSET], center = true);
        }
    
}

module bearingMount(){

    trackballRadius = getTrackballHoleRadius();
    ringWidthBottom = TRACKBALL_PLATE_BEZEL;
    
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

        for (i = [0:2]) {
            
            angle = 120 * i;

            translate([cos(angle), sin(angle), 0] * bearingOffsetXY){
                rotate([0, 0, angle]){
                    translate([0,0, BEARING_OFFSET_Z])
                        sphere(d = BEARING_DIAMETER);

                    cutoutLength = 5;
                    translate([-cutoutLength * 0.25, 0, 0])
                        cube([
                            cutoutLength, 
                            1, 
                            BEARING_OFFSET_Z + BEARING_DIAMETER * 0.75], 
                            center = true);
                }
            }
        }
            
        // standoff holes

        for (i = [0:1]) {
            
            angle = 180 * i;
            
            rotate([0, 0, angle])                
                translate([0, SENSOR_PCB_MOUNT_OFFSET])
                    hole();
        }        
    }

    if(DRAW_DEBUG)
        %translate([0,0,getTrackballZ()])
            sphere(d = TRACKBALL_DIAMETER);
}

bearingMount($fn = 20);