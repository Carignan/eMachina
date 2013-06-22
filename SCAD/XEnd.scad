//TODO  make the belt path wider
//TODO  Make the hole for X rod smaller

include<BearingMount.scad>;
include<mcad/triangles.scad>;
bearingThickness = 11;
HolderLenght = 50;
 
RodOffset = 5;
HolderRodSpacing = 45;
HolderMiddle = HolderRodSpacing /2 + RodOffset;  //Right bettween the 2 rod holes that will hold the 2 X rod

echo("***HolderMiddle h=", HolderMiddle);

difference()
{ 
	union()
	{
		 //Draw the smooth rod guide 1
		translate([0,60,0]) rotate([180,90,0]) HalfRail(0, 4);

		//Draw the X Rod holder harm
		translate([0,15,0])cube([HolderLenght,30,13]);
		//translate([HolderLenght-5,30,0]) cylinder(h=14, r=15);
		translate([HolderRodSpacing+RodOffset,30,0]) cylinder(h=14, r=12);
		translate([RodOffset,30,0]) cylinder(h=14, r=8);
		//Draw the bearing holder for the side belt - Space must be large enought for 2 604zz bearing so 11mm
		translate([HolderMiddle-6-4,0,0]) cube([4,20,13]);
		translate([HolderMiddle+6,0,0]) cube([4,20,13]);
	
		
		translate([HolderMiddle-6-4,40,0]) cube([4,20,13]);
		translate([HolderMiddle+6,40,0]) cube([4,20,13]);

		
		translate([0,45,0]) triangle(15, 15, 13);
		translate([0,15,0])rotate([0,0,270]) triangle(15, 15, 13);
	}
	
	
	//Draw the rod hold
	translate([RodOffset,30,2]) cylinder (h = 200,r=4.2);
	translate([HolderRodSpacing+RodOffset,30,2]) cylinder (h = 200,r=4.2);

	translate([15.5+3,8,7]) rotate([0,90,0]) cylinder (h = 28, r=2); 
	translate([15.5+3,53,7]) rotate([0,90,0]) cylinder (h = 28, r=2); 
	
	translate([HolderMiddle-6,8,7]) rotate ([0,90,0])  cylinder (h =12,r=13);
	translate([HolderMiddle-6,50,7]) rotate ([0,90,0])  cylinder (h =12,r=13);
	
}
 
 
