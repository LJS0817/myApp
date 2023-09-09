import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:isma/config/Oil.dart';
import 'package:isma/config/define.dart';

import 'DataMng.dart';

class Mng with ChangeNotifier {
  bool popUpActive = false;
  bool showChart = false;
  Data selectData = Data();

  double resultLye = 0;
  double resultWater = 0;
  List<double> resultFat = List.generate(FAT_TYPE.LENGTH.index, (index) => 0);

  static bool isLoad = false;

  void setData(Data data) {
    selectData = data;
  }

  void calculateData(Data data) {
    calculateLye(data);
    calculateFat(data);
    calculateWater(data);
  }

  void calculateLye(Data data) {
    resultLye = 0;
    for(int i = 0; i < data.data[0].length; i++) {
      int index = data.data[0].keys.elementAt(i);
      resultLye += (int.parse(data.data[0][index]!.split('`')[0]) * (data.type == TYPE.E_PASTE ? oilMng.oils[index]!.KOH : oilMng.oils[index]!.NaOH));
    }
    resultLye = (resultLye * int.parse(data.values[1]!.replaceAll(' ', ''))) / int.parse(data.values[0]!.replaceAll(' ', ''));
  }

  void calculateFat(Data data) {
    List<double> start = List.generate(FAT_TYPE.LENGTH.index, (index) => 0);
    for(int i = 0; i < data.data[0].length; i++) {
      int index = data.data[0].keys.elementAt(i);
      start = addDoubleList(start, mulDoubleList(oilMng.oils[index]!.fat, double.parse(data.data[0][index]!.split('`')[0]) * 0.01));
    }
    for(int i = 0; i < data.data[1].length; i++) {
      int index = data.data[1].keys.elementAt(i);
      start = addDoubleList(start, mulDoubleList(oilMng.oils[index]!.fat, double.parse(data.data[1][index]!.split('`')[0]) * 0.01));
    }
    resultFat = List.generate(FAT_TYPE.LENGTH.index, (index) => 0);
    int weight = data.weight[1] + data.weight[2];
    for(int i = 0; i < resultFat.length; i++) {
      resultFat[i] = ((start[i] / weight) * 100).roundToDouble();
      resultFat[i] = resultFat[i].toString() == "NaN" ? 0 : resultFat[i];
    }
  }

  ///index
  ///```
  ///0 - LYE PURITY
  ///1 - LYE COUNT
  ///2 - WATER
  ///3 - PURE SOAP
  ///4 - GLYCERINE
  ///5 - SUGAR
  ///6 - SOLVENT
  ///7 - ETHANOL
  ///8 ~ 11 - 수상층
  ///12 ~ 15 - 유상층
  ///16 ~ 19 - 유화제
  ///20 - 총용량
  String? getValue(int idx) {
    return (selectData.values[idx] == null || selectData.values[idx] == "") ? selectData.default_values[idx] : selectData.values[idx];
  }

  void calculateWater(Data data) {
    String? str = (data.values[2] == null || data.values[2] == "") ? data.default_values[2] : data.values[2];
    if(data.type == TYPE.E_COLD) {
      resultWater = ((double.parse(str!) * 0.01) * double.parse(data.weight[1].toString())).roundToDouble();
    } else if(data.type == TYPE.E_PASTE) {
      resultWater = (resultLye * 3).roundToDouble();
    } else {
      resultWater = (resultLye * 1.5).roundToDouble();
    }

  }

  List<double> mulDoubleList(List<double> a, double val) {
    List<double> result = [];
    for(int i = 0; i < a.length; i++) {
      result.add(a[i] * val);
    }
    return result;
  }

  List<double> addDoubleList(List<double> a, List<double> b) {
    List<double> result = [];
    for(int i = 0; i < a.length; i++) {
      result.add(a[i] + b[i]);
    }
    return result;
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
    calculateData(selectData);
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