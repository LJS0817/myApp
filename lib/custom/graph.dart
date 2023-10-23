import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:isma/config/define.dart';

class CustomChartBar extends StatelessWidget {
  int themeIndex = 0;
  int value = 0;
  int oilType = 0;
  bool lightMode = false;

  CustomChartBar(int idx, double val, int type, bool isLight, {super.key}) {
    themeIndex = idx;
    oilType = type;
    lightMode = isLight;
    value = val.round();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24 * sizeMng.defaultScale,
      height: 175 * sizeMng.defaultScale,
      padding: EdgeInsets.only(bottom: 10 * sizeMng.defaultScale),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: value * 0.01 * MediaQuery.of(context).size.height * 0.120 + 40,
            padding: const EdgeInsets.only(top: 8),
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: lightMode ? getThemeColor(themeIndex, 1) : getThemeColor(themeIndex, 0),
            ),
            child: RotatedBox(
              quarterTurns: 1,
              child: Text(
                "$value%",
                style: TextStyle(
                  color: lightMode ? getThemeColor(themeIndex, 0) : getThemeColor(themeIndex, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: sizeMng.defaultFontSize - 3,
                ),
              ),
            ),
          ),
          Container(
            width: 20 * sizeMng.defaultScale,
            height: 20 * sizeMng.defaultScale,
            padding: const EdgeInsets.only(top: 5),
            child: OverflowBox(
              maxWidth: 150 * sizeMng.defaultScale,
              maxHeight: 20 * sizeMng.defaultScale,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                alignment: Alignment.center,
                child: RotationTransition(
                  turns: const AlwaysStoppedAnimation(-36 / 360),
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      getOilTypeText(oilType),
                      overflow: TextOverflow.visible,
                      maxLines: 1,
                      style: TextStyle(
                        color: lightMode ? getThemeColor(themeIndex, 1) : getThemeColor(themeIndex, 0),
                        fontWeight: FontWeight.bold,
                        fontSize: sizeMng.defaultFontSize - 6,
                      ),
                    ),
                  )
                ),
              )
            )
          ),
        ],
      ),
    );
  }
}
