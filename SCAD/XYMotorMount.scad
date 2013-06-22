//XYMotorMount.scad
include<mcad/triangles.scad>;

$fn=100;
WallTickness = 4;

//the pully middle start at 19mm
//the distance from the middle of the pully and the middle of the shat must be 42mm

//Rod Mount
MidPulleyHeight = 19;
DistanceMidPulleyToMidShaft = 42;
MidShaftHeight = MidPulleyHeight + DistanceMidPulleyToMidShaft;
TotalHeight = MidPulleyHeight + DistanceMidPulleyToMidShaft + WallTickness+6;

difference () 
{
	union()
	{
		cube([42,TotalHeight,WallTickness]);
		translate([42/2,MidShaftHeight,0]) cylinder (h = 15,r=10 ); 
		rotate([0,270,0]) triangle(TotalHeight, 46, 4);
		translate([-WallTickness,0,0]) cube([WallTickness,TotalHeight,WallTickness]);
		translate([-WallTickness,0,0]) cube([WallTickness,WallTickness,42+WallTickness]);
		
		translate([42+WallTickness,0,0]) rotate([0,270,0]) triangle(TotalHeight, 46, 4);
		translate([42,0,0]) cube([WallTickness,TotalHeight,WallTickness]);
		translate([42,0,0]) cube([WallTickness,WallTickness,42+WallTickness]);
	}

	translate([42/2,MidShaftHeight,2]) cylinder (h = 15,r=4.2 ); 
	
	translate([7, WallTickness+7,-1]) cylinder (h = WallTickness+2,r=2 ); 
	translate([7, TotalHeight-16,-1]) cylinder (h = WallTickness+2,r=2 ); 
	translate([42-7, WallTickness+7,-1]) cylinder (h = WallTickness+2,r=2 ); 
	translate([42-7, TotalHeight-16,-1]) cylinder (h = WallTickness+2,r=2 ); 
}


//Motor mount
difference () 
{
	cube([42,WallTickness,42+WallTickness]);
	translate([0,0,WallTickness]) union()
	{
		translate([42/2,-1,42/2]) rotate([270,0,0]) cylinder (h = WallTickness + 2 , r=22.7/2);
		translate([21-15.5,-1,21-15.5]) rotate([270,0,0]) cylinder (h = WallTickness + 2 , r=1.75);
		translate([21+15.5,-1,21-15.5]) rotate([270,0,0]) cylinder (h = WallTickness + 2 , r=1.75);
		translate([21-15.5,-1,21+15.5]) rotate([270,0,0]) cylinder (h = WallTickness + 2 , r=1.75);
		translate([21+15.5,-1,21+15.5]) rotate([270,0,0]) cylinder (h = WallTickness + 2 , r=1.75);
	}
	
}	
