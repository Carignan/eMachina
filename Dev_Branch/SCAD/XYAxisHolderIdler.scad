//-------------------------------------------------------
//2012-2013 Carignan's Design
//Under Open Hardware license
//And the help of all the previous Open hardware inventor
//and Designer Pionners
//-------------------------------------------------------
$fn=16;
//This parts is use to hold the herribord rack holding on the motor side

//Specs
ArmLenght     = 30; //mm
ArmWidth	  = 12; //mm
ArmHeight     = 30; //mm
ArmBaseLenght = 8;  //mm
ArmBaseHeight = ArmHeight+30; //mm
RodHoleRad    = 3.27; //mm
ScrewHoleRad  = 1.81; //mm


//Calculated pos and Spec
ArmX = (ArmBaseHeight - ArmHeight) /2;
ArmTopY = ArmLenght + ArmBaseLenght;

ScrewHoleOffset = (ArmBaseHeight - ArmHeight ) / 4 ;

//Draw the base
difference()
{
	union()
	{	
		cube([ArmBaseHeight,ArmBaseLenght,ArmWidth]);
		//translate([0,0,ArmBaseLenght]) rotate([270,0,00]) cylinder(h=ArmBaseLenght,r=ArmWidth/2); 
		//translate([ArmBaseHeight,0,ArmBaseLenght]) rotate([270,0,00]) cylinder(h=ArmBaseLenght,r=ArmWidth/2); 
	}
	translate([ScrewHoleOffset,0,ArmWidth/2]) rotate([270,0,00]) cylinder(h=ArmBaseLenght,r=ScrewHoleRad); 
	translate([ArmBaseHeight-ScrewHoleOffset,0,ArmWidth/2]) rotate([270,0,00]) cylinder(h=ArmBaseLenght,r=ScrewHoleRad); 
}

//Draw the main arm
difference()
{
	translate([ArmX,5,0]) cube([ArmHeight,ArmLenght,ArmWidth]);

	//Draw the Support Rod hole ( this hole will hold the Rod that will be inserted in the rack )
	translate([ArmX+10,ArmTopY-15,0]) cylinder(h=20, r=RodHoleRad);
	translate([ArmX+10-1,ArmTopY-15,0]) cube([2,15,20]);
	translate([30,ArmTopY-9,ArmWidth/2]) rotate([0,270,0])  cylinder(h=30,r=ScrewHoleRad);

}