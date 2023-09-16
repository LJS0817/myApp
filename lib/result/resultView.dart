import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:isma/mng/Mng.dart';
import 'package:isma/result/bResultView.dart';
import 'package:isma/result/oResultView.dart';
import 'package:isma/result/sResultView.dart';
import 'package:provider/provider.dart';

class ResultView extends StatelessWidget {

  static const double leftPadding = 15;
  int themeIndex = 0;
  double oilBoxSize = 50;

  ResultView(int idx, {super.key}) {
    themeIndex = idx;
  }

  @override
  Widget build(BuildContext context) {
    if(themeIndex == 7) {
      return oResultView(themeIndex, leftPadding);
    } else if(themeIndex < 3) {
      return sResultView(themeIndex, leftPadding, oilBoxSize);
    } else {
      return bResultView(themeIndex, leftPadding, oilBoxSize);
    }
  }
}