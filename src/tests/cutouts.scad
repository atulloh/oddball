use <../components/leftCase.scad>;

intersection(){
    leftCase($fn = 10);
    translate([33,60,0])
        cube([70,15,50]);
}