//Carriage.scad
include<BearingMount2.scad>;

HolderRodSpacing = 45;
BearingHolderLenght = 55.82; 
BearingHolderHeight = 30;
BearingHolderWidth = 10; 

MountingHoldSpacing = 30;  //Same as Prusa Mendel I3 mounting holes

TotalHeight = BearingHolderHeight*2 + (HolderRodSpacing-BearingHolderHeight);

translate([0,0,10]) rotate([0,180,0])
difference()
{
	union()
	{
		translate([0,0,10]) rotate([0,90,0]) HalfRail(4);
		translate([HolderRodSpacing,0,10]) rotate([0,90,0]) HalfRail(4);
		translate([BearingHolderHeight-1,0,0]) cube([HolderRodSpacing-BearingHolderHeight+2,BearingHolderLenght,BearingHolderWidth]);
	}

	translate([TotalHeight/2,BearingHolderLenght/2 - MountingHoldSpacing/2 ,4])cylinder(r=1.7, h=20, $fn=32);
	translate([TotalHeight/2,BearingHolderLenght/2 - MountingHoldSpacing/2,-1])cylinder(r=3.3, h=5, $fn=6); 

	translate([TotalHeight/2,(BearingHolderLenght/2) + (MountingHoldSpacing/2),4])cylinder(r=1.7, h=20, $fn=32);
	translate([TotalHeight/2,(BearingHolderLenght/2) + (MountingHoldSpacing/2),-1])cylinder(r=3.3, h=5, $fn=6);

}

