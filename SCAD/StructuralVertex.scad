

difference()
{
	union()
	{
		cube([60,40,5]);
		cube([60,5,40]);

	translate ([5,35,0]) cylinder (h = 5, r=7);
	translate ([55,35,0]) cylinder (h = 5, r=7);
	translate ([5,0,35]) rotate([270,0,0]) cylinder (h = 5, r=7);	
	translate ([55,0,35]) rotate([270,0,0]) cylinder (h = 5, r=7);	

	}
	
	translate ([15,25,-1]) cylinder (h = 7, r=1.77);
	translate ([45,25,-1]) cylinder (h = 7, r=1.77);
	translate ([15,-1,25]) rotate([270,0,0]) cylinder (h = 7, r=1.77);	
	translate ([45,-1,25]) rotate([270,0,0]) cylinder (h = 7, r=1.77);	
	
	
}

 