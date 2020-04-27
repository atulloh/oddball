// constants

1U = 19.05;
SWITCH_WIDTH = 14;

// hardware

NUT_DIAMETER = 4;
NUT_TOLERENCE = 0.5;

BOLT_DIAMETER = 2.4; // M2 cleanance
BOLT_TOLERENCE = 0.1;

STANDOFF_HEIGHT = 10;

// plate

PLATE_THICKNESS = 1.5;
PLATE_BEZEL = 2;
PLATE_CURVE_RADIUS = 1;

// trackball

TRACKBALL_DIAMETER = 24.9;
TRACKBALL_PLATE_CLEARANCE = 0;
TRACKBALL_LENS_CLEARANCE = 2.4; // from ADNS9800 data sheet
TRACKBALL_LENS_HEIGHT_ABOVE_BOARD = 0.5;// TODO: measure

// layouts in 1U space

FINGER_GRID = 
    [[[0,  2], [1, 2], [2, 2.25], [3, 2.37], [4, 2.25], [5, 2.12]],
     [[0,  1], [1, 1], [2, 1.25], [3, 1.37], [4, 1.25], [5, 1.12]],
     [[0,  0], [1, 0], [2, 0.25], [3, 0.37], [4, 0.25], [5, 0.12]]];

THUMB_GRID = [[[0, 0], [1, 0.1]]];

THUMB_GRID_WITH_TRACKBALL = [[[0, 0], [-0.5, -0.5, "trackball"]]];