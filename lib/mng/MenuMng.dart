import 'dart:developer';

import 'package:flutter/cupertino.dart';


class MenuMng with ChangeNotifier {
  int index = 0;
  bool isConfig = false;

  void init() {
    index = 0;
    isConfig = false;
  }

  void setIndex(int idx) {
    index = idx;
    notifyListeners();
  }

  int getIndex() {
    return index;
  }
}