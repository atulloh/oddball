use<shapes.scad>

// draws a rough no-profile at keycap 0,0 1U space
module keycap(keyHeight = 1.0){
  
    width = 18;
    depth = 18 * keyHeight;
    height = 9;

    translate([19.05/2, 19.05/2, 7])
        linear_extrude(height, scale = [0.7,0.7])
          squircle([width, depth], 1, center = true);	
}