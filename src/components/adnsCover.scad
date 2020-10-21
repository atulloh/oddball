use<../modules/adnsCover.scad>;

// can print without supports upside down
rotate([180,0,0])
    adnsCover($fn = 100);