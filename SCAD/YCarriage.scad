//YCarriage.scad
include<BearingMount2.scad>;
include<mcad/triangles.scad>;
bearingThickness = 11;
HolderLenght = 50;
HolderWidth = 24;
BearingHolderWidth = 55.82; 
BearingHolderHeight = 10; 
DistanceMidPulleyToMidShaft = 42;
BearingCenterZ= 15;
BeltWidth = 11;
BeltMiddle = DistanceMidPulleyToMidShaft - BearingCenterZ;
 
RodOffset = 5;
HolderRodSpacing = 45;
HolderRodMiddle =  BearingHolderWidth / 2;
HolderMiddle = BeltMiddle;
HolderBorder = 8;

WallWidth = 4;

Rod1X = BeltMiddle - (HolderRodSpacing/2);
Rod2X = BeltMiddle + (HolderRodSpacing/2);

BeltToBearingCenterOffetSet = 16/2;


echo("***HolderMiddle h=", HolderMiddle);

difference()
{ 
	union()
	{
		 //Draw the smooth rod guide 1
		translate([0,BearingHolderWidth,10]) rotate([180,90,0]) HalfRail(4);

		//Draw the X Rod holder harm
		translate([0, (BearingHolderWidth/2) - (HolderWidth/2) ,0])cube([HolderLenght,HolderWidth,BearingHolderHeight]);

		//draw rod holes support
		translate([Rod2X,HolderRodMiddle,0]) cylinder(h=14, r=12);
		translate([Rod1X,HolderRodMiddle,0]) cylinder(h=14, r=8);
		
		//Draw the bearing holder for the side belt - Space must be large enought for 2 604zz bearing so 11mm
		translate([HolderMiddle-(BeltWidth/2)-WallWidth,0,0]) cube([WallWidth,BearingHolderWidth,13]);
		translate([HolderMiddle+BeltWidth/2,0,0]) cube([WallWidth,BearingHolderWidth,13]);
			
	}
	
	
	//Draw the rod hold
	translate([Rod1X,HolderRodMiddle,2]) cylinder (h = 200,r=4.2);
	translate([Rod2X,HolderRodMiddle,2]) cylinder (h = 200,r=4.2);

	translate([15.5+3,HolderBorder,BeltToBearingCenterOffetSet]) rotate([0,90,0]) cylinder (h = 28, r=2.2); 
	translate([15.5+3,BearingHolderWidth-HolderBorder,BeltToBearingCenterOffetSet]) rotate([0,90,0]) cylinder (h = 28, r=2.2); 
	
	translate([HolderMiddle-(BeltWidth/2),HolderBorder,BeltToBearingCenterOffetSet]) rotate ([0,90,0])  cylinder (h =BeltWidth,r=11);
	translate([HolderMiddle-(BeltWidth/2),BearingHolderWidth-HolderBorder,BeltToBearingCenterOffetSet]) rotate ([0,90,0])  cylinder (h =BeltWidth,r=11);
	
}
 
 
