include <../config.scad>;
use <../modules/shapes.scad>;
use <../modules/plate.scad>;

module adnsCover(){
    difference(){
        linear_extrude(STANDOFF_HEIGHT)
            difference(){
                circle(d = ADNS_PCB_DIAMETER);
                
                // bolts cutouts

                translate([0, TRACKBALL_PCB_MOUNT_OFFSET])
                    circle(d = BOLT_DIAMETER + BOLT_TOLERENCE * 2);

                translate([0, -TRACKBALL_PCB_MOUNT_OFFSET])
                    circle(d = BOLT_DIAMETER + BOLT_TOLERENCE * 2);

                // laser channel
                squircle(
                    size = [ADNS_LASER_CHANNEL_WIDTH, ADNS_LASER_CHANNEL_HEIGHT],
                    radius = 1,
                    center = true);
            }

        linear_extrude(ADNS_LENS_HEIGHT_ABOVE_BOARD + 1)
            squircle(
                size = [ADNS_LENS_WIDTH, ADNS_LENS_HEIGHT],
                radius = 4,
                center = true);
                
        translate([0, 0, getTrackballZ() + STANDOFF_HEIGHT - ADNS_LENS_TRACKBALL_CLEARANCE])
            sphere(d = TRACKBALL_DIAMETER);
    }
}

adnsCover($fn = 100);