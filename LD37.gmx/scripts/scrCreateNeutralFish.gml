/// scrCreateNeutralFish()

var newFishType = choose(objTetra);

var possibleX = irandom_range(100, room_width - 100); // Update to actual tank dimensions! -- TODO
var possibleY = irandom_range(100, room_height - 300);

var newInhabitant = instance_create(possibleX, possibleY, newFishType);
if(scrIsInFrontOfFish(newInhabitant)) {
  // Abort the creation
  with(newInhabitant) {
    instance_destroy();
  }
} else {
  newInhabitant.waitingToAppear = true;
}
