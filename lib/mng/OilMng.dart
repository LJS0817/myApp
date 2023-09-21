import 'dart:collection';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:isma/config/Oil.dart';

class OilMng extends ChangeNotifier {
  SplayTreeMap<int, Oil> default_oils = SplayTreeMap<int, Oil>();
  SplayTreeMap<int, Oil> userOils = SplayTreeMap<int, Oil>();

  oils([key]) {
    if(key < default_oils.length) {
      return default_oils[key]!;
    } else {
      return userOils[key - default_oils.length]!;
    }
  }

  length() {
    return default_oils.length + userOils.length;
  }

  void syncUserData(List<String> list) {
    List<String> data = [];
    for(int i = 0; i < list.length; i++) {
      data = list[i].split(',');
      userOils[i] = Oil(korean: data[0], english: data[1], NaOH: double.parse(data[2]), KOH: double.parse(data[3]), fat: [
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
      log(userOils[i].toString());
    }
    notifyListeners();
  }

  void addOil(Oil oil) {
    userOils[userOils.length] = oil;
    notifyListeners();
  }

  void done() {
    notifyListeners();
  }
}