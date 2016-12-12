///scrPercentOfRange(rangeMin, rangeMax, n)

var rangeMin = argument0;
var rangeMax = argument1;
var n = argument2;

var adjustedMax = rangeMax - rangeMin;
var adjustedN = n - rangeMin;
if(adjustedN == 0)
  return 0; // divide by zero
  
show_debug_message(string(n) + " is " + string(adjustedN/adjustedMax) + " between " + string(rangeMin) + " and " + string(rangeMax));
return adjustedN/adjustedMax;
