include <../config.scad>;
use <../modules/plate.scad>;
use <../modules/keys.scad>;

mirror([1,0,0]){
    linear_extrude(PLATE_THICKNESS)
        plate(
            keyPositions = THUMB_TRACKBALL_GRID,
            keyHeight = 1.25,
            boltPositions = THUMB_TRACKBALL_BOLT_HOLES,
            cutHoles = true,
            hull = true,
            $fn = 100);
    
    if(DRAW_DEBUG)
        %keys(
            keyPositions = THUMB_TRACKBALL_GRID,
            keyHeight = 1.25,
            $fn = 20);
}
