use <../modules/leftCase.scad>;

intersection(){
    
    leftCase($fn = 100);
    
    translate([33,60,0])
        cube([70,15,50]);
}