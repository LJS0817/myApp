import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:isma/config/colors.dart';
import 'package:isma/mng/Mng.dart';
import 'package:provider/provider.dart';

class ColorPick extends StatelessWidget {
  ColorPick(int color, String title, {super.key}) {
    _colorIndex = color;
    _title = title;
  }

  int _colorIndex = 0;
  String _title = "";

  @override
  Widget build(BuildContext context) {
    Mng mng = Provider.of<Mng>(context);
    return Expanded(
      child: SizedBox(
        height: 65,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              mng.changeTheme(_colorIndex);
            },
            child: Column(
              children: [
                Container(
                  height: 20,
                  width: double.maxFinite,
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FittedBox(
                        child: Text(
                          _title,
                          style: TextStyle(
                              color: themes[_colorIndex][1][0],
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Visibility(
                        visible: mng.containTheme(_colorIndex),
                        child: Container(
                          height: 16,
                          width: 16,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(color: themes[_colorIndex][1][0], width: 2),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          padding: const EdgeInsets.all(2),
                          alignment: Alignment.center,
                          child: Text(
                            mng.IndexOfTheme(_colorIndex).toString(),
                            style: TextStyle(
                                color: themes[_colorIndex][1][0],
                                fontWeight: FontWeight.bold,
                                fontSize: 11,
                                height: 1
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: themes[_colorIndex][0][0],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: themes[_colorIndex][1][0],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: themes[_colorIndex][2][0],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: themes[_colorIndex][3][0],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ),
        ),
      ),
    );
  }
}
