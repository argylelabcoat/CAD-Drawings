include <threads.scad>

module tap() {
    render(convexity = 2){
        english_thread (diameter=5/16, threads_per_inch=18, length=1, internal=true);
    };
};

union(){
    translate([0,78,0]){
        cube([70, 10, 30],[0,0,0]);
    };
    cube([10, 78, 30],[0,0,0]);

    difference(){
        cube([200, 10, 30],[0,0,0]);
        rotate([90,0,0]){
            for(ri=[0:7]){
                translate([40+20*ri,15,-20]){
                    tap();
                };
            };
        };
    };
};