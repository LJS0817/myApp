class SizeMng {
  static double _fontSize = 16;
  static double _scale = 1;
  static double _padding = 0;

  double get defaultFontSize => _fontSize;
  double get defaultScale => _scale;
  double get defaultPadding => _padding;

  static double _dpi = 0;

  void init(double ratio) {
    _dpi = ratio.toInt() * 160;
    setSize();
  }

  void setSize() {
    switch(_dpi) {
      case 160:
        _fontSize = 20;
        _scale = 1.4;
        _padding = 6;
        break;
      case 240:
        _fontSize = 18;
        _scale = 1.2;
        _padding = 3;
        break;
      case 320:
        _fontSize = 16;
        _scale = 1;
        _padding = 0;
        break;
      case 480:
        _fontSize = 13;
        _scale = 0.75;
        _padding = -12;
        break;
      case 640:
        _fontSize = 12;
        _scale = 0.5;
        _padding = -25;
        break;
      default:
        _fontSize = 16;
        _scale = 1;
        _padding = 0;
        break;
    }
  }
}