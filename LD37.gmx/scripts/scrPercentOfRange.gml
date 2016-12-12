///scrPercentOfRange(rangeMin, rangeMax, n)

var rangeMin = argument0;
var rangeMax = argument1;
var n = argument2;

var adjustedMax = rangeMax - rangeMin;
var adjustedN = n - rangeMin;
if(adjustedN == 0)
  return 0; // divide by zero

return adjustedN/adjustedMax;
