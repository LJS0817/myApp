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
        RowColorList(0 , 1),
        RowColorList(2 , 3),

        // ColorPick(Colors.black),
        // ColorPick(Colors.black),
        // ColorPick(Colors.black),
        // ColorPick(Colors.black),
      ],
    );
  }
}
