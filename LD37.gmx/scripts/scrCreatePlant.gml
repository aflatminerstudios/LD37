/// scrCreatePlant()

var newPlantType = choose(objTallPlantForeground, objTallPlantBackground);

var possibleX = irandom_range(LEFTSIDEOFTANK + 75, RIGHTSIDEOFTANK - 75);
var possibleY = BOTTOMOFTANK + irandom(20);

var newInhabitant = instance_create(possibleX, possibleY, newPlantType);
if(scrIsInFrontOfFish(newInhabitant)) {
  // Abort the creation
  with(newInhabitant) {
    instance_destroy();
  }
} else {
  newInhabitant.waitingToAppear = true;
}
