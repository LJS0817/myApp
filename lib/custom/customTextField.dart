
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:isma/config/define.dart';

class CustomTextField extends StatelessWidget {
  bool isActive = false;
  String labelText = "";
  int themeIndex = 0;

  double _height = 55;
  int _maxLines = 1;
  double _radius = 100;

  bool needBackground = true;
  bool needLabel = false;

  late Function onChange;
  bool isMultipleLine = false;
  String _default = "";

  TextEditingController controller = TextEditingController();

  CustomTextField(Function func, {bool multipleLine = false, bool needLb = false, String labelTxt = "", bool needBg = true, int index=0, bool active=false, String defaultValue="", String str="", double height=50, int maxLines=1, double radius=100, super.key}) {
    isActive = active;
    needBackground = needBg;
    _height = height;
    _maxLines = maxLines;
    _radius = radius;
    themeIndex = index;
    onChange = func;
    isMultipleLine = multipleLine;
    _default = defaultValue;
    controller.text = str;

    needLabel = needLb;
    labelText = labelTxt;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: needLabel,
          child: Transform.translate(
            offset: const Offset(0, 1),
            child: Container(
              height: 27,
              width: 90,
              padding: const EdgeInsets.only(left: 5),
              alignment: Alignment.bottomLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(_radius - 5), topLeft: Radius.circular(_radius - 5)),
                border: Border.all(color: getThemeColor(themeIndex, 0), width: 4),
                color: getThemeColor(themeIndex, 1),
              ),
              child: Text(
                labelText,
                style: TextStyle(
                  color: getThemeColor(themeIndex, 0),
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ),
          )
        ),
        Container(
          height: _height,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
              borderRadius: needLabel ? BorderRadius.only(bottomLeft: Radius.circular(_radius), bottomRight: Radius.circular(_radius), topRight: Radius.circular(_radius)) : BorderRadius.circular(_radius),
              color: getThemeColor(themeIndex, needBackground ? 1 : 0),
              border: Border.all(color: getThemeColor(themeIndex, 0), width: 3)
          ),
          child: Focus(
            onFocusChange: (hasFocus) {
              if(!hasFocus) {
                onChange(controller.text);
                FocusManager.instance.primaryFocus?.unfocus();
              } else {
              }
            },
            child: TextField(
              controller: controller,
              readOnly: !isActive,
              maxLines: _maxLines,
              keyboardType: needLabel ? const TextInputType.numberWithOptions(decimal: true) : TextInputType.multiline,
              textInputAction: _maxLines > 10 ? TextInputAction.newline : TextInputAction.done,
              onSubmitted: (_) => {
                if(_.toString().split('.').length > 1) {
                  log("ERROR"),
                } else {
                  onChange(_.toString()),
                  FocusScope.of(context).unfocus(),
                }
              },
              onChanged: (_) {
                if(isMultipleLine) {
                  onChange(_.toString());
                }
              },
              inputFormatters: needLabel ? [
                FilteringTextInputFormatter.deny(RegExp('[,A-Za-z]'))
              ] : [],
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: _default,
                hintStyle: TextStyle(
                  color: getThemeColor(themeIndex, needBackground ? 0 : 1),
                  fontWeight: FontWeight.bold,
                  height: _maxLines == 3 || _maxLines > 10 ? 1 : 0,
                ),
              ),
              style: TextStyle(
                color: getThemeColor(themeIndex, needBackground ? 0 : 1),
                fontWeight: FontWeight.bold,
                height: _maxLines == 3 || _maxLines > 10 ? 1 : 0,
              ),

            ),
          )
        ),
      ],
    );
  }
}