
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:isma/config/define.dart';
import 'package:isma/mng/Mng.dart';
import 'package:provider/provider.dart';

class CustomTextField extends StatelessWidget {
  bool isActive = false;
  String value = "";
  int themeIndex = 0;

  double _height = 55;
  int _maxLines = 1;
  double _radius = 100;

  bool needBackground = true;

  late Function onChange;

  CustomTextField(Function func, {bool needBg = true, int index=0, bool active=false, String str="", double height=50, int maxLines=1, double radius=100, super.key}) {
    isActive = active;
    needBackground = needBg;
    _height = height;
    _maxLines = maxLines;
    _radius = radius;
    themeIndex = index;
    onChange = func;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_radius),
        color: getThemeColor(themeIndex, needBackground ? 1 : 0),
        border: Border.all(color: getThemeColor(themeIndex, 0), width: 4)
      ),
      child: TextField(
        readOnly: !isActive,
        maxLines: _maxLines,
        textInputAction: TextInputAction.done,
        onSubmitted: (_) => {
          onChange(_.toString()),
          value = _.toString(),
          FocusScope.of(context).unfocus(),
        },
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
        style: TextStyle(
          color: getThemeColor(themeIndex, needBackground ? 0 : 1),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}