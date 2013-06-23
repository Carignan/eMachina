

 
// X and Y position rotation functions
//function RotateX(x,xc,y,yc,theta) = cos(theta)*(x-xc) - sin(theta)*(y-yc) + xc;
//function RotateY(x,xc,y,yc,theta) = sin(theta)*(x-xc) + cos(theta)*(y-yc) + yc;
//  TEST
//HalfRail(3);
// Draw a LM8UU bearing
// ---------------------------------------------------------------------
module LM8UU()
{
	dia = 7.5;
	dia_off=.5;
	long = 24;
	long_off=.91;
	color("Green") 
	translate([0,0,0]) 
	rotate([270,0,0])
	cylinder(h=long+long_off,r=dia+dia_off);
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


// Half rail Module
//---------------------------------------------------------------
// SplitFixType = 1 Screw Head,  2+= 3mm nut;
module HalfRail(FixHoleType = 1)
{
AdditionalHeight = 10;   //for screw hole
LM8UUDiam = 8*2;
LM8UULenght = 24.91;
WallWidth = 2;
BearingCenterZ = LM8UUDiam/2 + WallWidth + AdditionalHeight/2 ;
TotalHeight =  LM8UUDiam + (WallWidth*2) + AdditionalHeight ;
TotalLenght = (LM8UULenght*2) +  (WallWidth*3);
TotalWidth = WallWidth + LM8UUDiam/2;


//BaseHeight =  BaseHeightRelative/2 + OuterDia;


HexNutHoleRadius = 3.5;
ScrewHeadRadius = 3.9;
ScrewDomeHeadRadius = 4.1;
ScrewDomeHoleRadius = 1.5;

echo("***TotalLenght=", TotalLenght);
echo("***TotalWidth=", TotalWidth);
echo("***TotalHeight=", TotalHeight);
echo("***BearingCenterZ=", BearingCenterZ);

//translate([0,0,BaseHeight])

	difference()
	{
		union()
		{
			cube([TotalWidth ,TotalLenght,TotalHeight ]);
		}
			
		// Bearings
		translate ([TotalWidth,WallWidth,BearingCenterZ]) LM8UU();
		translate ([TotalWidth,WallWidth+LM8UULenght+WallWidth,BearingCenterZ]) LM8UU();

		//Shaft 8mm
		translate ([TotalWidth,-1,BearingCenterZ]) rotate([270,0,0]) cylinder (h =TotalLenght+2,  r=6);


		if ( FixHoleType == 3) //Dome Screw Head
		{
			translate([2,6,TotalHeight - AdditionalHeight/3]) rotate([0,90,0]) cylinder(h=30,r=2 , $fn=16);
			translate([-1,6,TotalHeight - AdditionalHeight/3]) rotate([0,90,0]) cylinder(h=3.5,r=3.5);
			
			translate([2,6,AdditionalHeight/3]) rotate([0,90,0]) cylinder(h=30,r=2 ,$fn=16);
			translate([-1,6,AdditionalHeight/3]) rotate([0,90,0]) cylinder(h=3.5,r=3.5);
			
			translate([2,TotalLenght-6,TotalHeight - AdditionalHeight/3]) rotate([0,90,0]) cylinder(h=30,r=2, $fn=16);
			translate([-1,TotalLenght-6,TotalHeight - AdditionalHeight/3]) rotate([0,90,0]) cylinder(h=3.5,r=3.5);
			
			translate([2,TotalLenght-6,AdditionalHeight/3]) rotate([0,90,0]) cylinder(h=30,r=2, $fn=16);
			translate([-1,TotalLenght-6,AdditionalHeight/3]) rotate([0,90,0]) cylinder(h=3.5,r=3.5);
		}

		
		if ( FixHoleType == 4) //Dome Screw Hole
		{
			translate([2,6,TotalHeight - AdditionalHeight/3]) rotate([0,90,0]) cylinder(h=30,r=1.5);
			translate([2,6,AdditionalHeight/3]) rotate([0,90,0]) cylinder(h=30,r=1.5);
			translate([2,TotalLenght-6,TotalHeight - AdditionalHeight/3]) rotate([0,90,0]) cylinder(h=30,r=1.5);
			translate([2,TotalLenght-6,AdditionalHeight/3]) rotate([0,90,0]) cylinder(h=30,r=1.5);
		}

		
		
	}	
	//To remove
		// translate ([0,2,0])LM8UU();
		// translate ([0,32,0]) LM8UU();
		// translate ([0,-25,0]) 8mmRod(100);
		// translate ([0,-15,-OuterDia]) cube([15,100,50]);		
		

