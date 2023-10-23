import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:isma/config/define.dart';

class CircleChart extends StatelessWidget {
  String title = "";
  String percent = "";
  int gram = 0;
  int weight = 0;
  CircleChart(String name, String per, int data, {super.key}) {
    title = name;
    percent = per.replaceAll(' ', '');
    weight = data;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45 * sizeMng.defaultScale,
      width: 150 * sizeMng.defaultScale,
      margin: EdgeInsets.symmetric(vertical: 5 * sizeMng.defaultScale),
      child: Row(
        children: [
          Container(
            width: 45 * sizeMng.defaultScale,
            height: 45 * sizeMng.defaultScale,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: getThemeColor(1, 0),
            ),
            alignment: Alignment.center,
            child: Transform.translate(
              offset: const Offset(0, 1),
              child: Text(
                percent.isEmpty ? "+" : "$percent%",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: sizeMng.defaultFontSize - 3,
                  fontWeight: FontWeight.bold,
                  color: getThemeColor(1, 1),
                ),
              ),
            )
          ),
          const Padding(padding: EdgeInsets.only(left: 7)),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: getThemeColor(1, 0).withOpacity(0.5),
                  fontWeight: FontWeight.bold,
                  fontSize: sizeMng.defaultFontSize - 4,
                ),
              ),
              Text(
                "${weight}g",
                style: TextStyle(
                  color: getThemeColor(1, 0),
                  fontWeight: FontWeight.bold,
                  fontSize: sizeMng.defaultFontSize - 2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

}