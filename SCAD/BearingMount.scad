

 
// X and Y position rotation functions
//function RotateX(x,xc,y,yc,theta) = cos(theta)*(x-xc) - sin(theta)*(y-yc) + xc;
//function RotateY(x,xc,y,yc,theta) = sin(theta)*(x-xc) + cos(theta)*(y-yc) + yc;


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


// Half rail Module
//---------------------------------------------------------------
// SplitFixType = 1 Screw Head,  2+= 3mm nut;
module HalfRail(BaseHeightRelative, SplitFixType)
{
OuterDia = 14;

BaseHeight =  BaseHeightRelative/2 + OuterDia;


HexNutHoleRadius = 3.5;
ScrewHeadRadius = 3.9;
ScrewDomeHeadRadius = 4.1;
ScrewDomeHoleRadius = 1.5;

echo("***Rod Center h=", BaseHeight);
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
		if ( SplitFixType == 1 ) //m3 Screw Head
		{
			translate([-20,-2,8.5]) rotate ([0,90,0]) cylinder(h=50, r=1.9, $fn=10);
			translate([-24.5,-2,8.5]) rotate ([0,90,0]) cylinder(h=20, r=ScrewHeadRadius, $fn=10);
			translate([-20,-2,-8.5]) rotate ([0,90,0]) cylinder(h=50, r=1.9, $fn=10);
			translate([-24.5,-2,-8.5]) rotate ([0,90,0]) cylinder(h=20, r=ScrewHeadRadius, $fn=10);
			translate([-20,60,8.5]) rotate ([0,90,0]) cylinder(h=50, r=1.9, $fn=10);
			translate([-24.5,60,8.5]) rotate ([0,90,0]) cylinder(h=20, r=ScrewHeadRadius, $fn=10);
			translate([-20,60,-8.5]) rotate ([0,90,0]) cylinder(h=50, r=1.9, $fn=10);
			translate([-24.5,60,-8.5]) rotate ([0,90,0]) cylinder(h=20, r=ScrewHeadRadius, $fn=10);
		}
		
		if ( SplitFixType == 2) //M3 Nuts
		{
			translate([-20,-2,8.5]) rotate ([0,90,0]) cylinder(h=50, r=1.9, $fn=10);
			translate([-24.5,-2,8.5]) rotate ([0,90,0]) cylinder(h=20, r=HexNutHoleRadius, $fn=6);
			translate([-20,-2,-8.5]) rotate ([0,90,0]) cylinder(h=50, r=1.9, $fn=10);
			translate([-24.5,-2,-8.5]) rotate ([0,90,0]) cylinder(h=20, r=HexNutHoleRadius, $fn=6);
			translate([-20,60,8.5]) rotate ([0,90,0]) cylinder(h=50, r=1.9, $fn=10);
			translate([-24.5,60,8.5]) rotate ([0,90,0]) cylinder(h=20, r=HexNutHoleRadius, $fn=6);
			translate([-20,60,-8.5]) rotate ([0,90,0]) cylinder(h=50, r=1.9, $fn=10);
			translate([-24.5,60,-8.5]) rotate ([0,90,0]) cylinder(h=20, r=HexNutHoleRadius, $fn=6);
		}
		
		if ( SplitFixType == 3) //DomeScrew Head
		{
			translate([-20,-2,8.5]) rotate ([0,90,0]) cylinder(h=50, r=1.9, $fn=10);
			translate([-27.5,-2,8.5]) rotate ([0,90,0]) cylinder(h=20, r=ScrewDomeHeadRadius, $fn=10);
			translate([-20,-2,-8.5]) rotate ([0,90,0]) cylinder(h=50, r=1.9, $fn=10);
			translate([-27.5,-2,-8.5]) rotate ([0,90,0]) cylinder(h=20, r=ScrewDomeHeadRadius, $fn=10);
			translate([-20,60,8.5]) rotate ([0,90,0]) cylinder(h=50, r=1.9, $fn=10);
			translate([-27.5,60,8.5]) rotate ([0,90,0]) cylinder(h=20, r=ScrewDomeHeadRadius, $fn=10);
			translate([-20,60,-8.5]) rotate ([0,90,0]) cylinder(h=50, r=1.9, $fn=10);
			translate([-27.5,60,-8.5]) rotate ([0,90,0]) cylinder(h=20, r=ScrewDomeHeadRadius, $fn=10);
		}

		if ( SplitFixType == 4) //Dome Screw Hole
		{
			translate([-8,-2,8.5]) rotate ([0,90,0]) cylinder(h=20, r=ScrewDomeHoleRadius, $fn=10);
			translate([-8,-2,-8.5]) rotate ([0,90,0]) cylinder(h=50, r=ScrewDomeHoleRadius, $fn=10);
			translate([-8,60,8.5]) rotate ([0,90,0]) cylinder(h=50, r=ScrewDomeHoleRadius, $fn=10);
			translate([-8,60,-8.5]) rotate ([0,90,0]) cylinder(h=50, r=ScrewDomeHoleRadius, $fn=10);
		}
		
	}
}


