include <../config.scad>;
use <../modules/case.scad>;

module leftCase(){
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
                PCB_THICKNESS,
            boltLength = BOLT_LENGTH)]);
}

leftCase($fn = 100);