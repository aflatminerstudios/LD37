/// scrCreatePlant()

var newPlantType = choose(objTallPlantForeground, objTallPlantForeground, 
                          objTallPlantBackground, objTallPlantBackground, objTallPlantBackground);

// Comment this in/out to control short plants in the game

newPlantType = choose(objTallPlantForeground, objTallPlantForeground, 
                      objTallPlantBackground, objTallPlantBackground,
                      objShortPlant1, objShortPlant2, objShortPlant3);

var possibleX = irandom_range(LEFTSIDEOFTANK + 75, RIGHTSIDEOFTANK - 75);
var possibleY = BOTTOMOFTANK + irandom(20);

var newInhabitant;
if(newPlantType == objTallPlantForeground)
  newInhabitant = scrCreateTallPlantForeground();
else if(newPlantType == objTallPlantBackground)
  newInhabitant = scrCreateTallPlantBackground();
else
  newInhabitant = instance_create(possibleX, possibleY, newPlantType);

if(scrIsInFrontOfFish(newInhabitant)) {
  // Abort the creation
  with(newInhabitant) {
    instance_destroy();
  }
} else {
  newInhabitant.waitingToAppear = true;
}
