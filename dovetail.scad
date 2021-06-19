include<EAFRack.scad>

module vixen_dovetail(len) {
    height = 10;
    body_height = 0;
    wall_depth = 10;
    margin = 0.6;
    width1 = 43.5 - margin;
    width2 = 40.5 - margin;

    translate([0, -height, 0])
    linear_extrude(height=len)
    polygon(points=[[-width1/2, 0], [-width1/2+wall_depth, 0],
      [-width2/2+wall_depth, height-wall_depth], [width2/2-wall_depth, height-wall_depth],
      [width1/2-wall_depth, 0], [width1/2, 0], 
      [width2/2, height], [-width2/2, height]]);
}

module dovetail_without_guidescope() {
    epsilon = 0.01;

    body_width = 150-10;
    body_height = 110;
    body_left = 15;
    body_top = 90;
    
    screw_upper_depth = 4;

    eaf_margin = 0.4;
    fma_margin = 0.3;

    difference() {
        // body
        linear_extrude(height=8)
        hull() {
            circle(r=5, $fn=50);
            translate([body_width, 0])
            circle(r=5, $fn=50);
            translate([0, body_height])
            circle(r=5, $fn=50);
            translate([body_width, body_height])
            circle(r=5, $fn=50);
        }

        // EAF holes
        // upper
        hull() {
            translate([body_left, body_top, 0])
            cylinder(r=3+eaf_margin, h=20, center=true, $fn=100);
            translate([body_left+45, body_top, 0])
            cylinder(r=3+eaf_margin, h=20, center=true, $fn=100);
        }
        // lower
        hull() {
            translate([body_left, body_top, -epsilon])
            cylinder(r=5+eaf_margin, h=screw_upper_depth, $fn=100);
            translate([body_left+45, body_top, -epsilon])
            cylinder(r=5+eaf_margin, h=screw_upper_depth, $fn=100);
        }

        // FMA holes
        // left
        // upper
        hull() {
            translate([body_left+85, body_top, 0])
            cylinder(r=2+fma_margin, h=20, center=true, $fn=100);
            translate([body_left+85, 15, 0])
            cylinder(r=2+fma_margin, h=20, center=true, $fn=100);
        }
        // lower
        hull() {
            translate([body_left+85, body_top, -epsilon])
            cylinder(r=3.5+fma_margin, h=screw_upper_depth, $fn=100);
            translate([body_left+85, 15, -epsilon])
            cylinder(r=3.5+fma_margin, h=screw_upper_depth, $fn=100);
        }
        // right
        // upper
        hull() {
            translate([body_left+105, body_top, 0])
            cylinder(r=2+fma_margin, h=20, center=true, $fn=100);
            translate([body_left+105, 15, 0])
            cylinder(r=2+fma_margin, h=20, center=true, $fn=100);
        }
        // lower
        hull() {
            translate([body_left+105, body_top, -epsilon])
            cylinder(r=3.5+fma_margin, h=screw_upper_depth, $fn=100);
            translate([body_left+105, 15, -epsilon])
            cylinder(r=3.5+fma_margin, h=screw_upper_depth, $fn=100);
        }
    }

    translate([body_width/2-5, body_height-27, 0])
    rotate([90, 0, 0])
    vixen_dovetail(body_height-22);
}

module dovetail() {
    epsilon = 0.01;

    body_width = 150-10+90;
    body_height = 110;
    body_left = 20;
    body_fma_left = body_left+90;
    body_top = 90;
    
    screw_upper_depth = 4;

    eaf_margin = 0.4;
    fma_margin = 0.3;

    difference() {
        // body
        linear_extrude(height=8)
        hull() {
            circle(r=5, $fn=50);
            translate([body_width, 0])
            circle(r=5, $fn=50);
            translate([0, body_height])
            circle(r=5, $fn=50);
            translate([body_width, body_height])
            circle(r=5, $fn=50);
        }

        // EAF holes
        // upper
        hull() {
            translate([body_fma_left, body_top, 0])
            cylinder(r=3+eaf_margin, h=20, center=true, $fn=100);
            translate([body_fma_left+45, body_top, 0])
            cylinder(r=3+eaf_margin, h=20, center=true, $fn=100);
        }
        // lower
        hull() {
            translate([body_fma_left, body_top, -epsilon])
            cylinder(r=5+eaf_margin, h=screw_upper_depth, $fn=100);
            translate([body_fma_left+45, body_top, -epsilon])
            cylinder(r=5+eaf_margin, h=screw_upper_depth, $fn=100);
        }

        // FMA holes
        // left
        // upper
        hull() {
            translate([body_fma_left+85, body_top, 0])
            cylinder(r=2+fma_margin, h=20, center=true, $fn=100);
            translate([body_fma_left+85, 15, 0])
            cylinder(r=2+fma_margin, h=20, center=true, $fn=100);
        }
        // lower
        hull() {
            translate([body_fma_left+85, body_top, -epsilon])
            cylinder(r=3.5+fma_margin, h=screw_upper_depth, $fn=100);
            translate([body_fma_left+85, 15, -epsilon])
            cylinder(r=3.5+fma_margin, h=screw_upper_depth, $fn=100);
        }
        // right
        // upper
        hull() {
            translate([body_fma_left+105, body_top, 0])
            cylinder(r=2+fma_margin, h=20, center=true, $fn=100);
            translate([body_fma_left+105, 15, 0])
            cylinder(r=2+fma_margin, h=20, center=true, $fn=100);
        }
        // lower
        hull() {
            translate([body_fma_left+105, body_top, -epsilon])
            cylinder(r=3.5+fma_margin, h=screw_upper_depth, $fn=100);
            translate([body_fma_left+105, 15, -epsilon])
            cylinder(r=3.5+fma_margin, h=screw_upper_depth, $fn=100);
        }

        // Guidescope holes
        // upper
        hull() {
            translate([body_left, 70, 0])
            cylinder(r=2.5+eaf_margin, h=20, center=true, $fn=100);
            translate([body_left, 15, 0])
            cylinder(r=2.5+eaf_margin, h=20, center=true, $fn=100);
        }
        // lower
        hull() {
            translate([body_left, 70, -epsilon])
            cylinder(r=4+eaf_margin, h=screw_upper_depth, $fn=100);
            translate([body_left, 15, -epsilon])
            cylinder(r=4+eaf_margin, h=screw_upper_depth, $fn=100);
        }
    }

    translate([body_width/2+45, body_height-27, 0])
    rotate([90, 0, 0])
    vixen_dovetail(body_height-22);
}

module washer() {
    $fn=100;
    linear_extrude(height=3) {
        difference() {
            circle(r=6.5);
            circle(r=2.5);
        }
    }
}

// rotate([0, 180, 0])
// {
//     dovetail();
//     // dovetail_without_guidescope();
//     // color([0.5, 1.0, 0.5])
//     // translate([25, 87, 15])
//     // rotate([90, 0, 0])
//     // eaf_rack();
// }
for (i = [0: 3])
    translate([i*20, 0, 0])
    washer();