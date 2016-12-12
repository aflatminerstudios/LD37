/// scrCreateTallPlantForeground()

var leftMost = LEFTSIDEOFTANK + 75;
var rightMost = RIGHTSIDEOFTANK - 75;

var possibleX = irandom_range(leftMost, rightMost);
var possibleY = BOTTOMOFTANK + irandom_range(-10,30);

var newInhabitant = instance_create(possibleX, possibleY, objTallPlantForeground);

return newInhabitant;

