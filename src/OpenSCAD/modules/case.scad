include <../config.scad>;
use <./shapes.scad>;
use <./plate.scad>;
use <./pcb.scad>;
use <./keys.scad>;

function caseSection(
    keyPositions = [],
    keyHeight = 1.0,
    offset = [0,0,0],
    rotation = [0,0,0],
    boltPositions = [],
    plateHull = false,
    caseBottomThickness = 0,
    plateUndersideClearance = 0,
    feetPositions = [],
    boltLength = 0) = [
        keyPositions,
        keyHeight,
        offset,
        rotation,
        boltPositions,
        plateHull,
        caseBottomThickness,
        plateUndersideClearance,
        feetPositions,
        boltLength];

module case(sections = []){

    module caseOutline(
        keyPositions,
        keyHeight,
        offset,
        rotation,
        boltPositions,
        plateHull,
        caseBottomThickness,
        plateUndersideClearance,
        boltLength){
            
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
                                                    plate(keyPositions, keyHeight, hull = plateHull);
                                        
                                        // top plate plane
                                        translate([0,0, plateUndersideClearance + caseBottomThickness])
                                            linear_extrude(0.001)
                                                hull()
                                                    offset(delta = CASE_PLATE_BEZEL)
                                                        plate(keyPositions, keyHeight, hull = plateHull);
                                    }
                    
