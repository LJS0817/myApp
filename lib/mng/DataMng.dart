import 'dart:developer';
import 'package:flutter/material.dart';

import 'package:isma/config/define.dart';

class CardData {
  CardData(int idx, double wei) {
    index = idx;
    weight = wei;
  }

  ///0 ~ 3까지,
  ///```
  ///0 - 오일(비누) or 수상층(화장품),
  ///1 - 슈퍼팻(비누) or 유상층(화장품),
  ///2 - 첨가물(비누) or 유화제(화장품),
  ///3(화장품만) - EO
  int type = 0;

  int index = -1;
  double weight = 0;

  @override
  String toString() {
    return "$index,$weight,$type";
  }
}


class Data {
  Data({String nameStr="", String dateStr="", TYPE t=TYPE.E_COLD, int w=1000}) {
    type = t;
    name = nameStr;
    date = dateStr;
    weight = w;
  }

  String name = "";
  String date = "";
  int weight = 1000;
  TYPE type = TYPE.E_COLD;

  Map<int, String> values = {};

  ///type으로 페이지 위치
  List<List<CardData>> data = [];

  String memo = "";

}

class DataMng with ChangeNotifier {

  Data data = Data();

  void initData() {
    data = Data();
  }

  void setName(String str) {
    data.name = str;
    notifyListeners();
  }

  void setType(TYPE t) {
    data.type = t;
    notifyListeners();
  }

  int getTypeIndex() {
    return data.type.index;
  }

  void addValue(String str, int idx) {
    data.values[idx] = str;
  }

  void addData(int idx, CardData d) {
    data.data[idx].add(d);
  }

  void setMemo(String str) {
    data.memo = str;
  }

  @override
  String toString() {
    return "${data.name},${data.name},${data.values},${data.data},${data.memo}";
  }
}


///[0] - 이름,
///[1] - 타입,
///[2] - 날짜,
///[3] - 무게,
Data parseData(String str) {
  List<String> strList = str.split(',');

  Data result = Data(nameStr: strList[0], dateStr: strList[2], t: parseTYPE(strList[1]), w: int.parse(strList[3]));

  return result;
}