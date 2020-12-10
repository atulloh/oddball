use<../modules/pmwCover.scad>;

// can print without supports upside down
rotate([180,0,0])
    pmwCover($fn = 100);