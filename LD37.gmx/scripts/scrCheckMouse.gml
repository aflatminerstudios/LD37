///scrCheckMouse()

if (mouse_check_button_pressed(mb_left)) {

  var dirToMove = point_direction(objGoldfish.x, objGoldfish.y, mouse_x, mouse_y);
  scrMoveGoldfish(dirToMove);
}
