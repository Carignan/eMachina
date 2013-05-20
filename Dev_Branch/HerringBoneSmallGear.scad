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
demo_gear1();


module demo_gear1(position,diametralPitch)
{
	wheelSize=12;
	rotate([0,90,180])
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








//Lower Shaft
//CaptiveScrewShaft(ShaftDiam=32, ShaftHeight=10);

//bevel Gear 1
// translate([0,0,18+10])
// rotate([180,0,0])
// bevel_gear (
	// number_of_teeth=11,
	// cone_distance=50,
	// face_width=20,
	// outside_circular_pitch=700,
	// pressure_angle=30,
	// clearance = 0.2,
	// backlash = 0,
	// involute_facets=0 ,
	// finish = -1);

//HerringBone  positive 1

//HerringBone negative 1

//Involute Gear


//UpperShaft

// */


// gear (
    // number_of_teeth=11, 
	// circular_pitch=700,
	// gear_thickness = 12,
	// rim_thickness = 12,
	// hub_thickness = 12,
	// hub_diameter = 12,
	// twist=-12);

// /* 
// translate([0,0,0])
// rotate([180,0,0])
// bevel_gear (
	// number_of_teeth=11,
	// cone_distance=100,
	// face_width=20,
	// outside_circular_pitch=700,
	// pressure_angle=30,
	// clearance = 0.2,
	// bore_diameter=1,
	// gear_thickness = 12,
	// backlash = 0,
	// involute_facets=0,
	// finish = -1);
 // */


// /*
// module gear (
	// number_of_teeth=15,
	// circular_pitch=false, diametral_pitch=false,
	// pressure_angle=30,
	// clearance = 0.2,
	// gear_thickness=5,
	// rim_thickness=8,
	// rim_width=5,
	// hub_thickness=10,
	// hub_diameter=15,
	// bore_diameter=5,
	// circles=0,
	// backlash=0,
	// twist=0,
	// involute_facets=0,
	// flat=false)
// 