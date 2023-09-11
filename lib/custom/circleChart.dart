import 'package:flutter/material.dart';
import 'package:isma/config/define.dart';

class CircleChart extends StatelessWidget {
  int index = 0;
  String title = "";
  int percent = 0;
  int gram = 0;
  CircleChart(int color, String name, int per, {super.key}) {
    index = color;
    title = name;
    percent = per;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 100,
      child: Column(
        children: [
          Container(
            height: 30,
            alignment: Alignment.center,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: getThemeColor(index, 0).withOpacity(0.6),
                fontWeight: FontWeight.bold,
                fontSize: 11,
              ),
            ),
          ),
          Container(
            width: 47,
            height: 47,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: getThemeColor(index, 3).withOpacity(0.3),
            ),
            alignment: Alignment.center,
            child: Transform.translate(
              offset: const Offset(0, 1),
              child: Text(
                "$percent%",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: getThemeColor(index, 0),
                ),
              ),
            )
          ),
          const Padding(padding: EdgeInsets.only(bottom: 5)),
          Text(
            "1000000g",
            style: TextStyle(
              color: getThemeColor(index, 0),
              fontWeight: FontWeight.bold,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }

}