                    // big cube to cut off top of extrusion
                    translate([0,0, offset.z])
                        rotate([0,rotation.y,0])
                            rotate([rotation.x,0,0])
                                translate([
                                    -big * 0.5,
                                    -big * 0.5,
                                    plateUndersideClearance + caseBottomThickness - CASE_CURVE_RADIUS + PLATE_THICKNESS])
                                    cube([big,big,big]);
                }
                

                if(DRAW_DEBUG)       
                    %translate([0,0, offset.z])
                        rotate([0,rotation.y,0])
                            rotate([rotation.x,0,0])
                                translate([0, 0, plateUndersideClearance + caseBottomThickness]){
                                    keys(keyPositions,keyHeight, $fn = 20);
                                    linear_extrude(PLATE_THICKNESS)
                                        plate(keyPositions, keyHeight, boltPositions, hull = plateHull, $fn = 20);

                                    translate([0,0, -PCB_PLATE_OFFSET_Z - PCB_THICKNESS])
                                        linear_extrude(PCB_THICKNESS)
                                            pcb(
                                                keyPositions = keyPositions,
                                                boltPositions = boltPositions,
                                                keyHeight = keyHeight);
                                }
            }
    }

    module innerBody(
        keyPositions,
        keyHeight,
        offset,
        rotation,
        boltPositions,
        plateHull,
        caseBottomThickness,
        plateUndersideClearance,
        boltLength){

        big = 10;

        module nutAndBoltChannels(){

            boltOffset =
                caseBottomThickness +
                plateUndersideClearance +
                PLATE_THICKNESS -
                boltLength;

            for(boltPosition = boltPositions)
                translate([boltPosition.x, boltPosition.y * keyHeight, 0] * 1U + [PLATE_BEZEL, PLATE_BEZEL, boltOffset]){
                    cylinder(h = boltOffset, r = BOLT_DIAMETER * 0.5 + BOLT_TOLERENCE);
                    translate([0,0,-50])
                        cylinder(h = 50, r = NUT_DIAMETER * 0.5 + NUT_TOLERENCE, $fn = 6);
                }
        }
        
        translate([offset.x, offset.y, 0])
            rotate([0,0, rotation.z])
                translate([0,0, offset.z])
                    rotate([0, rotation.y, 0])
                        rotate([rotation.x,0,0]){                           
                            
                            
                            difference(){
                                union(){
                                    // plate cutout
                                    translate([0,0, plateUndersideClearance + caseBottomThickness])
                                        linear_extrude(big)
                                            offset(delta = CASE_PLATE_TOLERENCE)
                                                plate(
                                                    keyPositions,
                                                    keyHeight,
                                                    cutHoles = false,
                                                    hull = plateHull);
                                    
                                    // cutout under plate
                                    translate([0,0, caseBottomThickness])
                                        linear_extrude(plateUndersideClearance){

                                            offset(delta = -CASE_PLATE_MOUNT_COVERAGE)
                                                plate(
                                                    keyPositions,
                                                    keyHeight,
                                                    cutHoles = false,
                                                    hull = plateHull);
                                            
                                            // extra cutout for PMW
                                            for(keyPosition = keyPositions){
                                                if(keyPosition.z == "pmw")
                                                    translate([keyPosition.x + 0.5, (keyPosition.y + 0.5) * keyHeight] * 1U + [PLATE_BEZEL, PLATE_BEZEL])
                                                        offset(delta = CASE_PLATE_TOLERENCE)
                                                            square([PMW_PCB_WIDTH, PMW_PCB_HEIGHT], center = true);
                                            }
                                        }

                                    nutAndBoltChannels();
                                }
                                
                                difference(){
                                    union(){
                                        for(boltPosition = boltPositions)
                                            translate([boltPosition.x, boltPosition.y * keyHeight, 0] * 1U + [PLATE_BEZEL, PLATE_BEZEL, caseBottomThickness]){
                                                
                                                difference(){
                                                    union(){
                                                        housingRadius = CASE_BOLT_HOUSING_WIDTH + BOLT_DIAMETER * 0.5 + BOLT_TOLERENCE;
                                                        cylinder(h = plateUndersideClearance - 6.5, r1 = housingRadius * 1.5, r2 = housingRadius);
                                                        cylinder(h = plateUndersideClearance, r = CASE_BOLT_HOUSING_WIDTH + BOLT_DIAMETER * 0.5 + BOLT_TOLERENCE);
                                                    }
                                                    cylinder(h = plateUndersideClearance, r = BOLT_DIAMETER * 0.5 + BOLT_TOLERENCE);
                                                }
                                            }
                                    }
                                    
                                    nutAndBoltChannels();
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
                        section[4],
                        section[5],
                        section[6],
                        section[7],
                        section[7]);
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
                section[4],
                section[5],
                section[6],
                section[7],
                section[7]);

        // custom cable cutouts; not really parameterised at the moment
        rotate([0,0, HAND_ROTATION.z]){
            rotate([0, HAND_ROTATION.y, 0])
                rotate([HAND_ROTATION.x,0,0])
                    translate([0,0, CASE_BOTTOM_THICKNESS]){
                        
                        // thumb cluster channel
                        translate([89,8,0])
                            rotate([90,0,0])
                                linear_extrude(10)
                                    squircle([14,6], radius = 1);
                                    
                        // usb cable
                        usbClearance = 1;
                        usbInnerHoleSize = [USB_C_SIZE.x, USB_C_SIZE.z, 0] + [usbClearance, usbClearance, 0];
                        usbOuterHoleSize = usbInnerHoleSize + [3,3,0];
                        translate([PLATE_BEZEL + 3.5 * 1U, 75, 4])
                            rotate([90,0,0]){

                                // outer hole
                                translate([0,0,-1.5] - usbOuterHoleSize * 0.5)
                                    linear_extrude(10)
                                        squircle(usbOuterHoleSize, radius = 0.5);

                                // inner hole
                                translate([0,0,8]-usbInnerHoleSize * 0.5)
                                    linear_extrude(10)
                                        squircle(usbInnerHoleSize, radius = 0.5);
                            }
                        
                        // trrs
                        trrsInnerHoleSize = 2.75;
                        trrsOuterHoleSize = 5.5;
                        translate([PLATE_BEZEL + 5.3 * 1U, 70, 3])
                            rotate([90,0,0]){

                                // outer hole
                                translate([0,0,-1.5])
                                    linear_extrude(10)
                                        circle(r = trrsOuterHoleSize);

                                // inner hole
                                translate([0,0,0])
                                    linear_extrude(10)
                                        circle(r = trrsInnerHoleSize);
                            }
                        
                        // reset button
                        resetHoleSize = 1.0;
                        translate([PLATE_BEZEL + 1.9 * 1U, 68, 4])
                            rotate([90,0,0]){
                                translate([0,0,0])
                                    linear_extrude(10)
                                        circle(r = resetHoleSize);
                            }
                    }
                    

            // feet cutouts
            linear_extrude(FEET_HEIGHT)
                for(foot = sections[0][8]) // TODO: code smell just pulling first feet set
                    translate(foot * 1U)
                        circle(d = FEET_DIAMETER + FEET_TOLERENCE);
        }
    }
}

case([
    caseSection(
        keyPositions = FINGER_GRID,
        keyHeight = 1.0,
        rotation = HAND_ROTATION,
        boltPositions = FINGER_BOLT_HOLES,
        plateHull = false,
        caseBottomThickness = CASE_BOTTOM_THICKNESS,
        plateUndersideClearance =
            PCB_PLATE_OFFSET_Z + 
            PCB_UNDERSIDE_CLEARANCE + 
            PCB_THICKNESS,
        feetPositions = FEET_POSITIONS,
        boltLength = BOLT_LENGTH),
    caseSection(
        keyPositions = THUMB_GRID,
        keyHeight = 1.25,
        offset = THUMB_OFFSET,
        rotation = THUMB_ROTATION,
        boltPositions = THUMB_BOLT_HOLES,
        plateHull = false,
        caseBottomThickness = CASE_BOTTOM_THICKNESS,
        plateUndersideClearance =
            PCB_PLATE_OFFSET_Z + 
            PCB_UNDERSIDE_CLEARANCE + 
            PCB_THICKNESS,,
        boltLength = BOLT_LENGTH)],
    $fn = 20);