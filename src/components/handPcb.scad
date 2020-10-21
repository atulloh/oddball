include<../config.scad>;
use<../modules/pcb.scad>;
use<../modules/plate.scad>;

linear_extrude(PCB_THICKNESS){
    pcb(
        FINGER_GRID,
        FINGER_BOLT_HOLES,
        additions = [
            [[PRO_MICRO_SIZE.x - PLATE_CURVE_RADIUS, PRO_MICRO_SIZE.y],
            [PLATE_BEZEL + (FINGER_GRID[3].x + 0.5) * 1U + (PLATE_CURVE_RADIUS - PRO_MICRO_SIZE.x) / 2,
            PLATE_BEZEL + (FINGER_GRID[3].y + 0.5) * 1U + SWITCH_WIDTH / 2 - PRO_MICRO_SIZE.y + PCB_SWITCH_OFFSET - PLATE_CURVE_RADIUS]]
        ],
        $fn = 20);
}
    
if(DRAW_DEBUG){
    %translate([
        PLATE_BEZEL + (FINGER_GRID[3].x + 0.5) * 1U - PRO_MICRO_SIZE.x / 2,
        PLATE_BEZEL + (FINGER_GRID[3].y + 0.5) * 1U + SWITCH_WIDTH / 2 - PRO_MICRO_SIZE.y + PCB_SWITCH_OFFSET,
        -PCB_THICKNESS]){
            linear_extrude(PCB_THICKNESS)
                square(PRO_MICRO_SIZE);

            translate([
                (PRO_MICRO_SIZE.x - USB_C_SIZE.x) / 2, 
                PRO_MICRO_SIZE.y - USB_C_SIZE.y + PRO_MICRO_USB_OVERHANG,
                -USB_C_SIZE.z])
                linear_extrude(USB_C_SIZE.z)
                    square([USB_C_SIZE.x,USB_C_SIZE.y]);

        }

    %translate([0,0, PCB_PLATE_OFFSET_Z])
        plate(
            keyPositions = FINGER_GRID,
            boltPositions = FINGER_BOLT_HOLES,
            $fn = 20);
}