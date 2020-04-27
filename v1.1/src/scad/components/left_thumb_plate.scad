include<../config.scad>;
use<../modules/plate.scad>;

plate(
    keyPositions = THUMB_GRID,
    keyHeight = 1.25,
    cutSwitchHoles = true,
    cutBoltHoles = true,
    $fn = 100);