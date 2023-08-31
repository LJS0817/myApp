import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:isma/config/Oil.dart';

class OilMng extends ChangeNotifier {
  SplayTreeMap<int, Oil> oils = SplayTreeMap<int, Oil>();
  SplayTreeMap<int, Oil> userOils = SplayTreeMap<int, Oil>();

  SplayTreeMap<int, Oil> markOils = SplayTreeMap<int, Oil>();
  SplayTreeMap<int, Oil> unMarkOils = SplayTreeMap<int, Oil>();
}