include <../config.scad>;
use <./plate.scad>;
use <./keys.scad>;

function caseSection(
    keyPositions = [],
    keyHeight = 1.0,
    offset = [0,0,0],
    rotation = [0,0,0],
    boltPositions = []) = [
        keyPositions,
        keyHeight,
        offset,
        rotation,
        boltPositions];

module case(sections = []){
        
    plateUndersideClearance = 
        PCB_PLATE_OFFSET_Z + 
        PCB_UNDERSIDE_CLEARANCE + 
        PCB_THICKNESS;

    module caseOutline(
        keyPositions,
        keyHeight,
        offset,
        rotation,
        boltPositions){
            
        big = 500;
        
        translate([offset.x, offset.y, 0])
            rotate([0,0, rotation.z]){
                difference(){
                    linear_extrude(big)
                        projection()
                            translate([0,0, offset.z])
                                rotate([0, rotation.y, 0])
                                    rotate([rotation.x,0,0]){

                                        // bottom of cutout plate
                                        linear_extrude(0.001)
                                            hull()
                                                offset(delta = CASE_PLATE_BEZEL)
                                                    plate(keyPositions, keyHeight);
                                        
                                        // top plate plane
                                        translate([0,0, plateUndersideClearance])
                                            linear_extrude(0.001)
                                                hull()
                                                    offset(delta = CASE_PLATE_BEZEL)
                                                        plate(keyPositions, keyHeight);
                                    }
                    
                    // big cube to cut off top of extrusion
                    translate([0,0, offset.z])
                        rotate([0,rotation.y,0])
                            rotate([rotation.x,0,0])
                                translate([
                                    -big * 0.5,
                                    -big * 0.5,
                                    plateUndersideClearance - CASE_CURVE_RADIUS + PLATE_THICKNESS])
                                    cube([big,big,big]);
                }
                

                if(DRAW_DEBUG)       
                    %translate([0,0, offset.z])
                        rotate([0,rotation.y,0])
                            rotate([rotation.x,0,0])
                                    translate([0, 0, plateUndersideClearance]){
                                            keys(keyPositions,keyHeight);
                                            linear_extrude(PLATE_THICKNESS)
                                                plate(keyPositions, keyHeight, boltPositions);
                                        }
            }
    }

    module innerBody(
        keyPositions,
        keyHeight,
        offset,
        rotation,
        boltPositions = []){

        big = 10;
        
        translate([offset.x, offset.y, 0])
            rotate([0,0, rotation.z])
                translate([0,0, offset.z])
                    rotate([0, rotation.y, 0])
                        rotate([rotation.x,0,0]){
                            
                            difference(){
                                union(){
                                    // plate cutout
                                    translate([0,0, plateUndersideClearance])
                                        linear_extrude(big)
                                            offset(delta = CASE_PLATE_TOLERENCE)
                                                plate(
                                                    keyPositions,
                                                    keyHeight,
                                                    cutSwitchHoles = false);
                                    
                                    // cutout under plate
                                    translate([0,0, 0])
                                        linear_extrude(plateUndersideClearance)
                                            offset(delta = -CASE_PLATE_MOUNT_COVERAGE)
                                                plate(
                                                    keyPositions,
                                                    keyHeight,
                                                    cutSwitchHoles = false);

                                    // nut holes
                                    for(boltPosition = boltPositions)
                                        translate([boltPosition.x, boltPosition.y * keyHeight] * 1U)
                                            translate([0,0,-50])
                                                cylinder(h = 50, r = NUT_DIAMETER * 0.5 + NUT_TOLERENCE, $fn = 6);
                                }
                                
                                for(boltPosition = boltPositions)
                                    translate([boltPosition.x, boltPosition.y * keyHeight] * 1U + [PLATE_BEZEL, PLATE_BEZEL]){
                                        
                                        difference(){
                                            union(){
                                                housingRadius = CASE_BOLT_HOUSING_WIDTH + BOLT_DIAMETER * 0.5 + BOLT_TOLERENCE;
                                                cylinder(h = 3, r1 = housingRadius * 1.5, r2 = housingRadius);
                                                cylinder(h = plateUndersideClearance, r = CASE_BOLT_HOUSING_WIDTH + BOLT_DIAMETER * 0.5 + BOLT_TOLERENCE);
                                            }
                                            cylinder(h = plateUndersideClearance, r = BOLT_DIAMETER * 0.5 + BOLT_TOLERENCE);
                                        }
                                    }
                            }
                        }
    }

    difference(){
        minkowski(){
            hull(){
                for(section = sections)
                    caseOutline(
                        section[0],
                        section[1],
                        section[2],
                        section[3],
                        section[4]);
            }

            difference(){        
                sphere(r = CASE_CURVE_RADIUS);
                translate([-CASE_CURVE_RADIUS,-CASE_CURVE_RADIUS,-CASE_CURVE_RADIUS*2])
                    cube(2 * CASE_CURVE_RADIUS);
            }
        }

        for(section = sections)
            innerBody(
                section[0],
                section[1],
                section[2],
                section[3],
                section[4]);
    }
}

case([
    caseSection(
        keyPositions = FINGER_GRID,
        keyHeight = 1.0,
        rotation = HAND_ROTATION,
        boltPositions = FINGER_BOLT_HOLES),
    caseSection(
        keyPositions = THUMB_GRID,
        keyHeight = 1.25,
        offset = THUMB_OFFSET,
        rotation = THUMB_ROTATION,
        boltPositions = THUMB_BOLT_HOLES)],
    $fn = 20);