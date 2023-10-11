import 'package:flutter/material.dart';
import 'package:isma/config/colors.dart';
import 'package:isma/mng/Mng.dart';
import 'package:isma/workspace/config/rowColorList.dart';
import 'package:provider/provider.dart';

class ThemeChanger extends StatelessWidget {
  const ThemeChanger({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate((themes.length / 2).round(), (index) {
          return RowColorList((index * 2), (index * 2) + 1);
        }
      ),
    );
  }
}
