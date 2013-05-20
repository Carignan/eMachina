//-------------------------------------------------------
//2012-2013 Carignan's Design
//Under Open Hardware license
//And the help of all the previous Open hardware inventor
//and Designer Pionners
//-------------------------------------------------------

include <MCAD/nuts_and_bolts.scad>

module CaptiveScrewShaft (	ShaftHeight = 10, ShaftDiam = 20,  ShaftBore = 5.25, SetScrewDiam = 3.2, NutSizemm = 3 )
{
	$fn =20;	
	SetScrewDistanceFromEdge = 3;//mm
	
	difference () 
	{
		//Main Shaft
		cylinder(h=ShaftHeight,r=ShaftDiam/2);
		
		//Shaft bore
		cylinder(h=ShaftHeight,r=ShaftBore/2);
	
		//Captive nut hole
		translate([0,(ShaftBore/2) +1.5 , (SetScrewDiam/2) + SetScrewDistanceFromEdge]) 
		rotate([270,90,0]) 
		nutHole(size=NutSizemm);
		
		translate([0,(ShaftBore/2) +1.5 , ((SetScrewDiam/2) + SetScrewDistanceFromEdge)/2]) 
		rotate([270,90,0]) 
		nutHole(size=NutSizemm);
		
		translate([0,(ShaftBore/2) +1.5 , 0]) 
		rotate([270,90,0]) 
		nutHole(size=NutSizemm);
		

		//Set screw Hole
		translate([0,0,(SetScrewDiam/2) + SetScrewDistanceFromEdge])
		rotate([270,0,0]) cylinder (h =40,r= SetScrewDiam/2 );
	}
}



