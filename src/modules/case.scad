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
    boltLength = 0,
    flangeStandoffs = false) = [
        keyPositions,
        keyHeight,
        offset,
        rotation,
        boltPositions,
        plateHull,
        caseBottomThickness,
        plateUndersideClearance,
        boltLength,
        flangeStandoffs];

module case(
    sections = [],
    usbCutoutPosition,
    trrsCutoutPosition,
    feetPositions = []){

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
                    translate([0,0, offset.z + CASE_HEIGHT_ABOVE_PLATE])
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
        boltLength,
        flangeStandoffs){

        big = 100;

        module nutAndBoltChannels(){

            boltOffset =
                caseBottomThickness +
                plateUndersideClearance +
                PLATE_THICKNESS -
                boltLength;

            for(boltPosition = boltPositions)
                translate([boltPosition.x, boltPosition.y * keyHeight, 0] * 1U + [PLATE_BEZEL, PLATE_BEZEL, boltOffset]){
                    cylinder(h = boltLength, r = BOLT_DIAMETER * 0.5 + BOLT_TOLERENCE);
                    translate([0,0,-big])
                        cylinder(h = big + NUT_HEIGHT, r = NUT_DIAMETER * 0.5 + NUT_TOLERENCE, $fn = 6);
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

                                                        if(flangeStandoffs){
                                                            flangeHeight = plateUndersideClearance - PCB_PLATE_OFFSET_Z - 2;
                                                            flangeOffset = 5;
                                                            translate([0, flangeOffset / 2, flangeHeight / 2])
                                                                linear_extrude(
                                                                    height = plateUndersideClearance - PCB_PLATE_OFFSET_Z - 2,
                                                                    scale = 0.5,
                                                                    center = true)
                                                                    translate([0,-flangeOffset,0])
                                                                        circle(r = housingRadius * 2);
                                                        }
                                                        else 
                                                            cylinder(h = plateUndersideClearance - PCB_PLATE_OFFSET_Z - 2, r1 = housingRadius * 1.5, r2 = housingRadius);

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
                        section[8]);
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
                section[8],
                section[9]);

        // custom cable cutouts; not really parameterised at the moment
        rotate([0,0, HAND_ROTATION.z]){
            rotate([0, HAND_ROTATION.y, 0])
                rotate([HAND_ROTATION.x,0,0])
                    translate([0,0, CASE_BOTTOM_THICKNESS]){
                        
                        cutoutMuch = 10;

                        // thumb cluster channel
                        translate([87.5,9.2,0])
                            rotate([90,0,0])
                                linear_extrude(cutoutMuch)
                                    squircle([14,6], radius = 1);

                        // extra for IC
                        translate([usbCutoutPosition.x, usbCutoutPosition.y - 3.3, 0])
                            linear_extrude(sections[0][7])
                                square([1U + PLATE_BEZEL * 2 + 0.5, 5], center = true);
                        
                                    
                        // usb cable
                        usbInnerHoleSize = [USB_C_SIZE.x, USB_C_SIZE.z, 0] + [USB_C_CUTOUT_TOLERENCE, USB_C_CUTOUT_TOLERENCE, 0];
                        usbOuterHoleSize = usbInnerHoleSize + [USB_C_CUTOUT_OUTER_DELTA, USB_C_CUTOUT_OUTER_DELTA, 0];

                        translate(usbCutoutPosition)
                            rotate([90,0,0]){

                                // outer hole
                                translate([0,0,-cutoutMuch])
                                    linear_extrude(cutoutMuch)
                                        offset(delta = USB_C_CUTOUT_OUTER_DELTA)
                                            squircle(usbInnerHoleSize, radius = 2, center = true);

                                // inner hole
                                linear_extrude(cutoutMuch)
                                    squircle(usbInnerHoleSize, radius = 2, center = true);
                            }
                            
                        // trrs
                        trrsOuterHoleSize = 5.5;
                        translate(trrsCutoutPosition)
                            rotate([90,0,0]){

                                // outer hole
                                translate([0,0,-cutoutMuch])
                                    linear_extrude(cutoutMuch)
                                        circle(d = TRRS_CUTOUT_SIZE + TRRS_CUTOUT_OUTER_DELTA);

                                // inner hole
                                linear_extrude(cutoutMuch)
                                    circle(d = TRRS_CUTOUT_SIZE);
                            }
                        
                        // reset button
                        resetHoleSize = 1.0;
                        translate([PLATE_BEZEL + 39.1, 68, 5.5])
                            rotate([90,0,0]){
                                translate([0,0,0])
                                    linear_extrude(10)
                                        circle(r = resetHoleSize);
                            }
                    }
                    

            // feet cutouts
            linear_extrude(FEET_HEIGHT)
                for(foot = feetPositions)
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
        boltLength = BOLT_LENGTH,
        flangeStandoffs = true),
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
            PCB_THICKNESS,
        boltLength = BOLT_LENGTH)],
    usbCutoutPosition = [
        PLATE_BEZEL + 3.5 * 1U, 
        66, 
        PCB_UNDERSIDE_CLEARANCE - max(MCU_PCB_OFFSET, USB_C_SIZE.z) + USB_C_SIZE.z / 2],
    trrsCutoutPosition = [
        PLATE_BEZEL + 5 * 1U + 0.5, 
        60, 
        PCB_UNDERSIDE_CLEARANCE - 3.5 / 2 - 0.5],
    feetPositions = FEET_POSITIONS,
    $fn = 20);