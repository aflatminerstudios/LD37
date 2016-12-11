///scrSendHighScore(user, s)

var user = argument0;
var s = argument1;

var address = SERVER_ADDRESS + "fish_ahs.php?user=" + string(user) + "&score=" + string(s);



with (objHighScoreSend) {

  show_debug_message(address);
  get = http_get(address);
  show_debug_message("get = " + string(get));
}
