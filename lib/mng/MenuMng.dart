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
    notifyListeners();
  }

  int getIndex() {
    return index;
  }
}