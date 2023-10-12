import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:isma/config/Oil.dart';

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
  bool isReturn = false;

  ///index
  ///```
  ///0 - 총량
  ///1 - 오일
  ///2 - 슈퍼팻
  ///3 - 첨가물
  ///4 - 유상층
  ///5 - EO(화장품)
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
  ///8 - 수상층
  ///9 - 유상층
  ///10 - 유화제
  final Map<int, String> default_values = {
    0 : "100",
    1 : "100",
    2 : "100",
    3 : "55",
    4 : "10",
    5 : "8",
    6 : "45",
    7 : "30",

    8 : "0",
    9 : "0",
    10 : "0",
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
  ///```
  ///8 - 수상층
  ///9 - 유상층
  ///10 - 유화제
  Map<int, String> values = {};



  ///0 ~ 3까지,
  ///```
  ///0 - 오일(비누) or 수상층(화장품),
  ///1 - 슈퍼팻(비누) or 첨가물(화장품),
  ///2 - 첨가물(비누) or 유화제(화장품),
  ///3(화장품만) - 유상층
  ///4(화장품만) - EO
  List<Map<int, String>> data = [
    {},
    {},
    {},
    {},
    {}
  ];

  String memo = "";


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
  ///8 - 수상층
  ///9 - 유상층
  ///10 - 유화제
  String? getValue(int idx) {
    return (values[idx] == null || values[idx] == ""|| values[idx] == "null") ? default_values[idx] : values[idx];
  }

  @override
  String toString() {
    return "$name?${isReturn ? "-" : ""}${type.index}?$date?$weight?$values?$data?$memo?${skinType.index}";
  }
}

class DataMng with ChangeNotifier {

  Data data = Data();
  Oil? _oil;

  String selectFileName = "";

  void initData(int idx, [Oil? oil]) {
    data = Data();
    data.type = idx == 1 ? TYPE.E_SKIN : (idx == 2 ? TYPE.E_ETC : TYPE.E_COLD);
    _oil = null;
    if(idx == 1) {
      data.weight.add(0);
      data.weight.add(0);
    } else if(idx == 2) {
      _oil = oil ?? Oil(korean: "", english: "사용자 오일", NaOH: 0, KOH: 0, fat: List.generate(FAT_TYPE.LENGTH.index, (index) => 0));
    }
  }

  Oil? getOilData() {
    return _oil;
  }


  ///```
  ///0 - NaOH
  ///1 - KOH
  ///2 - Lauric
  ///3 - Myristic
  ///4 - Palmitic
  ///5 - Stearic
  ///6 - Palmitoleic,
  ///7 - Ricinoleic
  ///8 - Oleic
  ///9 - Linoleic
  ///10 - Linolenic
  void setOilData(int id, String str) {
    double d = str.isEmpty ? 0 : double.parse(str);
    switch(id) {
      case 0: _oil!.NaOH = d; break;
      case 1: _oil!.KOH = d; break;
      default: _oil!.fat[id - 2] = d; break;
    }
    notifyListeners();
  }

  void setOilName(String name) {
    _oil!.korean = name;
    notifyListeners();
  }

  void setSelectedFileName(String str) {
    selectFileName = str;
    notifyListeners();
  }

