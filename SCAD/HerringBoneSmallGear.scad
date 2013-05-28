//-------------------------------------------------------
//2012-2013 Carignan's Design
//Under Open Hardware license
//And the help of all the previous Open hardware inventor
//and Designer Pionners
//-------------------------------------------------------

include <MCAD/involute_gears.scad> 
include <CaptiveScrewShaft.scad>

centerAngle=25;//angle at center of teeth
diametralPitch=12;

motorShaftDiam = 5.65;
IdlerShaftDiam = 6.54;

difference () 
{
	union()
	{
		translate ([0,0,0]) CaptiveScrewShaft(ShaftDiam=25, ShaftBore = motorShaftDiam);
		translate([0,0,10]) Gear();
		translate ([0,0,23]) cylinder (h =7,r1=9,r2=12.5);
		translate ([0,0,40]) rotate([0,180,180])  CaptiveScrewShaft(ShaftDiam=25, ShaftBore = IdlerShaftDiam);
	}
	
}


module Gear(position,diametralPitch)
{
	wheelSize=13;
	rotate([0,0,180])
	translate(position)
	
	union()
	{
		gear (
			number_of_teeth=8,
			circular_pitch=300, 
			pressure_angle=19.34,
			gear_thickness=wheelSize/2,
			rim_thickness=wheelSize/2,
			hub_thickness=0,
			bore_diameter=2,
			backlash=0,twist=centerAngle,involute_facets=15);

		translate([0,0,wheelSize/2])
		rotate([0,0,-centerAngle])
		gear (
			number_of_teeth=8,
			circular_pitch=300, 
			pressure_angle=19.34,
			gear_thickness=wheelSize/2,
			rim_thickness=wheelSize/2,
			hub_thickness=0,
			bore_diameter=2,
			backlash=0,twist=-centerAngle,involute_facets=15);

	}
}


