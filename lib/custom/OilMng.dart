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
      return userOils[key]!;
    }
  }

  SplayTreeMap<int, Oil> markOils = SplayTreeMap<int, Oil>();
  SplayTreeMap<int, Oil> unMarkOils = SplayTreeMap<int, Oil>();
}