use <../modules/rightCase.scad>;

intersection(){;
    
    rightCase($fn = 100);
    
    translate([-100,60,0])
        cube([70,15,50]);
}