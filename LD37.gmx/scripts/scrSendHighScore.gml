///scrSendHighScore(user, s)

var user = argument0;
var s = argument1;
var hash = md5_string_utf8(string(user) + string(s) + "AFlatMinerSecuritySucks9836");

var f = objPersistentObject.flakes;
var t = (objPersistentObject.time * 1000) / room_speed;
var d = objPersistentObject.disappeared;
var o = objectPersistentObject.otherFlakes;

var address = SERVER_ADDRESS + "fish_ahs.php?user=" + string(user) + "&score=" + string(s) + "&other=" + string(hash) + "&flakes=" + string(f) + "&time=" + string(t) + "&dis=" + string(d) + "&oflakes=" + string(o);



with (objHighScoreSend) {


  get = http_get(address);
//  show_debug_message("get = " + string(get));
}

var address2 = SERVER_ADDRESS + "fish_cap.php?user=" + string(user);

with (objAchievementFinder) {
  show_debug_message(address2);
  get = http_get(address2);
}

with (objPersistentObject) {
  for (i = 0; i < array_length_1d(achievements); i++) {
    scrSendAchieve(achievements[i], objTextInput.text);
  }
}
with (objGameOverControl) {
  alarm[1] = room_speed;
}
