include<M6Screw.scad>

module m6_screw_hole() {
    clearance = 0.3;
    diameter = 6;
    length = 12;
    tolerance = 0.4;

    ScrewThread(diameter + 1.4, length+0.01, tolerance=tolerance,
        tip_height=ThreadPitch(diameter), tip_min_fract=0.75);
}

module eaf_rack() {
    $fn=50;

    margin = 0.3;
    rack_wall_depth = 2;
    rack_wall_depth_bottom = 4;
    rack_width = 41 + margin;
    rack_height = 20;
    rack_depth = 50;

    eaf_screw_panel_depth = 2;
    eaf_screw_panel_hole_radius = (4+margin)/2;
    eaf_screw_panel_hole_width = 18;
    eaf_screw_panel_hole_height = 4.5;

    dovetail_hole_panel_depth = 5;
    dovetail_hole_panel_height = 15;
    
    // rack body
    linear_extrude(height=rack_depth)
    polygon(points=[
        [-rack_wall_depth-rack_width/2, -rack_wall_depth_bottom],
        [rack_wall_depth+rack_width/2, -rack_wall_depth_bottom],
        [rack_wall_depth+rack_width/2, rack_height],
        [rack_width/2, rack_height],
        [rack_width/2, 0],
        [-rack_width/2, 0],
        [-rack_width/2, rack_height],
        [-rack_wall_depth-rack_width/2, rack_height]
    ]);
    
    // panel for the EAF screws
    linear_extrude(height=eaf_screw_panel_depth)
    difference() {
        translate([-rack_width/2, 0])
        square(size=[rack_width, rack_height/2]);
        translate([-eaf_screw_panel_hole_width/2, eaf_screw_panel_hole_height])
        circle(r=eaf_screw_panel_hole_radius);
        translate([eaf_screw_panel_hole_width/2, eaf_screw_panel_hole_height])
        circle(r=eaf_screw_panel_hole_radius);
    }

    // screw holes for the dovetail
    translate([-(rack_wall_depth+rack_width/2), -rack_wall_depth_bottom, -dovetail_hole_panel_height])
    difference() {
        cube([rack_wall_depth*2+rack_width, dovetail_hole_panel_depth, dovetail_hole_panel_height]);
        translate([10, 8, dovetail_hole_panel_height/2])
        rotate([90, 0, 0])
        m6_screw_hole();
        translate([rack_wall_depth*2+rack_width-10, 8, dovetail_hole_panel_height/2])
        rotate([90, 0, 0])
        m6_screw_hole();
    }
}

// rotate([90, 0, 0])
// eaf_rack();