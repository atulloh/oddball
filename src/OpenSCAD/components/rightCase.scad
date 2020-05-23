include <../config.scad>;
use <../modules/case.scad>;

case([
    caseSection(
        keyPositions = FINGER_GRID,
        keyHeight = 1.0,
        rotation = HAND_ROTATION,
        boltPositions = FINGER_BOLT_HOLES,
        plateHull = false),
    caseSection(
        keyPositions = THUMB_TRACKBALL_GRID,
        keyHeight = 1.25,
        offset = THUMB_OFFSET,
        rotation = THUMB_ROTATION,
        boltPositions = THUMB_TRACKBALL_BOLT_HOLES,
        plateHull = true)],
    $fn = 100);