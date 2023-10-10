import 'package:flutter/material.dart';
import 'package:isma/config/colors.dart';

class ColorPick extends StatelessWidget {
  ColorPick(int color , {super.key}) {
    _colorIndex = color;
  }

  int _colorIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 65,
        child: Material(
          color: mainTheme[_colorIndex],
          child: InkWell(
            onTap: () {

            },
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                
              ),
              child: Text(
                "0",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
