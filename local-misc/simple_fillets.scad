/*Simple Fillet Library v1.0 by Mike Thompson 3/1/2015

  via https://www.printables.com/model/96739-simple-fillets-library/files

 * v1.1 18/1/2015 added ability to change profile angle for ring fillet
* v1.2 20/12/2021 added higher level functions to simplify usage
*
* This software is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Australia License.
* Further information is available here - http://creativecommons.org/licenses/by-nc-sa/3.0/au/deed.en_GB
*
* This library generates basic fillets using the following functions:
*
* Standard functions:
* - cube_fillet_inside (generates internal fillets based on cube dimensions)
* - cube_fillet_outside (generates external fillets based on cube dimensions)
* - cylinder fillet_inside (generates internal fillets based on cylinder radius)
* - cylinder fillet_outside (generates external fillets based on cylinder radius)
*
* Internal functions (not nornmally modified, but can be modified to change fillet shape etc.)
* - linear_fillet (straight edges)
* - corner_fillet (90 degree corners)
* - ring_fillet (cylinders - inside and outside)
* - profile (generates the 2d profile used to set the fillet shape)
*
* There are more advanced fillet libraries and functions available such as the excellent:
* https://github.com/clothbot/ClothBotCreations/blob/master/utilities/fillet.scad
* however, sometimes you just need a basic fillet with a low computational overhead that can be applied
* quickly and easily to selected objects :)
*/

$fn=100;

//basic 2d profile used for fillet shape
module profile(radius)
{
  difference()
  {
    square(radius);
    circle(r=radius);
  }
}

//ring fillet for use around cylindrical objects. Set profile angle to 180 for outside fillet and 270 for inside.
module ring_fillet(ring_radius,profile_radius,profile_angle)
{
	translate([0,0,profile_radius])rotate_extrude(convexity=10)translate([ring_radius,0,0])rotate([0,0,profile_angle])profile(profile_radius);
}

//linear fillet for use along straight edges
module linear_fillet(length,profile_radius)
{
	translate([0,-profile_radius,profile_radius])rotate([0,90,0])linear_extrude(height=length,convexity=10)profile(profile_radius);
}

//corner fillet for use on 90 degree corners
module corner_fillet(corner_radius,profile_radius,profile_angle)
{
	intersection()
	{
		linear_fillet(corner_radius,profile_radius);
		translate([0,-corner_radius,0])rotate([0,0,90])linear_fillet(corner_radius,profile_radius);
	}
}

//cube fillets
module cube_fillet_outside(x,y,z)
{
    //sides
    linear_fillet(x,z);
    translate([0,y,0])mirror([0,1,0])linear_fillet(x,z);
    translate([x,0,0])rotate([0,0,90])linear_fillet(y,z);
    translate([0,0,0])mirror([1,0,0])rotate([0,0,90])linear_fillet(y,z);

    //corners
    rotate([0,0,-90])corner_fillet(z,z);
    translate([x,0,0])corner_fillet(z,z);
    translate([x,y,0])rotate([0,0,90])corner_fillet(z,z);
    translate([0,y,0])rotate([0,0,-180])corner_fillet(z,z);
}

module cube_fillet_inside(x,y,z)
{
    //sides
    mirror([0,1,0])linear_fillet(x,z);
    translate([0,y,0])linear_fillet(x,z);
    rotate([0,0,90])linear_fillet(y,z);
    translate([x,0,0])mirror([1,0,0])rotate([0,0,90])linear_fillet(y,z);
}

module cylinder_fillet_outside(r,z)
{
    ring_fillet(r+z,z,180);
}

module cylinder_fillet_inside(r,z)
{
    ring_fillet(r-z,z,270);
}

/*
/************************************************************************************************
* EXAMPLES
* ***********************************************************************************************/

// //base
// color("LimeGreen")cube([95,95,2]);

// /*************************
// * cube tower
// **************************/
// //create tower and subtract cube fillet from top
// difference()
// {
// 	color("LimeGreen")translate([10,55,2])cube([30,30,50]);
//     translate([10,55,52])mirror([0,0,1])cube_fillet_inside(30,30,10);
// }
// //add cube fillet to base
// translate([10,55,2])cube_fillet_outside(30,30,10);

// /*************************
// * small hollow cube
// **************************/
// //create hollow cube
// difference()
// {
// 	color("LimeGreen")translate([52.5,52.5,2])cube([40,40,10]);
// 	color("LimeGreen")translate([53.5,53.5,2])cube([38,38,11]);
// }
// //add inside cube fillet
// translate([53.5,53.5,2])cube_fillet_inside(38,38,10);

// /*************************
// * cylinder tower
// **************************/
// //create cylinder and subtract cylinder fillet from top
// difference()
// {
// 	color("LimeGreen")translate([70,25,2])cylinder(r=15,h=50);
// 	translate([70,25,52])rotate([0,180,0])cylinder_fillet_inside(15,10);
// }
// //add cylinder fillet to base
// translate([70,25,2])cylinder_fillet_outside(15,10);

// /*************************
// * small hollow cylinder
// **************************/
// //create hollow cylinder
// difference()
// {
// 	color("LimeGreen")translate([22.5,22.5,2])cylinder(r=20,h=10);
// 	color("LimeGreen")translate([22.5,22.5,2])cylinder(r=19,h=11);
// }
// //add inside cylinder fillet
// translate([22.5,22.5,2])cylinder_fillet_inside(19,10);
