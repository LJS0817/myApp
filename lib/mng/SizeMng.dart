import 'dart:developer';

class SizeMng {
  static double _fontSize = 16;
  static double _scale = 1;
  static double _padding = 0;

  double get defaultFontSize => _fontSize;
  double get defaultScale => _scale;
  double get defaultPadding => _padding;

  static int _dpi = 0;

  void init(double ratio) {
    // log(ratio.toString());
    _dpi = (ratio * 10).toInt();
    setSize();
  }

  void setSize() {
    log(_dpi.toString());
    if(_dpi <= 26) {
      _fontSize = 16;
      _scale = 1;
      _padding = 0;
    } else if(_dpi <= 28) {
      _fontSize = 15;
      _scale = 0.9;
      _padding = -4;
    }else if(_dpi <= 30) {
      _fontSize = 14;
      _scale = 0.825;
      _padding = -8;
    } else {
      _fontSize = 12;
      _scale = 0.8;
      _padding = -12;
    }
  }
}