include <BOSL/constants.scad>
use <BOSL/shapes.scad>

module brace(l=160, w=15, h=5, slot_width=0, rail = 20, rail_hole_d=4.2){
    difference() {
        /// Compute Parameters:
        hole_d = rail_hole_d;
        
        slot_height = h + 1;
        
        if( 0 == slot_width ){
            slot_width = hole_d;
        }
        slot_radius = slot_width/2;
        
        slot1_start = rail + hole_d;
        slot_length = (l / 2) - slot1_start - 2*hole_d;
        slot1_end = slot1_start + slot_length;
        
        s1p1 = [ slot1_start, w/2, h/2 ];
        s1p2 = [ slot1_end, w/2, h/2 ];
        s2p1 = [ l - slot1_end, w/2, h/2 ];
        s2p2 = [ l - slot1_start, w/2, h/2 ];
        
        /// Shapes:
        cuboid([l,w,h],p1=[0,0,0], fillet=w/4, edges=EDGES_Z_ALL);
        
        slot(s1p1, s1p2, r=slot_radius, h=slot_height);
        slot(s2p1, s2p2, r=slot_radius, h=slot_height);
        translate([rail/2, w/2, h/2]){
            cylinder(h=slot_height, d=hole_d, center=true );
        };
        
        translate([l - rail/2, w/2, h/2]){
            cylinder(h=slot_height, d=hole_d, center=true );
        };
    };
};

brace(160,20,8,slot_width=3.2);