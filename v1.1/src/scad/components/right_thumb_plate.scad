include<../config.scad>;
use<../modules/plate.scad>;

mirror([1,0,0]){
    linear_extrude(PLATE_THICKNESS)
        plate(
            keyPositions = THUMB_GRID_WITH_TRACKBALL,
            keyHeight = 1.25,
            cutSwitchHoles = true,
            cutBoltHoles = true,
            $fn = 100);
    
    if(DRAW_KEYS)
        #keys(
            keyPositions = THUMB_GRID_WITH_TRACKBALL,
            keyHeight = 1.25,
            $fn = 50);
}