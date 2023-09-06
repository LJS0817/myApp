import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:isma/config/define.dart';
import 'package:isma/mng/DataMng.dart';
import 'package:isma/mng/PageMng.dart';
import 'package:provider/provider.dart';

class customTextArea extends StatelessWidget {
  customTextArea(int theme, int idx, Function func, Function save, {String data="", super.key}) {
    themeIndex = theme;
    _data = data;
    onChanged = func;
    saveData = save;
    _controller.text = _data;
    index = idx;
  }
  int themeIndex = 0;
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  String _data = "";
  late Function onChanged;
  late Function saveData;
  int index = 0;

  Widget getResult(String str) {
    try {
      String name = str.substring(0, str.lastIndexOf(' '));
      String gram = str.substring(str.lastIndexOf(' ') + 1);

      return Container(
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: TextStyle(
                  color: getThemeColor(themeIndex, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 17
              ),
            ),
            Text(
              gram + ' G',
              style: TextStyle(
                  color: getThemeColor(themeIndex, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 17
              ),
            ),
          ],
        ),
      );
    } catch(e) {
      return Center(
        child: Text(
          "Try like this\n[name] (space) [amount]",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: getThemeColor(themeIndex, 1),
              fontWeight: FontWeight.bold,
              fontSize: 17,
          ),
        )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    PageMng pageMngProvider = Provider.of<PageMng>(context);
    return SizedBox(
      width: double.maxFinite,
      height: 150,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: getThemeColor(themeIndex, 1),
                  border: Border.all(color: getThemeColor(themeIndex, 0), width: 4)
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
              child: Focus(
                onFocusChange: (hasFocus) {
                  if(!hasFocus) {
                    log("TEST");
                    saveData(_data);
                  } else {
                    log("213ewadfasdf");
                  }
                },
                child: TextField(
                  focusNode: _focusNode,
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
                  ),
                ),
              ),
            )
          ),
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Visibility(
              visible: pageMngProvider.focusIndex != index,
              child: Material(
                color: getThemeColor(themeIndex, 0),
                borderRadius: BorderRadius.circular(13),
                child: InkWell(
                  borderRadius: BorderRadius.circular(13),
                  splashColor: getThemeColor(themeIndex, 1).withOpacity(0.4),
                  highlightColor: getThemeColor(themeIndex, 1).withOpacity(0.4),
                  onTap: () {
                    pageMngProvider.setFocusIndex(index);
                    FocusScope.of(context).requestFocus(_focusNode);
                  },
                  child: Container(
                    padding: EdgeInsets.zero,
                    margin: EdgeInsets.zero,
                    child: ScrollConfiguration(
                      behavior: const ScrollBehavior().copyWith(overscroll: false),
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        itemCount: _data.split('\n').length,
                        itemBuilder: (contxt, idx) {
                          return getResult(_data.split('\n')[idx]);
                        },
                      ),
                    )
                  ),
                ),
              )
            ),
          ),
        ],
      )
    );
  }

}