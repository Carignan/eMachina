//Platforme Size
PLenght=100;
PWidth=75;
PTotalHeight=5;
PHeight = 3;




main();



//Print Head Carriage
//Distance between ROD = 37.75




//Main Module
module main()
{
	//DRAW The plateform
	translate ([0,0,0]) Plateform();
	translate ([0,0,0]) SideWall();
	translate([60+10,-10,9]) rotate([0,0,90]) SideWall();
	
	translate([0,58,0]) rotate([0,0,180]) HalfRail(PTotalHeight+3, 2);
	translate([90,75,0]) rotate([0,0,90]) HalfRail(PTotalHeight+13, 2);
}




module Plateform()
{ 
	PCenterX = 60;
	PCenterY = 25;
	ScrewDistance = 50;
	
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
		translate([PCenterX,PCenterY,-1]) cylinder(h=PHeight+6,r=10); 		
		
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

		translate([-11,PWidth-21,-1]) cube([35,20,PHeight+2]);
		
		
		//opening for cables
		
	}
	


	


}


function RotateX(x,xc,y,yc,theta) = cos(theta)*(x-xc) - sin(theta)*(y-yc) + xc;
function RotateY(x,xc,y,yc,theta) = sin(theta)*(x-xc) + cos(theta)*(y-yc) + yc;

 





// SplitFixType = 1 Screw, >1=nut;
module HalfRail(BaseHeightRelative, SplitFixType)
{
BaseHeight =  BaseHeightRelative/2 + 12;

translate([0,0,BaseHeight])

	difference()
	{
		union()
		{
			translate([0,0,0]) rotate([270,0,0]) cylinder(h=58,r=12);
			sphere(12, $fn=100);
			translate ([0,58,0]) sphere(12, $fn=100);
			translate ([-10,0,-10-BaseHeight+10]) cube([10,58,BaseHeight]);
		}
		
		//To remove
		translate ([0,2,0])LM8UU();
		translate ([0,32,0]) LM8UU();
		translate ([0,-13,0]) 8mmRod(85);
		translate ([0,-15,-12]) cube([12,85,24]);

		if ( SplitFixType == 1 )
		{
				
				translate([-20,-2,7.5]) rotate ([0,90,0]) cylinder(h=50, r=1.9, $fn=10);
				translate([-24.5,-2,7.5]) rotate ([0,90,0]) cylinder(h=20, r=2.5, $fn=10);
				
				translate([-20,-2,-7.5]) rotate ([0,90,0]) cylinder(h=50, r=1.9, $fn=10);
				translate([-24.5,-2,-7.5]) rotate ([0,90,0]) cylinder(h=20, r=2.5, $fn=10);
				
				translate([-20,29,7.5]) rotate ([0,90,0]) cylinder(h=50, r=1.9, $fn=10);
				translate([-24.5,29,7.5]) rotate ([0,90,0]) cylinder(h=20, r=2.5, $fn=10);

				translate([-20,29,-7.5]) rotate ([0,90,0]) cylinder(h=50, r=1.9, $fn=10);
				translate([-24.5,29,-7.5]) rotate ([0,90,0]) cylinder(h=20, r=2.5, $fn=10);

				translate([-20,60,7.5]) rotate ([0,90,0]) cylinder(h=50, r=1.9, $fn=10);
				translate([-24.5,60,7.5]) rotate ([0,90,0]) cylinder(h=20, r=2.5, $fn=10);

				translate([-20,60,-7.5]) rotate ([0,90,0]) cylinder(h=50, r=1.9, $fn=10);
				translate([-24.5,60,-7.5]) rotate ([0,90,0]) cylinder(h=20, r=2.5, $fn=10);
				
				
		}
		
		else
		{
				translate([-20,-2,7.5]) rotate ([0,90,0]) cylinder(h=50, r=1.9, $fn=10);
				translate([-24.5,-2,7.5]) rotate ([0,90,0]) cylinder(h=20, r=2.9, $fn=6);
				
				translate([-20,-2,-7.5]) rotate ([0,90,0]) cylinder(h=50, r=1.9, $fn=10);
				translate([-24.5,-2,-7.5]) rotate ([0,90,0]) cylinder(h=20, r=2.9, $fn=6);
				
				translate([-20,29,7.5]) rotate ([0,90,0]) cylinder(h=50, r=1.9, $fn=10);
				translate([-24.5,29,7.5]) rotate ([0,90,0]) cylinder(h=20, r=2.9, $fn=6);

				translate([-20,29,-7.5]) rotate ([0,90,0]) cylinder(h=50, r=1.9, $fn=10);
				translate([-24.5,29,-7.5]) rotate ([0,90,0]) cylinder(h=20, r=2.9, $fn=6);

				translate([-20,60,7.5]) rotate ([0,90,0]) cylinder(h=50, r=1.9, $fn=10);
				translate([-24.5,60,7.5]) rotate ([0,90,0]) cylinder(h=20, r=2.9, $fn=6);

				translate([-20,60,-7.5]) rotate ([0,90,0]) cylinder(h=50, r=1.9, $fn=10);
				translate([-24.5,60,-7.5]) rotate ([0,90,0]) cylinder(h=20, r=2.9, $fn=6);

		
		}

		
	}
	
	
	
	
	

	
}

module LM8UU()
{
	dia_off=.5;
	color("Green") 
	rotate([270,0,0])
	cylinder(h=24,r=7.5+dia_off);
}

module 608ZZ()
{
	dia_off=.5;
	color("red")
	rotate([270,0,0])
	cylinder(h=7,r=11+dia_off);
}

module 8mmRod(Lenght)
{
	dia_off=.7;
	color("blue")
	rotate([270,0,0])
	cylinder(h=Lenght,r=4+dia_off);

}