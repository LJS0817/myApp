import 'package:flutter/material.dart';
import 'package:isma/config/define.dart';

class circleBorderBox extends StatelessWidget {
  String _title = "";
  String _data = "";
  int _index = 0;
  double _width = 70;

  circleBorderBox(String title, String data, int color, {double width = 70, super.key}) {
    _title = title;
    _data = data;
    _index = color;
    _width = width;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      decoration: BoxDecoration(
        color: getThemeColor(_index, 1).withOpacity(0.8),
        borderRadius: BorderRadius.circular(11),
        border: Border.all(width: 3, color: getThemeColor(_index, 0).withOpacity(0.7)),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 5,
            top: 5,
            child: Container(
              width: _width,
              height: 25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: getThemeColor(_index, 0).withOpacity(0.7),
              ),
              alignment: Alignment.center,
              child: Text (
                _title,
                style: TextStyle(
                  color: getThemeColor(_index, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ),
          ),
          Positioned(
            right: 10,
            bottom: 7,
            child: Text (
              _data,
              style: TextStyle(
                color: getThemeColor(_index, 0),
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
        ],
      )
    );
  }

}