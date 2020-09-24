include<../config.scad>;
use<../modules/plate.scad>;

module pcb(
    keyPositions = [],
    boltPositions = [],
    keyHeight = 1.0,
    additions = []){

    module straightPcb(){
        offset(delta =  (SWITCH_WIDTH - 1U - PCB_CURVE_RADIUS) / 2 + PCB_SWITCH_OFFSET - PLATE_BEZEL)
            plate(
                keyPositions,
                keyHeight,
                cutHoles = false);
        
        for(addition = additions)
            translate(addition[1])
                square(addition[0]);
    }

    big = 50;
    
    difference(){
        minkowski(){
            union(){
                straightPcb();

                difference(){
                    
                    offset(delta = big)
                        straightPcb();
                    
                    minkowski(){
                        difference(){                
                            offset(delta = big)
                                straightPcb(); 

                            offset(delta = PCB_CURVE_RADIUS)
                                straightPcb();
                        }

                        circle(r = PCB_CURVE_RADIUS);
                    }

                    straightPcb();
                }
            }
            
            circle(r = PCB_CURVE_RADIUS / 2);
        }

        for(boltPosition = boltPositions)
            translate([boltPosition.x, boltPosition.y * keyHeight] * 1U + [PLATE_BEZEL, PLATE_BEZEL])
                circle(r = CASE_BOLT_HOUSING_WIDTH + BOLT_DIAMETER * 0.5 + BOLT_TOLERENCE + PCB_CASE_CLEARANCE);
    }
}

pcb(
    keyPositions = FINGER_GRID,
    boltPositions = FINGER_BOLT_HOLES,
    $fn = 20);