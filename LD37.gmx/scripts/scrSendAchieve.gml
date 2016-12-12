///scrSendAchieve(which, user)

var which = argument0;
var user = argument1;

var hash = md5_string_utf8(string(user) + string(which) + "AFlatMinerSecuritySucks9836");

var address = SERVER_ADDRESS + "fish_sac.php?user=" + string(user) + "&which=" + string(which) + "&other=" + string(hash);

with (objAchievementFinder) {
  show_debug_message(address);
  get = http_get(address);
}

