include<../config.scad>;
use<../modules/plate.scad>;

mirror([1,0,0])
    plate(
        keyPositions = FINGER_GRID,
        keyHeight = 1.0,
        boltPositions = FINGER_BOLT_HOLES,
        cutSwitchHoles = true,
        $fn = 100);