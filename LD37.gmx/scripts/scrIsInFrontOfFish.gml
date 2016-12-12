///scrIsInFrontOfFish(instance)

var instance = argument0;

var rearViewWidth = 100;
var frontViewWidth = 800;
var topViewHeight = 600;
var bottomViewHeight = 600;

var goldfish = instance_find(objGoldfish, 0);

if (instance_exists(objGoldfish)) {
  if(goldfish.direction < 90 || goldfish.direction > 270) {
    // Right facing goldfish
    return scrIsInRect(instance, goldfish.x - rearViewWidth, goldfish.y - topViewHeight, goldfish.x + frontViewWidth, goldfish.y + bottomViewHeight)
  } else {
    // Left facing goldfish
    return scrIsInRect(instance, goldfish.x - frontViewWidth, goldfish.y - topViewHeight, goldfish.x + rearViewWidth, goldfish.y + bottomViewHeight);
  }
} else {
  return true;
}
