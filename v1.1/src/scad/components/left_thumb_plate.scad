include<../config.scad>;
use<../modules/plate.scad>;

linear_extrude(PLATE_THICKNESS)
    plate(
        keyPositions = THUMB_GRID,
        keyHeight = 1.25,
        boltPositions = THUMB_BOLT_HOLES,
        cutSwitchHoles = true,
        $fn = 100);
    
if(DRAW_KEYS)
    #keys(
        keyPositions = THUMB_GRID,
        keyHeight = 1.25,
        $fn = 50);