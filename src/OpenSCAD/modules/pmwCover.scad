include <../config.scad>;
use <../modules/shapes.scad>;
use <../modules/plate.scad>;

module pmwCover(){
    difference(){
        linear_extrude(STANDOFF_HEIGHT)
            difference(){
                square([PMW_PCB_WIDTH, PMW_PCB_HEIGHT], center = true);
                
                // bolts cutouts

                translate([0, SENSOR_PCB_MOUNT_OFFSET])
                    circle(d = BOLT_DIAMETER + BOLT_TOLERENCE * 2);

                translate([0, -SENSOR_PCB_MOUNT_OFFSET])
                    circle(d = BOLT_DIAMETER + BOLT_TOLERENCE * 2);

                // laser channel
                squircle(
                    size = [SENSOR_CHANNEL_WIDTH, SENSOR_CHANNEL_HEIGHT],
                    radius = 1,
                    center = true);
            }
        
        // cutout for sensor
        linear_extrude(SENSOR_LENS_HEIGHT_ABOVE_BOARD + 1)
            squircle(
                size = [SENSOR_LENS_WIDTH, SENSOR_LENS_HEIGHT],
                radius = 4,
                center = true);
                
        // cutout for trackball
        translate([0, 0, getTrackballZ() + STANDOFF_HEIGHT + PLATE_THICKNESS - 1])
            sphere(d = TRACKBALL_DIAMETER);
    }
}

pmwCover($fn = 100);