// draw flags

DRAW_DEBUG = true;

// MX constants

1U = 19.05;
SWITCH_WIDTH = 14;

// hardware

NUT_DIAMETER = 4;
NUT_TOLERENCE = 0.5;
BOLT_DIAMETER = 2.4; // M2 cleanance
BOLT_TOLERENCE = 0.1;
BOLT_TOP_DIAMETER = 3.8; // TODO: measure
STANDOFF_HEIGHT = 10;
BEARING_DIAMETER = 3.175;

// plate

PLATE_THICKNESS = 1.5;
PLATE_BEZEL = 1;
PLATE_CURVE_RADIUS = 1;

// trackball

TRACKBALL_DIAMETER = 24.9;
TRACKBALL_PLATE_CLEARANCE = 1.5;
TRACKBALL_LENS_CLEARANCE = 2.4; // from ADNS9800 data sheet
TRACKBALL_LENS_HEIGHT_ABOVE_BOARD = 1.5;// TODO: measure
TRACKBALL_PCB_MOUNT_OFFSET = 13.5;
TRACKBALL_PCB_DIAMETER = 32;
TRACKBALL_PCB_THICKNESS = 1.5;

// bearing mount

BEARING_OFFSET_Z = 2.5;
BEARING_MOUNT_TOP_CURVE_RADIUS = 0.5;
BEARING_MOUNT_TOP_X_MIN = 2.5;
BEARING_MOUNT_TOP_X_MAX = 4.0;
BEARING_MOUNT_HEIGHT = 4.5;
BEARING_BOLT_CLEARANCE_Z = 1;

// PCB

PCB_PLATE_OFFSET_Z = 5;
PCB_THICKNESS = 1.5;
PCB_UNDERSIDE_CLEARANCE = 3;

// case

CASE_PLATE_BEZEL = 1;
CASE_PLATE_TOLERENCE = 0.25;
CASE_CURVE_RADIUS = 1;
CASE_PLATE_MOUNT_COVERAGE = 1;
CASE_BOLT_HOUSING_WIDTH = 1.5;

// layouts in 1U space

FINGER_GRID = 
    [[0, 2], [1, 2], [2, 2.25], [3, 2.37], [4, 2.25], [5, 2.12],
     [0, 1], [1, 1], [2, 1.25], [3, 1.37], [4, 1.25], [5, 1.12],
     [0, 0], [1, 0], [2, 0.25], [3, 0.37], [4, 0.25], [5, 0.12]];

FINGER_BOLT_HOLES =
    [[1, 2], [5, 2.185],
     [1, 1], [5, 1.185]];

THUMB_GRID = [[0, 0], [1, 0.1]];

THUMB_BOLT_HOLES = 
    [[1, 1],
     [1, 0.0925]];

THUMB_TRACKBALL_GRID = [[0, 0], [1.36, 0, "trackball"]];

THUMB_TRACKBALL_BOLT_HOLES = 
    [[1, 0.9075],
     [1, 0.0925]];

// plane rotations

HAND_ROTATION = [0, -12, 0];
THUMB_ROTATION = [10, -2, -10.25];
THUMB_OFFSET = [80.5, -22, 13.5];