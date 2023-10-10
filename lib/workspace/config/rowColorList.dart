import 'package:flutter/material.dart';
import 'package:isma/config/colors.dart';
import 'package:isma/workspace/config/colorPicker.dart';

class RowColorList extends StatelessWidget {
  RowColorList(int lColor, String lTitle, int rColor, String rTitle, {super.key}) {
    leftColor = lColor;
    rightColor = rColor;

    leftTitle = lTitle;
    rightTitle = rTitle;
  }

  int leftColor = 0;
  int rightColor = 0;

  String leftTitle = "";
  String rightTitle = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          ColorPick(leftColor, leftTitle),
          const Padding(padding: EdgeInsets.only(right: 15)),
          ColorPick(rightColor, rightTitle),
        ],
      ),
    );
  }
}
