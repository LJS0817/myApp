import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:isma/config/define.dart';
import 'package:isma/mng/DataMng.dart';
import 'package:isma/mng/PageMng.dart';
import 'package:provider/provider.dart';

class customTextArea extends StatelessWidget {
  customTextArea(int theme, Function func, Function save, Function cal, {String data="", super.key}) {
    FocusManager.instance.primaryFocus?.unfocus();
    themeIndex = theme;
    _data = data;
    onChanged = func;
    saveData = save;
    calculateWeight = cal;
    _controller.text = getResult(data);
  }
  int themeIndex = 0;
  final TextEditingController _controller = TextEditingController();
  String _data = "";
  late Function onChanged;
  late Function saveData;
  late Function calculateWeight;
  int weight = 0;

  String getResult(String str) {
    if(str.isEmpty) return "";
    List<String> data = str.split('\n');
    String name = "";
    String gram = "";
    String result = "";
    weight = 0;
    for(int i = 0; i < data.length; i++) {
      try {
        name = data[i].substring(0, data[i].lastIndexOf(' '));
        gram = data[i].substring(data[i].lastIndexOf(' ') + 1).replaceAll(RegExp('[a-zA-Z%]'), '');
        result += '$name    -    ${gram}g\n';
        weight += int.parse(calculateWeight(gram));
      } catch(e) {
        log(e.toString());
        result += '[이름](공백)[용량] 순으로 입력해주세요.';
      }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 210,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            height: 170,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            margin: EdgeInsets.zero,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12), bottomLeft: Radius.circular(12)),
                color: getThemeColor(themeIndex, 1),
                border: Border.all(color: getThemeColor(themeIndex, 0), width: 4, strokeAlign: BorderSide.strokeAlignInside)
            ),
            child: Focus(
              onFocusChange: (hasFocus) {
                if(!hasFocus) {
                  saveData(_data);
                  _controller.text = getResult(_data);
                } else {
                  _controller.text = _data;
                }
              },
              child: TextField(
                controller: _controller,
                maxLines: 7,
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.newline,
                decoration: const InputDecoration(border: InputBorder.none, ),
                onChanged: (_) {
                  _data = _.toString();
                  onChanged(_data);
                },
                style: TextStyle(
                    color: getThemeColor(themeIndex, 0),
                    fontWeight: FontWeight.bold,
                    height: 1.3
                ),
              ),
            ),
          ),
          Container(
            height: 30,
            width: 200,
            alignment: AlignmentDirectional.centerEnd,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            margin: EdgeInsets.zero,
            decoration: BoxDecoration(
              color: getThemeColor(themeIndex, 0),
              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
            ),
            child: Text(
              "총량  -  ${weight}g",
              style: TextStyle(
                color: getThemeColor(themeIndex, 1),
                fontWeight: FontWeight.bold,
                fontSize: 16
              ),
            ),
          )
        ],
      ),
    );
  }

}