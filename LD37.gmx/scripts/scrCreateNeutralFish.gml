/// scrCreateNeutralFish()

var newFishType = choose(objTetra, objTetra, objShrimp, objShrimp, objSuckerFish);
// Only have one suckerfish at a time. Should move this into a better spot
if(newFishType == objSuckerFish && instance_number(objSuckerFish) >= 1)
  return false; // Just exit out early. I don't trust "exit"

var possibleX = irandom_range(LEFTSIDEOFTANK, RIGHTSIDEOFTANK); // Update to actual tank dimensions! -- TODO
var possibleY = irandom_range(TOPOFTANK, BOTTOMOFTANK);

if(newFishType == objShrimp)
  possibleY = BOTTOMOFTANK;
else if(newFishType == objSuckerFish)
  possibleY = lerp(TOPOFTANK, BOTTOMOFTANK, random_range(0, 0.23));

var newInhabitant = instance_create(possibleX, possibleY, newFishType);
if(scrIsInFrontOfFish(newInhabitant)) {
  // Abort the creation
  with(newInhabitant) {
    instance_destroy();
  }
} else {
  newInhabitant.waitingToAppear = true;
}
