import 'dart:collection';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:isma/config/Oil.dart';

class OilMng extends ChangeNotifier {
  SplayTreeMap<int, Oil> default_oils = SplayTreeMap<int, Oil>();
  SplayTreeMap<int, Oil> userOils = SplayTreeMap<int, Oil>();

  SplayTreeMap<int, Oil> Udata = SplayTreeMap<int, Oil>();

  Oil oils([key]) {
    if(key < default_oils.length) {
      return default_oils[key]!;
    } else if(key < 100000) {
      return userOils[key]!;
    } else {
      return Udata[key - 100000]!;
    }
  }

  length() {
    return default_oils.length + userOils.length;
  }

  void syncUserData(List<String> list) {
    List<String> data = [];
    for(int i = 0; i < list.length; i++) {
      data = list[i].split(',');
      try {
        userOils[i + default_oils.length] = Oil(korean: data[0], english: data[1], NaOH: double.parse(data[2]), KOH: double.parse(data[3]), fat: [
          double.parse(data[4]),
          double.parse(data[5]),
          double.parse(data[6]),
          double.parse(data[7]),

          double.parse(data[8]),
          double.parse(data[9]),
          double.parse(data[10]),
          double.parse(data[11]),
          double.parse(data[12]),
        ]);
      } catch(e) {
        userOils[i + default_oils.length] = Oil(korean: data[1].replaceAll('*', ''), english: data[2], NaOH: double.parse(data[3]), KOH: double.parse(data[4]), fat: [
          double.parse(data[5]),
          double.parse(data[6]),
          double.parse(data[7]),
          double.parse(data[8]),

          double.parse(data[9]),
          double.parse(data[10]),
          double.parse(data[11]),
          double.parse(data[12]),
          double.parse(data[13]),
        ]);
      }
      // log(userOils[i].toString());
    }
    notifyListeners();
  }

  void removeOil(int index) {
    userOils.remove(index);
  }

  void addOil(Oil oil, {int idx=-1}) {
    userOils[idx == -1 ? default_oils.length + userOils.length : idx] = oil;
    notifyListeners();
  }

  void done() {
    notifyListeners();
  }
}