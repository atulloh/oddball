use <shapes.scad>;

// draws a rough Cherry MX style switch at 0,0 1U space
module switch(){
    
    ringWidth = 15.6;
    ringHeight = 1.0;

    bottomTopWidth = 14.0;
    bottomBottomWidth = 12.0;
    bottomHeight = 5.0;

    topBottomWidth = 14.5;
    topTopWidth = 10;
    topHeight = 11.6 - bottomHeight - ringHeight;

    module switch_stem(){

        width = 3.6;
        height = 3.6;
        depth = 1.2;
        edgeRadius = 0.2;

		color("FireBrick",1)
            translate([0,0, ringHeight + topHeight])
                linear_extrude(height = height){
                    squircle([width, depth], edgeRadius, true);
                    rotate([0,0,90])
                        squircle([width, depth], edgeRadius, true);
                }
    }

    module switch_top(){
		color("WhiteSmoke",1)
            translate([0,0,ringHeight])
                linear_extrude(topHeight, scale = topTopWidth / topBottomWidth)
                    translate([-topBottomWidth/2,-topBottomWidth/2,0])
                        squircle([topBottomWidth,topBottomWidth], 1.0);
    }
                    
    module switch_middle(){
		color("WhiteSmoke",1)
            linear_extrude(ringHeight)
                squircle([ringWidth, ringWidth], 1.0, center = true);
    }

    module switch_bottom(){
		color("WhiteSmoke",1)
            translate([0,0,-bottomHeight])
                linear_extrude(bottomHeight, scale = bottomTopWidth / bottomBottomWidth)
                    translate([-bottomBottomWidth/2,-bottomBottomWidth/2,0])
                        squircle([bottomBottomWidth,bottomBottomWidth], 1.0);
    }

    translate([19.05/2,19.05/2,0]){
        switch_stem();
        switch_top();
        switch_middle();
        switch_bottom();
    }
}

switch();