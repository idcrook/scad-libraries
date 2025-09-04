/// Downloaded from:
///  https://www.printables.com/model/63301-customizable-wedge/files
///  2025-Sep-04

// A very simple customizable wedge with a radius around all edges

// facet parameter (only change if you know what you do)
$fn=40;

// radius at the corners should be at least half as the smallest height or width.

// radius at all corners (set to 0 if you dont want any round corners)
radius = 1;
offset = radius*2;

//length of the wedge (x axis)
length = 60;
// width of the wedge (z axis)
width = 35;
// height of the wedge at the beginning (y axis)
begin_height = 10;
// height of the wedge at the end (y axis)
end_height   = 2;

minkowski()
{
  {
    linear_extrude(height = width - offset, center = false)
      polygon(points=[[0,0],[length - offset,0],[length - offset,begin_height - offset],[0,end_height - offset],[0,0]]);
  }
  sphere(r=radius);
}

//length of the wedge (y axis)
//width of the wedge (x axis)
//heights (z axis)
// radius must be less than or equal to 1/2 of MIN(begin_height, end_height)
module wedge_rounded_corner (length = 60, width = 35, begin_height = 10, end_height = 2, radius = 0) {

  loffset = radius*2;
  translate([width - radius, length - radius, + radius])
  rotate([0,-90,0])
  rotate([0,0,-90])
  minkowski()
    {
      {
        linear_extrude(height = width - loffset, center = false)
          polygon(points=[[0,0],
                          [length - loffset,0],
                          [length - loffset,begin_height - loffset],
                          [0,end_height - loffset],[0,0]]);
      }
      sphere(r=radius);
    }
}
