



ArmLenght     = 40; //mm
RodHoleRad   =  3; //mm
ScrewHoleRad =  2; //mm



//Draw the base
difference()
{
	union()
	{	
		cube([40,5,10]);
		translate([0,0,5]) rotate([270,0,00]) cylinder(h=5,r=5); 
		translate([40,0,5]) rotate([270,0,00]) cylinder(h=5,r=5); 
	}
	translate([0,0,5]) rotate([270,0,00]) cylinder(h=5,r=ScrewHoleRad); 
	translate([40,0,5]) rotate([270,0,00]) cylinder(h=5,r=ScrewHoleRad); 
}


//Draw the main arm
difference()
{
translate([5,5,0]) cube([30,94,10]);

//Draw the Support Rod hole ( this hole will hold the Rod that will be inserted in the rack )

translate([10,90,0]) cylinder(h=20, r=RodHoleRad);
translate([10-RodHoleRad+RodHoleRad/2,90,0]) cube([2,10,20]);
translate([20,95,5]) rotate([0,270,0])  cylinder(h=20,r=1.5);
}