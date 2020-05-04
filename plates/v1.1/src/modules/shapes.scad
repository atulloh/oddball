// draws a square with rounded corners
module squircle(
    size = [1,1],
    radius = 1,
    center = false){
    
    x = size[0];
    y = size[1];
    radius = min(x/2,min(y/2, radius));
    translation = [0,0];
        
    module corner(){
            intersection(){
                square([radius,radius]);
                translate([radius, radius])
                    circle(radius);
            }
    }
    
    module body(){
    
        corner();
        
        translate([0, y])        
            rotate([0,0,-90])
                corner();
        
        translate([x, y])        
            rotate([0,0,180])
                corner();
        
        translate([x, 0])        
            rotate([0,0, 90])
                corner();
        
        translate([radius, 0])
            square([x - 2 * radius, radius]);
        
        translate([0, radius])
            square([x, y - radius * 2]);
            
        translate([radius, y - radius])
            square([x - 2 * radius, radius]);
    }
    
    if(center)
        translate([-x/2, -y/2])
            body();
    else
        body();
}