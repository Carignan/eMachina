//XYMotorMount.scad


//the pully middle start at 19mm
//the distance from the middle of the pully and the middle of the shat must be 42mm

//Rod Mount


$fn=100;
WallTickness = 4;

MidPulleyHeight = 19;
MiddleBearing = MidPulleyHeight;
DistanceMidPulleyToMidShaft = 42;
MidShaftHeight = MidPulleyHeight + DistanceMidPulleyToMidShaft;
TotalHeight = MidPulleyHeight + DistanceMidPulleyToMidShaft + WallTickness+6;
BeltWidth = 11;
MountLenght = 45;
BearingDiam = 14;
BearingRadius = (BearingDiam/2);
BeltThickness = 2;
BearingZPos = BearingRadius + BeltThickness + WallTickness + 2; //2 is the marge.

RodY = 45 - (19+27.5);
//the pully middle start at 19mm
//the distance from the middle of the pully and the middle of the shat must be 27.5mm

//Rod Mount
difference () 
{
	union()
	{
		cube([42,TotalHeight,WallTickness]);
		translate([42/2,MidShaftHeight,0]) cylinder (h = 15,r=10 ); 
		
		translate ([(42-BearingDiam)/2,MiddleBearing-(BeltWidth/2) - WallTickness,0]) cube([BearingDiam,WallTickness,BearingZPos]);
		translate ([(42-BearingDiam)/2,MiddleBearing+(BeltWidth/2),0]) cube([BearingDiam,WallTickness,BearingZPos]);
		
		translate ([42/2,MiddleBearing-(BeltWidth/2) - WallTickness,BearingZPos])   rotate([270,0,0]) cylinder (h =WallTickness,r=BearingRadius);
		translate ([42/2,MiddleBearing+(BeltWidth/2),BearingZPos]) rotate([270,0,0]) cylinder (h =WallTickness,r=BearingRadius);
		
		
	}
	translate ([42/2,MiddleBearing-(BeltWidth/2)-WallTickness-1,BearingZPos]) rotate([270,0,0])	 cylinder (h =BeltWidth+(WallTickness*2)+2,r=1.9);
	translate([42/2,MidShaftHeight,2]) cylinder (h = 15,r=4.2 ); 
	
	translate([7, WallTickness+7,-1]) cylinder (h = WallTickness+2,r=2 ); 
	translate([7, TotalHeight-16,-1]) cylinder (h = WallTickness+2,r=2 ); 
	translate([42-7, WallTickness+7,-1]) cylinder (h = WallTickness+2,r=2 ); 
	translate([42-7, TotalHeight-16,-1]) cylinder (h = WallTickness+2,r=2 ); 
}


