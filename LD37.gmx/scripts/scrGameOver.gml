///scrGameOver(message)

var message = argument0;

score += objTimer.time;

with (objAchievementTracker) {
  ///Check for 250 score
  if (!score250game) {
   if (score >= 250) {
      scrAwardAchievement("score250game");
      score250game = true;
    }
  }
}

with (objPersistentObject) {
  msg = message;
  time = objTimer.time;
  flakes = objGameControl.flakesCollected;
}

//show_message(msg + "\n You scored " + string(score) + " points!");

//Replace goldfish with dead goldfish
var d = instance_create(objGoldfish.x, objGoldfish.y, objDeadGoldfish);


with (objGoldfish) {
  instance_destroy();
}
