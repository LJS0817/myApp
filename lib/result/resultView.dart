import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:isma/config/define.dart';
import 'package:isma/mng/MenuMng.dart';
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

  Widget getResultView(bool b) {
    if(themeIndex == 7) {
      return oResultView(leftPadding);
    } else if(themeIndex < 3) {
      return sResultView(themeIndex, leftPadding, (oilBoxSize - (b ? 20 : 0)) * sizeMng.defaultScale );
    } else {
      return bResultView(themeIndex, leftPadding, (oilBoxSize - 20) * sizeMng.defaultScale,);
    }
  }

  @override
  Widget build(BuildContext context) {
    Mng data = Provider.of<Mng>(context);
    return Visibility(
      visible: data.popUpActive,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
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
              right: 20,
              left: 20,
              top: 0,
              bottom: 0,
              child: Center(
                child: getResultView(Provider.of<MenuMng>(context, listen: false).oilBoxSmallSize),
              ),
            )
          ],
        ),
      )
    );
  }
}