///scrAwardAchievement(which)

var which = argument0;


with (objPersistentObject) {
  achievements[numAchievements] = which;
  numAchievements++;
}

var a = instance_create(175, 500, objAchievementToast);
a.which = which;
