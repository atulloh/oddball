use <../modules/rightCase.scad>;

intersection(){
    
    rightCase($fn = 100);

    translate([-150,-38,0])
        cube([55,43,50]);
}