///scrIsInRect(instance, x1, y1, x2, y2)

var instance = argument0;
var x1 = argument1;
var y1 = argument2;
var x2 = argument3;
var y2 = argument4;


if(x1 > x2) {
  var temp = x1;
  x1 = x2;
  x2 = temp;
}

if(y1 > y2) {
  var temp = y1;
  y1 = y2;
  y2 = temp;
}

if(instance != noone)
  return rectangle_in_rectangle(x1, y1, x2, y2, instance.bbox_left, instance.bbox_top, instance.bbox_right, instance.bbox_bottom);  
else
  return false;

