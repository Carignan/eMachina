// eMachina Print head carriage an rail
// ----------------------------------------------------------------
// It is licensed under the Creative Commons - GNU GPL license.
// © 2012 by Pascal "Carignan" Roy
// more info at : www.repmachina.ca
//Main Module Call
main();


//Platforme Size
PLenght=100;
PWidth=75;
PTotalHeight=5;
PHeight = 3;


//Main Module
//----------------------------------------------------------------
module main()
{
	//DRAW The plateform
	translate ([0,0,0]) Plateform();

	//Draw the smooth rod guide 1
	translate([-5,58,0]) rotate([0,0,180]) HalfRail(PTotalHeight, 2);
	
	//Draw the smooth rod guide 2 and remove some material below it to save plastic
	difference()
	{
		translate([90,80,0]) rotate([0,0,90]) HalfRail(PTotalHeight+17, 2);
	
		translate([27,60,PTotalHeight-1]) cube([30,50,5]) ;
		translate([27,60,PTotalHeight-1]) cube([30,50,5]) ;
	}
	
	
}


//The Platform Module
//----------------------------------------------------------------
module Plateform()
{ 
	PCenterX = 60;
	PCenterY = 25;
	ScrewDistance = 50;
	HotEndHolderScrewDistance = 25;
	
	HoleA1X=PCenterX+ScrewDistance/2 ;
	HoleA1Y=PCenterY;
	HoleA2X=PCenterX-ScrewDistance/2 ;
	HoleA2Y=PCenterY;

	HoleB1X=RotateX(HoleA1X,PCenterX,HoleA1Y,PCenterY,45);
	HoleB1Y=RotateY(HoleA1X,PCenterX,HoleA1Y,PCenterY,45);
	HoleB2X=RotateX(HoleA2X,PCenterX,HoleA2Y,PCenterY,45);
	HoleB2Y=RotateY(HoleA2X,PCenterX,HoleA2Y,PCenterY,45);

	HoleC1X=RotateX(HoleA1X,PCenterX,HoleA1Y,PCenterY,-45);
	HoleC1Y=RotateY(HoleA1X,PCenterX,HoleA1Y,PCenterY,-45);
	HoleC2X=RotateX(HoleA2X,PCenterX,HoleA2Y,PCenterY,-45);
	HoleC2Y=RotateY(HoleA2X,PCenterX,HoleA2Y,PCenterY,-45);

	
	HEHoleA1X=PCenterX+HotEndHolderScrewDistance/2 ;
	HEHoleA1Y=PCenterY;
	HEHoleA2X=PCenterX-HotEndHolderScrewDistance/2 ;
	HEHoleA2Y=PCenterY;

	HEHoleB1X=RotateX(HEHoleA1X,PCenterX,HEHoleA1Y,PCenterY,22.5);
	HEHoleB1Y=RotateY(HEHoleA1X,PCenterX,HEHoleA1Y,PCenterY,22.5);
	HEHoleB2X=RotateX(HEHoleA2X,PCenterX,HEHoleA2Y,PCenterY,22,5);
	HEHoleB2Y=RotateY(HEHoleA2X,PCenterX,HEHoleA2Y,PCenterY,22.5);

	HEHoleC1X=RotateX(HEHoleA1X,PCenterX,HEHoleA1Y,PCenterY,-22.5);
	HEHoleC1Y=RotateY(HEHoleA1X,PCenterX,HEHoleA1Y,PCenterY,-22.5);
	HEHoleC2X=RotateX(HEHoleA2X,PCenterX,HEHoleA2Y,PCenterY,-22,5);
	HEHoleC2Y=RotateY(HEHoleA2X,PCenterX,HEHoleA2Y,PCenterY,-22.5);

	HEHoleD1X=RotateX(HEHoleA1X,PCenterX,HEHoleA1Y,PCenterY,90);
	HEHoleD1Y=RotateY(HEHoleA1X,PCenterX,HEHoleA1Y,PCenterY,90);
	HEHoleD2X=RotateX(HEHoleA2X,PCenterX,HEHoleA2Y,PCenterY,90);
	HEHoleD2Y=RotateY(HEHoleA2X,PCenterX,HEHoleA2Y,PCenterY,90);

	
	
	translate([5,5,0])
	
