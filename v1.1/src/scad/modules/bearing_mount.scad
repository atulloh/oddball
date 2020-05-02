include<../config.scad>;
use<./plate.scad>;

bearing_height = 4.5;

module hole(){

    screw_clearance = 1.5;

    linear_extrude(screw_clearance)
        boltHole();

    translate([0,0,screw_clearance])
        linear_extrude(5)
            circle(d = 4);
}

module bearingMount(){

    trackballRadius = getTrackballHoleRadius();
    ringWidthBottom = PLATE_BEZEL + (1U - SWITCH_WIDTH) * 0.5;
    ringTopMinX = 2.5;
    ringTopMaxX = 3.5;
    mount_curve_radius = 0.5;
    
    difference(){
        
        union(){

            rotate_extrude(convexity = 10)
                minkowski(){
                    polygon([
                        [trackballRadius + mount_curve_radius,0],
                        [trackballRadius + ringWidthBottom - mount_curve_radius, 0],
                        [trackballRadius - mount_curve_radius + ringTopMaxX, bearing_height - mount_curve_radius],
                        [trackballRadius + mount_curve_radius + ringTopMinX, bearing_height - mount_curve_radius],
                    ]);
                    
                    difference(){
                        circle(r = mount_curve_radius);
                        translate([-mount_curve_radius, -mount_curve_radius * 2])
                            square([mount_curve_radius * 2,mount_curve_radius * 2]);
                    }
                }
        }

        // bearing holes

        translate([0,0,TRACKBALL_BEARING_OFFSET_Z])
            for (i = [0:2]) {
                
                angle = 120 * i;

                translate([cos(angle), sin(angle), 0] * (trackballRadius + BEARING_DIAMETER / 2 + 0.4)){                
                    rotate([0, 0, angle])                        
                        rotate([0, -25, 0]){
                            sphere(d = BEARING_DIAMETER);

                            translate([0,0,-10])
                                cylinder(h = 10, d = 1);
                        }
                }
            }
            
        // standoff holes

        translate([0, -32/2 + 2])
            hole();

        translate([0, 32/2 - 2])
            hole();
        
    }
}

bearingMount($fn = 100);