		//Draw the fixing holes
		// if ( SplitFixType == 1 ) //m3 Screw Head
		// {
			// translate([-20,-2,8.5]) rotate ([0,90,0]) cylinder(h=50, r=1.9, $fn=10);
			// translate([-24.5,-2,8.5]) rotate ([0,90,0]) cylinder(h=20, r=ScrewHeadRadius, $fn=10);
			// translate([-20,-2,-8.5]) rotate ([0,90,0]) cylinder(h=50, r=1.9, $fn=10);
			// translate([-24.5,-2,-8.5]) rotate ([0,90,0]) cylinder(h=20, r=ScrewHeadRadius, $fn=10);
			// translate([-20,60,8.5]) rotate ([0,90,0]) cylinder(h=50, r=1.9, $fn=10);
			// translate([-24.5,60,8.5]) rotate ([0,90,0]) cylinder(h=20, r=ScrewHeadRadius, $fn=10);
			// translate([-20,60,-8.5]) rotate ([0,90,0]) cylinder(h=50, r=1.9, $fn=10);
			// translate([-24.5,60,-8.5]) rotate ([0,90,0]) cylinder(h=20, r=ScrewHeadRadius, $fn=10);
		// }
		
		// if ( SplitFixType == 2) //M3 Nuts
		// {
			// translate([-20,-2,8.5]) rotate ([0,90,0]) cylinder(h=50, r=1.9, $fn=10);
			// translate([-24.5,-2,8.5]) rotate ([0,90,0]) cylinder(h=20, r=HexNutHoleRadius, $fn=6);
			// translate([-20,-2,-8.5]) rotate ([0,90,0]) cylinder(h=50, r=1.9, $fn=10);
			// translate([-24.5,-2,-8.5]) rotate ([0,90,0]) cylinder(h=20, r=HexNutHoleRadius, $fn=6);
			// translate([-20,60,8.5]) rotate ([0,90,0]) cylinder(h=50, r=1.9, $fn=10);
			// translate([-24.5,60,8.5]) rotate ([0,90,0]) cylinder(h=20, r=HexNutHoleRadius, $fn=6);
			// translate([-20,60,-8.5]) rotate ([0,90,0]) cylinder(h=50, r=1.9, $fn=10);
			// translate([-24.5,60,-8.5]) rotate ([0,90,0]) cylinder(h=20, r=HexNutHoleRadius, $fn=6);
		// }
		
		// if ( SplitFixType == 3) //DomeScrew Head
		// {
			// translate([-20,-2,8.5]) rotate ([0,90,0]) cylinder(h=50, r=1.9, $fn=10);
			// translate([-27.5,-2,8.5]) rotate ([0,90,0]) cylinder(h=20, r=ScrewDomeHeadRadius, $fn=10);
			// translate([-20,-2,-8.5]) rotate ([0,90,0]) cylinder(h=50, r=1.9, $fn=10);
			// translate([-27.5,-2,-8.5]) rotate ([0,90,0]) cylinder(h=20, r=ScrewDomeHeadRadius, $fn=10);
			// translate([-20,60,8.5]) rotate ([0,90,0]) cylinder(h=50, r=1.9, $fn=10);
			// translate([-27.5,60,8.5]) rotate ([0,90,0]) cylinder(h=20, r=ScrewDomeHeadRadius, $fn=10);
			// translate([-20,60,-8.5]) rotate ([0,90,0]) cylinder(h=50, r=1.9, $fn=10);
			// translate([-27.5,60,-8.5]) rotate ([0,90,0]) cylinder(h=20, r=ScrewDomeHeadRadius, $fn=10);
		// }

		// if ( SplitFixType == 4) //Dome Screw Hole
		// {
			// translate([-8,-2,8.5]) rotate ([0,90,0]) cylinder(h=20, r=ScrewDomeHoleRadius, $fn=10);
			// translate([-8,-2,-8.5]) rotate ([0,90,0]) cylinder(h=50, r=ScrewDomeHoleRadius, $fn=10);
			// translate([-8,60,8.5]) rotate ([0,90,0]) cylinder(h=50, r=ScrewDomeHoleRadius, $fn=10);
			// translate([-8,60,-8.5]) rotate ([0,90,0]) cylinder(h=50, r=ScrewDomeHoleRadius, $fn=10);
		// }
		
	//}
}


