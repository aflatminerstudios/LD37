///scrSendHighScore(user, s)

var user = argument0;
var s = argument1;
var hash = md5_string_utf8(string(user) + string(s) + "AFlatMinerSecuritySucks9836");

var f = objPersistentObject.flakes;
var t = (objPersistentObject.time * 1000) / room_speed;


var address = SERVER_ADDRESS + "fish_ahs.php?user=" + string(user) + "&score=" + string(s) + "&other=" + string(hash) + "&flakes=" + string(f) + "&time=" + string(t);



with (objHighScoreSend) {


  get = http_get(address);
//  show_debug_message("get = " + string(get));
}

var address2 = SERVER_ADDRESS + "fish_cap.php?user=" + string(user);

with (objAchievementFinder) {
  show_debug_message(address2);
  get = http_get(address2);
}
