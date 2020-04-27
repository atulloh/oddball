include<../config.scad>;
use<../modules/plate.scad>;

mirror([1,0,0])
    plate(
        keyPositions = FINGER_GRID,
        keyHeight = 1.0,
        cutSwitchHoles = true,
        cutBoltHoles = true,
        $fn = 100);