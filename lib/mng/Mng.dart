import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:isma/config/Oil.dart';
import 'package:isma/config/define.dart';
import 'package:isma/mng/OilMng.dart';
import 'package:provider/provider.dart';

import 'DataMng.dart';

class Mng with ChangeNotifier {
  bool popUpActive = false;
  bool showChart = false;
  Data selectData = Data();
  late Oil? selectOil;
  int selectOilDataIndex = -1;

  double resultLye = 0;
  double resultWater = 0;
  List<double> resultFat = List.generate(FAT_TYPE.LENGTH.index, (index) => 0);
  List<int> themeColorIndex = [ 0, 1, 2, 3, 0 ];

  static int curThemeColorIndex = 0;

  ///```
  ///0 - PURE SOAP
  ///1 - SOLVENT
  ///2 - ETHANOL
  ///3 - GLYCERINE
  ///4 - SUGAR
  ///5 - SUGAR Water
  List<int> resultHot = List.generate(6, (index) => 0);

  static bool isLoad = false;

  void setData(Data data) {
    selectData = data;
  }

  int setThemeColor(String data) {
    List<String> s = data.replaceAll(' ', '').split(',');
    if(s.length > 3) {
      themeColorIndex[0] = int.parse(s[0]);
      themeColorIndex[1] = int.parse(s[1]);
      themeColorIndex[2] = int.parse(s[2]);
      themeColorIndex[3] = int.parse(s[3]);
    }
    return themeColorIndex[0];
  }

  void calculateData(Data data, BuildContext context) {
    calculateLye(data, context);
    calculateFat(data, context);
    calculateWater(data);
    if(data.type == TYPE.E_HOT) {
      calculateHotData(data);
    }
  }

  String getThemeSaveString() {
    return "${themeColorIndex[0]},${themeColorIndex[1]},${themeColorIndex[2]},${themeColorIndex[3]}";
  }

  void changePage(String str) {
    List<String> sList = str.split(',');
    if(sList.length < 3) {
      sList = [ '0' , '1', '2', '3' ];
    }
    if(themeColorIndex[0].toString() != sList[0] || themeColorIndex[1].toString() != sList[1] ||
        themeColorIndex[2].toString() != sList[2] || themeColorIndex[3].toString() != sList[3]) {
      themeColorIndex[0] = int.parse(sList[0]);
      themeColorIndex[1] = int.parse(sList[1]);
      themeColorIndex[2] = int.parse(sList[2]);
      themeColorIndex[3] = int.parse(sList[3]);
    }
    notifyListeners();
  }

  void changeTheme(int colorIdx) {
    themeColorIndex[themeColorIndex[4]] = colorIdx;
    themeColorIndex[4]++;
    if(themeColorIndex[4] > 3) {
      themeColorIndex[4] = 0;
    }
    notifyListeners();
  }

  int IndexOfTheme(int colorIdx) {
    if(themeColorIndex[0] == colorIdx) {
      return 1;
    } else if(themeColorIndex[1] == colorIdx) {
      return 2;
    } else if(themeColorIndex[2] == colorIdx) {
      return 3;
    } else if(themeColorIndex[3] == colorIdx) {
      return 4;
    } else {
      return -1;
    }
  }

  bool containTheme(int colorIdx) {
    return themeColorIndex[0] == colorIdx ||
        themeColorIndex[1] == colorIdx ||
        themeColorIndex[2] == colorIdx ||
        themeColorIndex[3] == colorIdx;
  }

  ///0 - PURE SOAP
  ///1 - SOLVENT
  ///2 - ETHANOL
  ///3 - GLYCERINE
  ///4 - SUGAR
  ///5 - SUGAR Water
  void calculateHotData(Data data) {
    resultHot = List.generate(6, (index) => 0);

    resultHot[0] = (resultLye + data.weight[1] + data.weight[2]).round();
    resultHot[1] = ((resultHot[0] * int.parse(data.values[6]!)) / int.parse(data.values[3]!)).round();

    resultHot[2] = (resultHot[0] * (int.parse(data.values[7]!) * 0.01)).round();

    resultHot[4] = ((resultHot[0] + resultHot[1]) * int.parse(data.values[5]!) * 0.01).round();

    //전체무게 = 비누무게 + 용제무게 + 설탕무게
    int weight = resultHot[0] + resultHot[1] + resultHot[4];
    resultHot[3] = ((int.parse(data.values[4]!) * 0.01) * weight).round();

    resultHot[5] = (resultHot[1] - resultHot[2] - resultHot[3] - resultWater).round();
  }

  void calculateLye(Data data, BuildContext context) {
    resultLye = 0;
    int lye = 0;
    for(int i = 0; i < data.data[0].length; i++) {
      int index = data.data[0].keys.elementAt(i);
      lye = (int.parse(data.data[0][index]!.split('`')[0]) * (data.type == TYPE.E_PASTE ? Provider.of<OilMng>(context!, listen: false).oils(index)!.KOH : Provider.of<OilMng>(context!, listen: false).oils(index)!.NaOH)).round();
      if(context != null) {
        String str = Provider.of<DataMng>(context, listen: false).data.data[0][index].toString();
        if(str.split('`').length > 2) {
          str = str.replaceAll(str.split('`')[2], lye.toString());
        }
        Provider.of<DataMng>(context, listen: false).data.data[0][index] = "$str`$lye";
      }
      resultLye += lye;
    }
    resultLye = (resultLye * int.parse(data.values[1]!.replaceAll(' ', ''))) / int.parse(data.values[0]!.replaceAll(' ', ''));
  }

  void calculateFat(Data data, BuildContext context) {
    List<double> start = List.generate(FAT_TYPE.LENGTH.index, (index) => 0);
    for(int i = 0; i < data.data[0].length; i++) {
      int index = data.data[0].keys.elementAt(i);
      start = addDoubleList(start, mulDoubleList(Provider.of<OilMng>(context!, listen: false).oils(index)!.fat, double.parse(data.data[0][index]!.split('`')[0]) * 0.01));
    }
    for(int i = 0; i < data.data[1].length; i++) {
      int index = data.data[1].keys.elementAt(i);
      start = addDoubleList(start, mulDoubleList(Provider.of<OilMng>(context!, listen: false).oils(index)!.fat, double.parse(data.data[1][index]!.split('`')[0]) * 0.01));
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

  void showResultView(Data? data, BuildContext context, {Oil? oil, int idx=-1}) {
    popUpActive = true;
    selectData = data ?? Data();
    selectOil = oil;
    selectOilDataIndex = idx;
    if(oil != null) {
      selectData.type = TYPE.E_ETC;
    }
    if(selectData.type.index < 3) {
      calculateData(selectData, context);
    }
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