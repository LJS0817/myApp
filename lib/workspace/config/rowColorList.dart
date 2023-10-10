import 'package:flutter/material.dart';
import 'package:isma/config/colors.dart';
import 'package:isma/workspace/config/colorPicker.dart';

class RowColorList extends StatelessWidget {
  RowColorList(int lColor, int rColor, {super.key}) {
    leftColor = lColor;
    rightColor = rColor;
  }

  int leftColor = 0;
  int rightColor = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          ColorPick(leftColor),
          const Padding(padding: EdgeInsets.only(right: 15)),
          ColorPick(rightColor),
        ],
      ),
    );
  }
}
