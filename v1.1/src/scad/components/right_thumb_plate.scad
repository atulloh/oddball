include<../config.scad>;
use<../modules/plate.scad>;

mirror([1,0,0]){
    linear_extrude(PLATE_THICKNESS)
        plate(
            keyPositions = THUMB_TRACKBALL_GRID,
            keyHeight = 1.25,
            boltPositions = THUMB_TRACKBALL_BOLT_HOLES,
            cutSwitchHoles = true,
            $fn = 100);
    
    if(DRAW_KEYS)
        #keys(
            keyPositions = THUMB_TRACKBALL_GRID,
            keyHeight = 1.25,
            $fn = 50);
}