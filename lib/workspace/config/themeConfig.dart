import 'package:flutter/material.dart';
import 'package:isma/main/main_IndexScreen.dart';
import 'package:isma/workspace/config/colorPicker.dart';
import 'package:isma/workspace/config/rowColorList.dart';

import '../../config/colors.dart';

class ThemeChanger extends StatelessWidget {
  const ThemeChanger({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RowColorList(0 , "차가운 얼음", 1, "여름의 숲"),
        RowColorList(2 , "보라색 하늘", 3, "산뜻한 불꽃"),

        // ColorPick(Colors.black),
        // ColorPick(Colors.black),
        // ColorPick(Colors.black),
        // ColorPick(Colors.black),
      ],
    );
  }
}
