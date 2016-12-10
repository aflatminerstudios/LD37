///scrGameOver(msg)

var msg = argument0;

score += objTimer.time;

show_message(msg + "\n You scored " + string(score) + " points!");

score = 0;

room_restart();