  String getSelectedFileName() {
    return selectFileName;
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

  void setWeight(int index, int weight, {bool needCal = true}) {
    data.weight[index] += weight;
    if(needCal) {
      data.weight[0] += weight;
    }
    notifyListeners();
  }

  void calculateBeautyWeight(String str) {
    data.weight[0] = int.parse(str);
    // data.weight[1] = (int.parse(getValue(8)!) * data.weight[0] * 0.01).round();
    // data.weight[2] = (int.parse(getValue(9)!) * data.weight[0] * 0.01).round();
    // data.weight[3] = (int.parse(getValue(10)!) * data.weight[0] * 0.01).round();
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
  ///```
  ///8 - 수상층
  ///9 - 유상층
  ///10 - 유화제
  ///11 - 총용량
  void setValue(String str, int idx) {
    data.values[idx] = str;
    notifyListeners();
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
  ///8 - 수상층
  ///9 - 유상층
  ///10 - 유화제
  ///11 - 총용량
  String? getValue(int idx) {
    return data.getValue(idx);
  }

  void setSoapType() {
    data.isReturn = !data.isReturn;
    notifyListeners();
  }


  ///page : 0 ~ 3까지,
  ///```
  ///0 - 오일(비누) or 수상층(화장품),
  ///1 - 슈퍼팻(비누) or 유상층(화장품),
  ///2 - 첨가물(비누) or 유화제(화장품),
  ///3(화장품만) - EO
  ///4(화장품만) - 첨가물
  void setData(int page, int idx, String str, {bool needRefresh=false}) {
    if(str == '-2') {
      data.data[page][idx] = "0`";
    } else if(str == '-1') {
      data.data[page].remove(idx);
    } else {
      data.data[page][idx] = str;
    }
    if(needRefresh || str == '-1') {
      notifyListeners();
    }
  }

  ///page : 0 ~ 3까지,
  ///```
  ///0 - 오일(비누) or 수상층(화장품),
  ///1 - 슈퍼팻(비누) or 유상층(화장품),
  ///2 - 첨가물(비누) or 유화제(화장품),
  ///3(화장품만) - EO
  ///4(화장품만) - EO
  String getData(int page, int idx) {
    String result = data.data[page][idx] ?? "";
    return result;
  }

  void setMemo(String str) {
    data.memo = str;
  }

  void setDefaultData() {
    if(data.type == TYPE.E_ETC) return;
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
    if(_oil == null) {
      return "${data.name}?${data.isReturn ? "-" : ""}${getTypeIndex()}?${data.date}?${data.weight}?${data.values.toString().replaceAll(' ', '')}?${data.data}?${data.memo.replaceAll('\n', '|')}?${data.skinType.index}";
    } else {
      return _oil.toString();
    }
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

List<String> checkOverFlow(List<String> d, int maxIndex) {
  List<String> result = [];
  if(maxIndex == d.length) return d;
  result = d;
  try {
    int.parse(d[1].replaceAll('-', ''));
  } catch (e) {
    result[0] = "${result[0]}@ ${result[1]}";
    result.removeAt(1);
  }

  try {
    d[2].split(':')[2].replaceAll(" ", "").replaceAll("g", '').replaceAll('`', '');
  } catch (e) {
    result[2] = "${d[2]}, ${d[3]}";
    result.removeAt(3);
  }

  return result;
}


///배열 내 구분은 @
///```
///[0] - 이름,
///[1] - 타입,
///[2] - 날짜,
///[3] - 무게,
Data parseData(String str) {
  List<String> strList = str.split('?');

  // Data result = Data(nameStr: strList[0], t: parseTYPE(strList[1]), dateStr: strList[2]);
  Data result = Data();
  if(!str.contains('nul')) {
    result.name = strList[0];
    result.date = strList[2];
    result.type = parseTYPE(strList[1].replaceAll('-', ''));
    result.isReturn = strList[1].contains('-');

    result.skinType = parseSKINTYPE(strList[7]);
    result.weight = json.decode(strList[3]).cast<int>().toList();
    result.values = parseString(strList[4]);

    List<String> dataList = strList[5].replaceAll('[', '').replaceAll(']', '').replaceAll(' ', '').replaceAll('},', '}@').split('@');
    result.data[0] = parseString(dataList[0]);
    result.data[1] = parseString(dataList[1]);
    result.data[2] = parseString(dataList[2]);
    result.data[3] = parseString(dataList[3]);
    if(result.type.index > 2) {
      result.data[4] = parseString(dataList[4]);
    }

    result.memo = strList[6].replaceAll('|', '\n');
  } else {
    List<String> newLineList = str.split('\n');
    strList = newLineList[0].split(',');

    strList = checkOverFlow(strList, 29);

    result.name = strList[0];
    result.date = strList[1];
    result.type = parseTYPE(strList[3]);
    result.weight[0] = int.parse(strList[8].replaceAll('g', ''));
    result.values[0] = getValue(0, strList[4], result)!;
    result.values[1] = getValue(1, strList[5], result)!;
    result.values[2] = getValue(2, strList[6].split('%')[0], result)!;

    result.memo = strList.getRange(28, (strList.length - 1 == 28 ? 29 : strList.length - 1)).join(', ').replaceAll('|', '\n');

    strList = strList[2].split('|');
    for(int i = 0; i < strList.length && strList.toString() != "[]"; i++) {
      String name = strList[i].split(' [')[0];
      String data = strList[i].split(':')[1].replaceAll(" ", "").replaceAll("g", '').replaceAll('`', '');
      result.weight[3] += int.parse(data);
      result.data[2][-i - 2] = '$data`$name';
    }

    strList = newLineList[2].split('`');
    for(int i = 0; i < strList.length && strList.toString() != "[]"; i++) {
      List<String> str = strList[i].split(',');
      result.data[0][int.parse(str[2])] = '${str[3].replaceAll('g', '')}`${str[1]}`${str[4]}';
      result.weight[1] += int.parse(str[3].replaceAll('g', ''));
    }

    strList = newLineList[3].split('`');
    for(int i = 0; i < strList.length && strList.toString() != "[]"; i++) {
      List<String> str = strList[i].split(',');
      result.data[1][int.parse(str[2])] = '${str[3].replaceAll('g', '')}`${str[1]}';
      result.weight[2] += int.parse(str[3].replaceAll('g', ''));
    }

    strList = newLineList[5].replaceAll(',', '\$').split('\$');
    List<String> hotData = [];
    for(int i = 0; i < strList.length - 2 && strList.toString() != "[]"; i++) {
      if(i == 2) continue;
      String str = strList[i];
      str = str.replaceRange(str.indexOf('%'), null, '');
      if(i > 2) {
        str = str.replaceRange(0, str.indexOf('(') + 1, '');
      }
      hotData.add(str);
    }
    if(hotData.toString() != "[]") {
      result.values[3] = hotData[0];
      result.values[4] = hotData[3];
      result.values[5] = hotData[4];
      result.values[6] = hotData[1];
      result.values[7] = hotData[2];
    }

  }

  return result;
}

String? getValue(int idx, String target, Data d) {
  return (target == null || target == ""|| target == "null") ? d.default_values[idx] : target;
}