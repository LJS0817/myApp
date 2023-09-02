import 'dart:convert';
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
  SKINTYPE skinType = SKINTYPE.E_MINGAM;

  ///index
  ///```
  ///0 - 총량
  ///1 - 오일
  ///2 - 슈퍼팻
  ///3 - 첨가물
  List<int> weight = [0, 0, 0, 0];


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
  final Map<int, String> default_values = {
    0 : "100",
    1 : "100",
    2 : "100",
    3 : "55",
    4 : "10",
    5 : "8",
    6 : "45",
    7 : "30",

    8 : "100",
    9 : "70",
    10 : "85",
    11 : "80",

    12 : "0",
    13 : "30",
    14 : "15",
    15 : "40",

    16 : "0",
    17 : "3",
    18 : "2",
    19 : "5",

    20 : "0",
  };

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
  Map<int, String> values = {};



  ///0 ~ 3까지,
  ///```
  ///0 - 오일(비누) or 수상층(화장품),
  ///1 - 슈퍼팻(비누) or 유상층(화장품),
  ///2 - 첨가물(비누) or 유화제(화장품),
  ///3(화장품만) - EO
  ///index, weight
  List<Map<int, String>> data = [
    {},
    {},
    {},
    {}
  ];

  String memo = "";

}

class DataMng with ChangeNotifier {

  Data data = Data();

  void initData(bool isBeauty) {
    data = Data();
    data.type = isBeauty ? TYPE.E_SKIN : TYPE.E_COLD;
  }

  void setName(String str) {
    data.name = str;
    notifyListeners();
  }

  String getName() {
    return data.name.isEmpty ? "" : data.name;
  }

  void setType(TYPE t) {
    data.type = t;
    notifyListeners();
  }

  void setSkinType(SKINTYPE t) {
    data.skinType = t;
    notifyListeners();
  }

  void setWeight(int index, int weight) {
    data.weight[index] += weight;
    data.weight[0] += weight;
  }

  int getTypeIndex() {
    return data.type.index;
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
  ///20 - 총용량
  void setValue(String str, int idx) {
    data.values[idx] = str;
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
    return (data.values[idx] == null || data.values[idx] == "") ? data.default_values[idx] : data.values[idx];
  }


  ///page : 0 ~ 3까지,
  ///```
  ///0 - 오일(비누) or 수상층(화장품),
  ///1 - 슈퍼팻(비누) or 유상층(화장품),
  ///2 - 첨가물(비누) or 유화제(화장품),
  ///3(화장품만) - EO
  void setData(int page, int idx, String str) {
    if(str == '-2') {
      data.data[page][idx] = "0";
    } else if(str == '-1') {
      data.data[page].remove(idx);
    } else {
      data.data[page][idx] = str;
    }
    notifyListeners();
  }

  void setMemo(String str) {
    data.memo = str;
  }

  void saveData() {
    DateTime date = DateTime.now();
    data.date = date.toString().split(' ')[0];

    if(data.type == TYPE.E_COLD) {
      data.values[0] = (data.values[0] ?? data.default_values[0])!;
      data.values[1] = (data.values[1] ?? data.default_values[1])!;
      data.values[2] = (data.values[2] ?? data.default_values[2])!;
    } else if(data.type == TYPE.E_HOT) {
      data.values[0] = (data.values[0] ?? data.default_values[0])!;
      data.values[1] = (data.values[1] ?? data.default_values[1])!;
      data.values[3] = (data.values[3] ?? data.default_values[3])!;
      data.values[4] = (data.values[4] ?? data.default_values[4])!;
      data.values[5] = (data.values[5] ?? data.default_values[5])!;
      data.values[6] = (data.values[6] ?? data.default_values[6])!;
      data.values[7] = (data.values[7] ?? data.default_values[7])!;
    } else if(data.type == TYPE.E_PASTE) {
      data.values[0] = (data.values[0] ?? data.default_values[0])!;
      data.values[1] = (data.values[1] ?? data.default_values[1])!;
    }
  }

  @override
  String toString() {
    saveData();
    return "${data.name}?${getTypeIndex()}?${data.date}?${data.weight}?${data.values}?${data.data}?${data.memo}?${data.skinType.index}";
  }
}


Map<int, String> parseString(String str) {
  Map<int, String> result = {};

  str = str.replaceAll('{', '').replaceAll('}', '');
  List<String> valueList = str.split(',');
  for(int i = 0; i < valueList.length; i++) {
    try{
      result[int.parse(valueList[i].split(':')[0])] = valueList[i].split(':')[1];
    }catch(ex) {
      result = {};
    }
  }

  return result;
}

///데이터 구분은 ?
///배열 내 구분은 @
///[0] - 이름,
///[1] - 타입,
///[2] - 날짜,
///[3] - 무게,
Data parseData(String str) {
  List<String> strList = str.split('?');

  Data result = Data(nameStr: strList[0], t: parseTYPE(strList[1]), dateStr: strList[2]);
  result.skinType = parseSKINTYPE(strList[7]);
  result.weight = json.decode(strList[3]).cast<int>().toList();
  result.values = parseString(strList[4]);

  log(strList[5]);
  List<String> dataList = strList[5].replaceAll('[', '').replaceAll(']', '').replaceAll(' ', '').replaceAll('},', '}@').split('@');
  result.data[0] = parseString(dataList[0]);
  result.data[1] = parseString(dataList[1]);
  result.data[2] = parseString(dataList[2]);
  result.data[3] = parseString(dataList[3]);

  result.memo = strList[6];

  return result;
}