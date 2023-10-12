import 'dart:developer';

import 'package:flutter/cupertino.dart';


class MenuMng with ChangeNotifier {
  int index = 0;
  bool isConfig = false;
  int showOilDetails = 0;
  bool showOilPopup = false;
  bool oilBoxSmallSize = false;

  void init() {
    showOilDetails = 0;
    showOilPopup = false;
    isConfig = false;
  }

  void sizeChanged(bool b) {
    oilBoxSmallSize = b;
  }

  void showOilResult() {
    showOilPopup = !showOilPopup;
    notifyListeners();
  }

  void setOilDetails(int b) {
    showOilDetails = b;
    notifyListeners();
  }

  void setIndex(int idx) {
    index = idx;
    if(idx == 3) {
      isConfig = true;
    } else if(isConfig) {
      isConfig = false;
    }
    notifyListeners();
  }

  int getIndex() {
    return index;
  }
}