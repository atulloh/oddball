include<../config.scad>;
use <../modules/leftCase.scad>;

intersection()
{
    rotate([-HAND_ROTATION.x,0,0])
        rotate([0,-HAND_ROTATION.y,0])
            rotate([0,0,-HAND_ROTATION.z])
                leftCase($fn = 100);
    
    translate([-5,-2,0])
        cube([124,100,50]);
}