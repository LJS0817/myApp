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

  Widget getResultView() {
    if(themeIndex == 7) {
      return oResultView(leftPadding);
    } else if(themeIndex < 3) {
      return sResultView(themeIndex, leftPadding, oilBoxSize);
    } else {
      return bResultView(themeIndex, leftPadding, oilBoxSize);
    }
  }

  @override
  Widget build(BuildContext context) {
    Mng data = Provider.of<Mng>(context);
    return Visibility(
      visible: data.popUpActive,
      child: Stack(
        children: [
          Positioned(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Material(
                color: Colors.black.withOpacity(0.6),
                child: InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    data.hideResultView();
                  },
                ),
              ),
            ),
          ),
          Positioned(
            child: Center(
              child: getResultView(),
            ),
          )
        ],
      ),
    );
  }
}