include <../config.scad>;
use <./plate.scad>;
use <./keys.scad>;

module case(
    fingerKeyPositions = [],
    fingerKeyHeight = 1.0,
    thumbKeyPositions = [],
    thumbKeyHeight = 1.25){


    module caseOutline(
        keyPositions,
        keyHeight,
        offset,
        rotation){
            
        big = 500;

        translate([offset.x, offset.y, 0])
            rotate([0,0, rotation.z])
                difference(){
                    linear_extrude(big)
                        projection()
                            // case plane
                            translate([0,0, offset.z])
                                rotate([0, rotation.y, 0])
                                    rotate([rotation.x,0,0]){
                                        linear_extrude(0.001)
                                            hull()
                                                offset(delta = CASE_PLATE_BEZEL)
                                                    plate(keyPositions, keyHeight);
                                        
                                        translate([0,0,PCB_PLATE_OFFSET_Z + PCB_UNDERSIDE_CLEARANCE * PCB_THICKNESS])
                                            linear_extrude(0.001)
                                                hull()
                                                    offset(delta = CASE_PLATE_BEZEL)
                                                        plate(keyPositions, keyHeight);

                                        if(DRAW_DEBUG)
                                            %translate([
                                                0,
                                                0,
                                                PCB_PLATE_OFFSET_Z + PCB_UNDERSIDE_CLEARANCE + PCB_THICKNESS]){
                                                keys(keyPositions,keyHeight);
                                                linear_extrude(PLATE_THICKNESS)
                                                    plate(keyPositions, keyHeight);
                                            }
                                    }
                        
                    translate([0,0, offset.z])
                        rotate([0,rotation.y,0])
                            rotate([rotation.x,0,0])
                                translate([
                                    -big * 0.5,
                                    -big * 0.5,
                                    PCB_PLATE_OFFSET_Z + PCB_THICKNESS + PCB_UNDERSIDE_CLEARANCE - CASE_CURVE_RADIUS + PLATE_THICKNESS])
                                    cube([big,big,big]);   
                }
    }

    module innerBody(
        keyPositions,
        keyHeight,
        offset,
        rotation){

        big = 10;
        
        translate([offset.x, offset.y, 0])
            rotate([0,0, rotation.z])
                translate([0,0, offset.z])
                    rotate([0, rotation.y, 0])
                        rotate([rotation.x,0,0]){
                            translate([0,0, PCB_PLATE_OFFSET_Z + PCB_THICKNESS + PCB_UNDERSIDE_CLEARANCE])
                                linear_extrude(big)
                                    offset(delta = CASE_PLATE_TOLERENCE)
                                        plate(
                                            keyPositions,
                                            keyHeight,
                                            cutSwitchHoles = false);
                                            
                            translate([0,0, 0])
                                linear_extrude(PCB_PLATE_OFFSET_Z + PCB_THICKNESS + PCB_UNDERSIDE_CLEARANCE)
                                    offset(delta = -CASE_PLATE_MOUNT_COVERAGE)
                                        plate(
                                            keyPositions,
                                            keyHeight,
                                            cutSwitchHoles = false);
                        }
    }

    difference(){
        minkowski()
        {
            hull()
            {
                caseOutline(
                    fingerKeyPositions,
                    fingerKeyHeight,
                    [0,0,0],
                    HAND_ROTATION);

                rotate([0,0,HAND_ROTATION.z])
                    caseOutline(
                        thumbKeyPositions,
                        thumbKeyHeight,
                        THUMB_OFFSET,
                        THUMB_ROTATION);
            }

            difference(){        
                sphere(r = CASE_CURVE_RADIUS);
                translate([-CASE_CURVE_RADIUS,-CASE_CURVE_RADIUS,-CASE_CURVE_RADIUS*2])
                    cube(2 * CASE_CURVE_RADIUS);
            }
        }

        innerBody(
            fingerKeyPositions,
            fingerKeyHeight,
            [0,0,0],
            HAND_ROTATION);            

        rotate([0,0,HAND_ROTATION.z])
            innerBody(
                thumbKeyPositions,
                thumbKeyHeight,
                THUMB_OFFSET,
                THUMB_ROTATION);
    }
}

case(
    fingerKeyPositions = FINGER_GRID,
    fingerKeyHeight = 1.0,
    thumbKeyPositions = THUMB_GRID,
    thumbKeyHeight = 1.25,
    $fn = 20);