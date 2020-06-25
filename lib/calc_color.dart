import 'dart:ui';

class CalcColor {

  static final int colorOffset = 40;

  static final Color background = _parseColor(255, 183, 183, 183);
  static final Color btnNumber = _parseColor(255, 241, 241, 241);
  static final Color btnEqual = _parseColor(255, 100, 158, 196);
  static final Color btnMemory = _parseColor(255, 183, 183, 183);
  static final Color btnOperation = _parseColor(255, 211, 211, 211);

  static Color _parseColor(int a, int r, int g, int b) {
    var parm = [a + colorOffset, r + colorOffset, g + colorOffset, b + colorOffset];
    for(int i = 0; i < parm.length; i++) {
      if(parm[i] < 0)
        parm[i] = 0;
      else if(parm[i] > 255)
        parm[i] = 255;
    }
    return Color.fromARGB(parm[0], parm[1], parm[2], parm[3]);
  }
}