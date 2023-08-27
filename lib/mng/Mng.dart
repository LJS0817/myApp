import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:isma/config/define.dart';

class Mng with ChangeNotifier {
  bool popUpActive = false;
  bool showChart = false;
  Data selectData = Data();

  void setData(Data data) {
    selectData = data;
  }

  Data getData() {
    return selectData;
  }

  int getDataType() {
    return selectData.type.index;
  }

  void init() {
    popUpActive = false;
    showChart = false;
    selectData = Data();
  }

  void showResultView(Data data) {
    popUpActive = true;
    selectData = data;
    notifyListeners();
  }

  void hideResultView() {
    popUpActive = false;
    notifyListeners();
  }

  void clickChartResult() {
    showChart = !showChart;
    notifyListeners();
  }
}