include <../config.scad>;
use <../modules/shapes.scad>;
use <../modules/plate.scad>;

module pmwCover(){

    module boltHoles(){

        boltCutout = BOLT_DIAMETER + BOLT_TOLERENCE * 2;
        cutoutLength = SENSOR_PCB_MOUNT_OFFSET - PMW_PCB_MOUNT_OFFSET + boltCutout;

        translate([0, PMW_PCB_MOUNT_OFFSET + (cutoutLength - boltCutout ) / 2])
            squircle([boltCutout, cutoutLength], boltCutout, true);

        translate([0, -PMW_PCB_MOUNT_OFFSET - (cutoutLength - boltCutout) / 2])
            squircle([boltCutout, cutoutLength], boltCutout, true);
    }

    difference(){
        linear_extrude(getStandoffHeight())
            difference(){

                union(){
                    square([PMW_PCB_WIDTH, PMW_PCB_HEIGHT], center = true);
                    offset(1.5)
                        boltHoles();
                }

                boltHoles();

                // laser channel
                squircle(
                    size = [SENSOR_CHANNEL_WIDTH, SENSOR_CHANNEL_HEIGHT],
                    radius = 1,
                    center = true);
            }
        
        // cutout for sensor
        linear_extrude(SENSOR_LENS_HEIGHT_ABOVE_BOARD)
            squircle(
                size = [SENSOR_LENS_WIDTH, SENSOR_LENS_HEIGHT],
                radius = 4,
                center = true);
                
        // cutout for trackball
        translate([0, 0, TRACKBALL_POSITION_Z + getStandoffHeight()])
            sphere(d = TRACKBALL_DIAMETER + SENDOR_TRACKBALL_CLEARANCE);
    }
}

pmwCover($fn = 20);