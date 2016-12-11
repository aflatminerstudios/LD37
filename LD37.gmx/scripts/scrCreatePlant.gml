/// scrCreatePlant()

var newPlantType = choose(objTallRibbonPlant, objTallRibbonPlant, objShortRibbonPlant);

var possibleX = irandom_range(0, room_width); // Update to actual tank dimensions! -- TODO
var possibleY = room_height - 200 + irandom(40);

var newInhabitant = instance_create(possibleX, possibleY, newPlantType);
if(scrIsInFrontOfFish(newInhabitant)) {
  // Abort the creation
  with(newInhabitant) {
    instance_destroy();
  }
} else {
  newInhabitant.waitingToAppear = true;
}
