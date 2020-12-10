include<../config.scad>;
use <../modules/rightCase.scad>;

intersection()
{
    rotate([-HAND_ROTATION.x,0,0])
        rotate([0,HAND_ROTATION.y,0])
            rotate([0,0,HAND_ROTATION.z])
                rightCase($fn = 100);
    
    translate([-120,-2,0])
        cube([124,100,50]);
}