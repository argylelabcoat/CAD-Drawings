include <threads.scad>

module tap() {
    metric_thread (diameter=5, pitch=0.8, length=17, internal=true) ;
    //cylinder(h=17, d=5);
    //english_thread(diameter=3/16, threads_per_inch=24, length=2/3, internal=true);
};

union(){
    translate([0,78,0]){
        cube([70, 10, 15],[0,0,0]);
    };
    cube([10, 78, 15],[0,0,0]);
    

    difference(){
        union(){
            rotate([90,0,0]){
                for(ri=[0:7]){
                    translate([40+20*ri,7.5,0]){
                        cylinder(h=5, d1=14, d2=9);
                    };
                };
            };

            cube([200, 10, 15],[0,0,0]);
        }
        rotate([90,0,0]){
            for(ri=[0:7]){
                translate([40+20*ri,7.5,-11]){
                    tap();
                };
            };
        };
    };
};