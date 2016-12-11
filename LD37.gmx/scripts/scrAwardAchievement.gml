///scrAwardAchievement(which)

var which = argument0;


with (objPersistentObject) {
  achievements[numAchievements] = which;
  numAchievements++;
}

if (objPermanentObject.achieves[? which] == false) {
  var a = instance_create(175, 500, objAchievementToast);
  a.which = which;
}

ds_map_replace(objPermanentObject.achieves, which, true);
