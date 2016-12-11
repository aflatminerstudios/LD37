/// scrCreatePlant()

var newPlantType = choose(objTallPlantForeground, objTallPlantBackground);

var possibleX = irandom_range(275, room_width - 275); // Update to actual tank dimensions! -- TODO
var possibleY = room_height - 170 + irandom(20);

var newInhabitant = instance_create(possibleX, possibleY, newPlantType);
if(scrIsInFrontOfFish(newInhabitant)) {
  // Abort the creation
  with(newInhabitant) {
    instance_destroy();
  }
} else {
  newInhabitant.waitingToAppear = true;
}
