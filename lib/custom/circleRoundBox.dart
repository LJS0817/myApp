import 'package:flutter/material.dart';
import 'package:isma/config/define.dart';

class circleRoundBox extends StatelessWidget {
  String _title = "";
  String _data = "";
  int _index = 0;
  circleRoundBox(String title, String data, int color, {super.key}) {
    _title = title;
    _data = data;
    _index = color;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      decoration: BoxDecoration(
        color: getThemeColor(_index, 0).withOpacity(0.8),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 5,
            top: 5,
            child: Container(
              width: 50,
              height: 30,
              padding: const EdgeInsets.symmetric(horizontal: 7),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: getThemeColor(_index, 1),
              ),
              alignment: Alignment.center,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text (
                  _title,
                  style: TextStyle(
                    color: getThemeColor(_index, 0),
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              )
            ),
          ),
          Positioned(
            right: 10,
            bottom: 7,
            child: FittedBox(
              child: Text (
                _data,
                style: TextStyle(
                  color: getThemeColor(_index, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            )
          ),
        ],
      )
    );
  }

}