	difference()
	{
		minkowski()
		{
			cube([PLenght-10,PWidth-10,PHeight]);
			cylinder(h=PHeight/4,r=5);
		}

		
		//Platform extruder screw Hole
		translate([HoleA1X,HoleA1Y,-1]) cylinder(h=PHeight+6,r=1.9); 		
		translate([HoleA2X,HoleA2Y,-1]) cylinder(h=PHeight+6,r=1.9); 		

		//Platform extruder screw Hole
		translate([HoleB1X,HoleB1Y,-1]) cylinder(h=PHeight+6,r=1.9); 		
		translate([HoleB2X,HoleB2Y,-1]) cylinder(h=PHeight+6,r=1.9); 		

		//Platform extruder screw Hole
		translate([HoleC1X,HoleC1Y,-1]) cylinder(h=PHeight+6,r=1.9); 		
		translate([HoleC2X,HoleC2Y,-1]) cylinder(h=PHeight+6,r=1.9); 		
		
		//Platform central Hole
		translate([PCenterX,PCenterY,-1]) cylinder(h=PHeight+6,r=12); 		
		
		
		//opening for cables 1
		translate([PCenterX-15,PCenterY+28,-1]) cylinder(h=PHeight+2,r=4);
		translate([PCenterX+15,PCenterY+28,-1]) cylinder(h=PHeight+2,r=4);
		translate([PCenterX-15,PCenterY+25,-1]) cube([30,6,PHeight+2]);
  
		//opening for cables 2 
		translate([PCenterX-43,PCenterY-15,-1]) cylinder(h=PHeight+2,r=4);
		translate([PCenterX-43,PCenterY+15,-1]) cylinder(h=PHeight+2,r=4);
		translate([PCenterX-46,PCenterY-15,-1]) cube([6,30,PHeight+2]);

		//and holes for the fan/light adaptor
		translate([PCenterX-50,PCenterY-10,-1]) cylinder(h=PHeight+2,r=1.9);
		translate([PCenterX-50,PCenterY+10,-1]) cylinder(h=PHeight+2,r=1.9);
		
		// holes for hotEnd support screw heads , now you have plenty of option :)
		translate([HEHoleB1X,HEHoleB1Y,-1]) cylinder(h=PHeight+6,r=4); 		
		translate([HEHoleB2X,HEHoleB2Y,-1]) cylinder(h=PHeight+6,r=4); 		

		translate([HEHoleC1X,HEHoleC1Y,-1]) cylinder(h=PHeight+6,r=4); 		
		translate([HEHoleC2X,HEHoleC2Y,-1]) cylinder(h=PHeight+6,r=4); 		
		
		translate([HEHoleD1X,HEHoleD1Y,-1]) cylinder(h=PHeight+6,r=4); 		
		translate([HEHoleD2X,HEHoleD2Y,-1]) cylinder(h=PHeight+6,r=4); 		


	}
}


// X and Y position rotation functions
function RotateX(x,xc,y,yc,theta) = cos(theta)*(x-xc) - sin(theta)*(y-yc) + xc;
function RotateY(x,xc,y,yc,theta) = sin(theta)*(x-xc) + cos(theta)*(y-yc) + yc;

 

// Half rail Module
//---------------------------------------------------------------
// SplitFixType = 1 Screw Head,  2+= 3mm nut;
module HalfRail(BaseHeightRelative, SplitFixType)
{
OuterDia = 14;
BaseHeight =  BaseHeightRelative/2 + OuterDia;

translate([0,0,BaseHeight])

	difference()
	{
		union()
		{
			translate([0,0,0]) rotate([270,0,0]) cylinder(h=58,r=OuterDia);
			sphere(OuterDia, $fn=100);
			translate ([0,58,0]) sphere(OuterDia, $fn=100);

			//Support block
			translate ([-OuterDia,-10,-10-BaseHeight+10]) cube([OuterDia,78,BaseHeight]);
		}
		
		//To remove
		translate ([0,2,0])LM8UU();
		translate ([0,32,0]) LM8UU();
		translate ([0,-25,0]) 8mmRod(100);
		translate ([0,-15,-OuterDia]) cube([15,100,50]);		
		

		//Draw the fixing holes
		if ( SplitFixType == 1 )
		{
			translate([-20,-2,8.5]) rotate ([0,90,0]) cylinder(h=50, r=1.9, $fn=10);
			translate([-24.5,-2,8.5]) rotate ([0,90,0]) cylinder(h=20, r=3.9, $fn=10);
			translate([-20,-2,-8.5]) rotate ([0,90,0]) cylinder(h=50, r=1.9, $fn=10);
			translate([-24.5,-2,-8.5]) rotate ([0,90,0]) cylinder(h=20, r=3.9, $fn=10);
			translate([-20,60,8.5]) rotate ([0,90,0]) cylinder(h=50, r=1.9, $fn=10);
			translate([-24.5,60,8.5]) rotate ([0,90,0]) cylinder(h=20, r=3.9, $fn=10);
			translate([-20,60,-8.5]) rotate ([0,90,0]) cylinder(h=50, r=1.9, $fn=10);
			translate([-24.5,60,-8.5]) rotate ([0,90,0]) cylinder(h=20, r=3.9, $fn=10);
		}
		else
		{
			translate([-20,-2,8.5]) rotate ([0,90,0]) cylinder(h=50, r=1.9, $fn=10);
			translate([-24.5,-2,8.5]) rotate ([0,90,0]) cylinder(h=20, r=3.9, $fn=6);
			translate([-20,-2,-8.5]) rotate ([0,90,0]) cylinder(h=50, r=1.9, $fn=10);
			translate([-24.5,-2,-8.5]) rotate ([0,90,0]) cylinder(h=20, r=3.9, $fn=6);
			translate([-20,60,8.5]) rotate ([0,90,0]) cylinder(h=50, r=1.9, $fn=10);
			translate([-24.5,60,8.5]) rotate ([0,90,0]) cylinder(h=20, r=3.9, $fn=6);
			translate([-20,60,-8.5]) rotate ([0,90,0]) cylinder(h=50, r=1.9, $fn=10);
			translate([-24.5,60,-8.5]) rotate ([0,90,0]) cylinder(h=20, r=3.9, $fn=6);
		}
	}
}


// Draw a LM8UU bearing
// ---------------------------------------------------------------------
module LM8UU()
{
	dia_off=.5;
	long_off=.91;
	color("Green") 
	rotate([270,0,0]) translate([0,0,-long_off/2])
	cylinder(h=24+long_off,r=7.5+dia_off);
}

// Draw a 608ZZ bearing
// ---------------------------------------------------------------------
module 608ZZ()
{
	dia_off=.5;
	color("red")
	rotate([270,0,0])
	cylinder(h=7,r=11+dia_off);
}

//Draw a 8mm Rod
// ---------------------------------------------------------------------
module 8mmRod(Lenght)
{
	dia_off=.97;
	color("blue")
	rotate([270,0,0])
	cylinder(h=Lenght,r=4+dia_off);
}