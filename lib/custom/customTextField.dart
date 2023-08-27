
import 'package:flutter/material.dart';
import 'package:isma/config/define.dart';
import 'package:isma/mng/Mng.dart';
import 'package:provider/provider.dart';

class CustomTextField extends StatelessWidget {
  bool isActive = false;
  TextEditingController controller = TextEditingController();
  String value = "";
  int themeIndex = 0;

  double _height = 55;
  int _maxLines = 1;
  double _radius = 100;

  CustomTextField({int index=0, bool active=false, String str="", double height=55, int maxLines=1, double radius=100, super.key}) {
    isActive = active;
    _height = height;
    _maxLines = maxLines;
    _radius = radius;
    themeIndex = index;
    controller = TextEditingController();
    controller.text = str;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height,
      margin: const EdgeInsets.only(left: 15, right: 15),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(_radius),
          color: getThemeColor(themeIndex, 1),
          border: Border.all(color: getThemeColor(themeIndex, 0), width: 4)
      ),
      child: TextField(
        readOnly: !isActive,
        controller: controller,
        maxLines: _maxLines,
        textInputAction: TextInputAction.done,
        onSubmitted: (_) => {
          FocusScope.of(context).unfocus(),
        },
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),

        style: TextStyle(
          color: getThemeColor(themeIndex, 0),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}