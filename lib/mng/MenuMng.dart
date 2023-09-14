import 'dart:developer';

import 'package:flutter/cupertino.dart';


class MenuMng with ChangeNotifier {
  int index = 0;
  bool isConfig = false;
  int showOilDetails = 0;

  void init() {
    showOilDetails = 0;
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