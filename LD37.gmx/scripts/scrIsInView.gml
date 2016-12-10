///scrIsInView(object)

var object = argument0;

with (object) {
  if (x > view_xview[0] && y > view_yview[0] && x < (view_xview[0]+view_wview[0]) && 
    y < (view_yview[0] + view_hview[0])) {
    return true;
  }
  return false;
}

return false;
