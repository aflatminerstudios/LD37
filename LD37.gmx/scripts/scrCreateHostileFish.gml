/// scrCreateHostileFish()

var newFishType = choose(objBettaFish, objVampireCrab);

// Only have one betta fish at a time. Should move this into a better spot
if(newFishType == objBettaFish && instance_number(objBettaFish) >= 1)
  return false; // Just exit out early. I don't trust "exit"
else if(newFishType == objVampireCrab && instance_number(objVampireCrab) >= 1)
  return false; // Just exit out early. I don't trust "exit" 


var possibleX = irandom_range(LEFTSIDEOFTANK, RIGHTSIDEOFTANK);
var possibleY = irandom_range(TOPOFTANK, BOTTOMOFTANK);
if(newFishType == objVampireCrab) {
  possibleX = irandom_range(LEFTSIDEOFTANK + 400, RIGHTSIDEOFTANK);
  possibleY = BOTTOMOFTANK - 166;
}

var newInhabitant = instance_create(possibleX, possibleY, newFishType);
if(scrIsInFrontOfFish(newInhabitant)) {
  // Abort the creation
  with(newInhabitant) {
    instance_destroy();
  }
} else {
  newInhabitant.waitingToAppear = true;
}
