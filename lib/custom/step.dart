import 'package:flutter/material.dart';
import 'package:isma/config/define.dart';

class StepView extends StatelessWidget {
  StepView(int idx, int page, {super.key}) {
    colorIndex = idx;
    pageIndex = page;
  }

  int colorIndex = 0;
  final double padding = 15;
  int pageIndex = 0;

  Widget Dot(bool isShown) {
    return  Container(
      width: 7,
      height: 7,
      decoration: BoxDecoration(
        color: isShown ? getThemeColor(colorIndex, 3) : getThemeColor(colorIndex, 0),
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }

  bool getChecked(int idx) {
    return pageIndex <= idx;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Dot(getChecked(0)),
          Padding(padding: EdgeInsets.symmetric(horizontal: padding)),
          Dot(getChecked(1)),
          Padding(padding: EdgeInsets.symmetric(horizontal: padding)),
          Dot(getChecked(2)),
          Padding(padding: EdgeInsets.symmetric(horizontal: padding)),
          Dot(getChecked(3))
        ],
      ),
    );
  }
}