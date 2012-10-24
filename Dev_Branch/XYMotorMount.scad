//X and Y Motor Mount


//Nema17
N17ScrewHoleSizeR = 1.8;
N17ScrewHoleDistance = 31;
N17Width =43.5;
N17CenterHoleR = 22.5/2;
RodHole=8.7/2;

difference()
{
	cube([N17Width, N17Width, 3], center=true);
	cylinder(h=4,r=N17CenterHoleR, center=true);
	translate([N17ScrewHoleDistance/2,N17ScrewHoleDistance/2,-2], center=true) cylinder(h=4,r=N17ScrewHoleSizeR);
	translate([-N17ScrewHoleDistance/2,N17ScrewHoleDistance/2,-2], center=true) cylinder(h=4,r=N17ScrewHoleSizeR);
	translate([N17ScrewHoleDistance/2,-N17ScrewHoleDistance/2,-2], center=true) cylinder(h=4,r=N17ScrewHoleSizeR);
	translate([-N17ScrewHoleDistance/2,-N17ScrewHoleDistance/2,-2], center=true) cylinder(h=4,r=N17ScrewHoleSizeR);
}


RodSupportWidth=10;
SideWallWidth = 4;
difference()
{
	hull()
	{
		translate([-N17Width/2-SideWallWidth,N17Width/2,-1.5]) cube([N17Width+SideWallWidth*2,RodSupportWidth,40]);
		translate([0,N17Width/2,N17Width/2]) rotate([270,0,0])  cylinder(h=RodSupportWidth+7,r=2);
		translate([-5,N17Width/2,-1.5])   cube([10,RodSupportWidth+7,5]);
	}

	translate([0,N17Width/2+RodSupportWidth/2+5,-2] ) cylinder(h=90,r=RodHole);
}



//SideWall Left
difference()
{
	translate([-N17Width/2-SideWallWidth,-N17Width/2,-1.5]) cube([SideWallWidth,N17Width+RodSupportWidth,40]);
	translate([-N17Width/2-SideWallWidth-1,-N17Width/2,2]) rotate([41,0,0]) cube([SideWallWidth+1.1,N17Width+RodSupportWidth+5,45]);
}


//SideWall Right
difference()
{
	translate([N17Width/2,-N17Width/2,-1.5]) cube([SideWallWidth,N17Width+RodSupportWidth,40]);
	translate([N17Width/2-1,-N17Width/2,2]) rotate([41,0,0]) cube([SideWallWidth+1.1,N17Width+RodSupportWidth+5,45]);
}