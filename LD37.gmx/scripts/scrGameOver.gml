///scrGameOver(message)

var message = argument0;

score += objTimer.time;

with (objPersistentObject) {
  msg = message;
}

//show_message(msg + "\n You scored " + string(score) + " points!");

room_goto(roomGameOver);
