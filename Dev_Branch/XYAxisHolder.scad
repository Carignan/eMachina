//-------------------------------------------------------
//2012-2013 Carignan's Design
//Under Open Hardware license
//And the help of all the previous Open hardware inventor
//and Designer Pionners
//-------------------------------------------------------

//This parts is use to hold the herribord rack holding on the motor side

//Specs
ArmLenght     = 95; //mm
ArmWidth	  = 10; //mm
ArmHeight     = 30; //mm
ArmBaseLenght = 5;  //mm
ArmBaseHeight = ArmHeight+10; //mm
RodHoleRad    = 3.22; //mm
ScrewHoleRad  = 1.77; //mm


//Calculated pos and Spec
ArmX = (ArmBaseHeight - ArmHeight) /2;
ArmTopY = ArmLenght + ArmBaseLenght;
//Draw the base
difference()
{
	union()
	{	
		cube([ArmBaseHeight,ArmBaseLenght,ArmWidth]);
		translate([0,0,ArmBaseLenght]) rotate([270,0,00]) cylinder(h=ArmBaseLenght,r=ArmWidth/2); 
		translate([ArmBaseHeight,0,ArmBaseLenght]) rotate([270,0,00]) cylinder(h=ArmBaseLenght,r=ArmWidth/2); 
	}
	translate([0,0,ArmBaseLenght]) rotate([270,0,00]) cylinder(h=ArmBaseLenght,r=ScrewHoleRad); 
	translate([ArmBaseHeight,0,ArmBaseLenght]) rotate([270,0,00]) cylinder(h=ArmBaseLenght,r=ScrewHoleRad); 
}

//Draw the main arm
difference()
{
	translate([ArmX,5,0]) cube([ArmHeight,ArmLenght,ArmWidth]);

	//Draw the Support Rod hole ( this hole will hold the Rod that will be inserted in the rack )
	translate([ArmX+5,ArmTopY-10,0]) cylinder(h=20, r=RodHoleRad);
	translate([ArmX+5-RodHoleRad+RodHoleRad/2,ArmTopY-10,0]) cube([2,10,20]);
	translate([20,ArmTopY-10+RodHoleRad+2,5]) rotate([0,270,0])  cylinder(h=20,r=ScrewHoleRad);

	//Draw holes to removed a uneeded plastic
	translate([ArmBaseHeight/2,80,0]) cylinder(h=ArmWidth, r=ArmHeight/4);
	translate([ArmBaseHeight/2,60,0]) cylinder(h=ArmWidth, r=ArmHeight/4);
	translate([ArmBaseHeight/2,40,0]) cylinder(h=ArmWidth, r=ArmHeight/4);
	translate([ArmBaseHeight/2,20,0]) cylinder(h=ArmWidth, r=ArmHeight/4);
	translate([ArmBaseHeight/2,0,0]) cylinder(h=ArmWidth, r=ArmHeight/4);
}