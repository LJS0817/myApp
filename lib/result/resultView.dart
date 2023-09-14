import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:isma/mng/Mng.dart';
import 'package:isma/result/bResultView.dart';
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
    Mng data = Provider.of<Mng>(context);
    if(data.selectData.type.index < 3) {
      return sResultView(themeIndex, leftPadding, oilBoxSize);
    } else {
      return bResultView(themeIndex, leftPadding, oilBoxSize);
    }
  }
}