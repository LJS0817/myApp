import 'dart:developer';
import 'package:flutter/material.dart';

import 'package:isma/config/define.dart';

class Data {
  Data({String nameStr="", String dateStr="", TYPE t=TYPE.E_COLD, int w=0}) {
    type = t;
    name = nameStr;
    date = dateStr;
    weight[0] = w;
  }

  String name = "";
  String date = "";
  TYPE type = TYPE.E_COLD;

  ///0 - 총량
  ///1 - 오일
  ///2 - 슈퍼팻
  ///3 - 첨가물
  List<int> weight = [0, 0, 0, 0];

  Map<int, String> values = {};



  ///0 ~ 3까지,
  ///```
  ///0 - 오일(비누) or 수상층(화장품),
  ///1 - 슈퍼팻(비누) or 유상층(화장품),
  ///2 - 첨가물(비누) or 유화제(화장품),
  ///3(화장품만) - EO
  ///index, weight
  List<Map<int, int>> data = [
    {},
    {},
    {},
    {}
  ];

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

  void setWeight(int index, int weight) {
    data.weight[index] += weight;
    data.weight[0] += weight;
  }

  int getTypeIndex() {
    return data.type.index;
  }

  void setValue(String str, int idx) {
    data.values[idx] = str;
  }


  ///page : 0 ~ 3까지,
  ///```
  ///0 - 오일(비누) or 수상층(화장품),
  ///1 - 슈퍼팻(비누) or 유상층(화장품),
  ///2 - 첨가물(비누) or 유화제(화장품),
  ///3(화장품만) - EO
  void setData(int page, int idx, int weight) {
    if(weight < 0) {
      data.data[page].remove(idx);
    } else {
      data.data[page][idx] = weight;
    }
    notifyListeners();
  }

  void setMemo(String str) {
    data.memo = str;
  }

  @override
  String toString() {
    return "${data.name},${getTypeIndex()},${data.weight},${data.values},${data.data},${data.memo}";
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