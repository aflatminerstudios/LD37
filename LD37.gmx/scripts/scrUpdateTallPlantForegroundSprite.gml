/// scrUpdateTallPlantForegroundSprite(instance)

var instance = argument0;

var leftMost = LEFTSIDEOFTANK + 75;
var rightMost = RIGHTSIDEOFTANK - 75;

var possibleX = instance.x;
var possibleY = instance.y;

var newInhabitant = instance;

var percentFromLeft = scrPercentOfRange(leftMost, rightMost, possibleX);

if(percentFromLeft <= 0.25)
  newInhabitant.sprite_index = sprTallPlantForegroundEightFrames;
else if(percentFromLeft <= 0.40)
  newInhabitant.sprite_index = sprTallPlantForegroundSevenFrames;
else if(percentFromLeft <= 0.51)
  newInhabitant.sprite_index = sprTallPlantForegroundSixFrames;
else if(percentFromLeft <= 0.63)
  newInhabitant.sprite_index = sprTallPlantForegroundFiveFrames;
else if(percentFromLeft <= 0.75)
  newInhabitant.sprite_index = sprTallPlantForegroundFourFrames;
else if(percentFromLeft <= 0.88)
  newInhabitant.sprite_index = sprTallPlantForegroundThreeFrames;
else if(percentFromLeft <= 0.95)
  newInhabitant.sprite_index = sprTallPlantForegroundTwoFrames;
else if(percentFromLeft <= 1.0)
  newInhabitant.sprite_index = sprTallPlantForegroundStatic;

newInhabitant.image_index = irandom(8) % newInhabitant.image_number;
newInhabitant.image_speed = 4/room_speed;
return newInhabitant;

