include <../config.scad>;
use <../modules/case.scad>;

mirror([1,0,0])
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
            boltLength = BOLT_LENGTH),
        caseSection(
            keyPositions = THUMB_TRACKBALL_GRID,
            keyHeight = 1.25,
            offset = THUMB_OFFSET,
            rotation = THUMB_ROTATION,
            boltPositions = THUMB_TRACKBALL_BOLT_HOLES,
            plateHull = true,
            caseBottomThickness = 
                CASE_BOTTOM_THICKNESS +
                PCB_PLATE_OFFSET_Z + 
                PCB_UNDERSIDE_CLEARANCE + 
                PCB_THICKNESS - (SENSOR_PCB_MOUNT_OFFSET + 9),
            plateUndersideClearance = SENSOR_PCB_MOUNT_OFFSET + 9,
            boltLength = THUMB_BOLT_LENGTH)],
        usbCutoutPosition = [PLATE_BEZEL + 3.5 * 1U, 66, 4.5],
        trrsCutoutPosition = [PLATE_BEZEL + 5 * 1U + 1.5, 60, 5.5],
        feetPositions = FEET_POSITIONS,
        $fn = 100);