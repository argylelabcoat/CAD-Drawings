include <threads.scad>

module tap() {
    //metric_thread (diameter=5, pitch=0.8, length=17, internal=true) ;
    //cylinder(h=17, d=5);
    english_thread(diameter=3/16, threads_per_inch=24, length=2/3, internal=true);
};

difference(){
    cube([15,10,15],[0,0,0]);
    rotate([90,0,0]){
        translate([7.5,7.5,-11]){
            tap();
        }
    }
}