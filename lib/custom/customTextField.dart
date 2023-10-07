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
  bool onlyNumber = false;

  bool needBorder = true;

  late Function onChange;
  bool isMultipleLine = false;
  String _default = "";
  String _hint = "";

  CustomTextField(Function func, {bool multipleLine = false, bool needLb = false, bool onlyNum = false, bool needBor = true, String labelTxt = "", bool needBg = true, int index=0, bool active=false, String defaultValue="", String hintStr="", double height=50, int maxLines=1, double radius=100, super.key}) {
    isActive = active;
    needBackground = needBg;
    _height = height;
    _maxLines = maxLines;
    _radius = radius;
    themeIndex = index;
    onChange = func;
    isMultipleLine = multipleLine;

    _default = defaultValue;
    _hint = hintStr;

    onlyNumber = onlyNum;

    needBorder = needBor;

    needLabel = needLb;
    labelText = labelTxt;
  }

  String getOnlyOneDot(String data) {
    String result = data.replaceAll(' ', '');
    if(data.split('.').length < 3 || (!onlyNumber && !needLabel)) return result;
    result = data.substring(data.indexOf('.') + 1);
    result = result.replaceAll('.', "");
    result = "${data.split('.')[0]}.$result";
    return result;
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
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      labelText,
                      style: TextStyle(
                          color: getThemeColor(themeIndex, 0),
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          height: 1
                      ),
                    ),
                  )
              ),
            )
        ),
        Container(
            height: _height,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
                borderRadius: needLabel ? BorderRadius.only(bottomLeft: Radius.circular(_radius), bottomRight: Radius.circular(_radius), topRight: Radius.circular(_radius)) : BorderRadius.circular(_radius),
                color: getThemeColor(themeIndex, needBackground ? 1 : 0),
                border: Border.all(color: getThemeColor(themeIndex, 0), width: needBorder ? 3 : 0)
            ),
            child: Focus(
              onFocusChange: (hasFocus) {
                if(!hasFocus) {
                  onChange(getOnlyOneDot(_default));
                }
              },
              child: TextFormField(
                initialValue: _default == "0" ? "" : _default,
                readOnly: !isActive,
                maxLines: _maxLines,
                keyboardType: onlyNumber || needLabel ? const TextInputType.numberWithOptions(decimal: true) : TextInputType.multiline,
                textInputAction: _maxLines > 10 ? TextInputAction.newline : TextInputAction.done,
                onChanged: (_) {
                  _default = _.toString();
                  if(isMultipleLine) {
                    onChange(_.toString());
                  }
                },
                inputFormatters: needLabel ? [
                  FilteringTextInputFormatter.deny(RegExp('[\$,A-Za-z]'))
                ] : [
                  FilteringTextInputFormatter.deny(RegExp('[\$,]')),
                ],
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: _hint,
                  hintStyle: TextStyle(
                    color: getThemeColor(themeIndex, needBackground ? 0 : 1),
                    fontWeight: FontWeight.bold,
                    height: 1,
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