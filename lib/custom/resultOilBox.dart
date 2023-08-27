import 'package:flutter/material.dart';
import 'package:isma/config/colors.dart';
import 'package:isma/config/define.dart';

class ResultOilBox extends StatelessWidget {
  String str = "";
  int themeIndex = 0;
  ResultOilBox(String d, int themeIdx, {super.key}) {
    str = d;
    themeIndex = themeIdx;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 85,
      height: 70,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: getThemeColor(themeIndex, 1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        str,
        textAlign: TextAlign.center,
        style: TextStyle(
          height: 1.5,
          color: getThemeColor(themeIndex, 0),
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

}