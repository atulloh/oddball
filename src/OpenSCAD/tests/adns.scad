use <../components/rightCase.scad>;

intersection(){
    rightCase($fn = 10);
    translate([-150,-38,0])
        cube([55,43,50]);
}