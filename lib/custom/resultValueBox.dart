
import 'package:flutter/material.dart';
import 'package:isma/config/define.dart';

class ResultValueBox extends StatelessWidget {

  int themeIndex = 0;
  String title = "";
  String value = "";

  ResultValueBox(int idx, String t, String v, {super.key}) {
    themeIndex = idx;
    title = t;
    value = v;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 110,
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: getThemeColor(themeIndex, 0),
          borderRadius: BorderRadius.circular(13),
        ),
        child: Column(
          children: [
            Container(
              height: 57,
              margin: const EdgeInsets.only(left: 7, right: 7, top: 7),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                color: getThemeColor(themeIndex, 1),
              ),
              child: FittedBox(
                child: Text(
                  value,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: getThemeColor(themeIndex, 0),
                  ),
                ),
              )
            ),
            Container(
              height: 43,
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              alignment: Alignment.center,
              child: FittedBox(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: getThemeColor(themeIndex, 1),
                  ),
                ),
              )
            ),
          ],
        ),
      )
    );
  }

}