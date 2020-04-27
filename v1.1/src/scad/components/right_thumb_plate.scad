include<../config.scad>;
use<../modules/plate.scad>;

mirror([1,0,0])
    plate(
        keyPositions = THUMB_GRID_WITH_TRACKBALL,
        keyHeight = 1.25,
        cutSwitchHoles = true,
        cutBoltHoles = true,
        $fn = 100);