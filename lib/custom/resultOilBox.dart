import 'package:flutter/material.dart';
import 'package:isma/config/define.dart';
import 'package:isma/mng/MenuMng.dart';
import 'package:provider/provider.dart';

class ResultOilBox extends StatelessWidget {
  String str = "";
  int themeIndex = 0;
  int index = 0;
  double _width = 0;
  double _height = 0;
  ResultOilBox(String d, int themeIdx, int compare, {double w = 85,double h = 70, super.key}) {
    str = d;
    themeIndex = themeIdx;
    index = compare;
    _width = w;
    _height = h;
  }

  @override
  Widget build(BuildContext context) {
    MenuMng menuMng = Provider.of<MenuMng>(context);
    return Material(
      borderRadius: menuMng.showOilDetails < 1 ? BorderRadius.circular(20) : const BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
      color: getThemeColor(themeIndex, (index == menuMng.showOilDetails || menuMng.showOilDetails < 1 ? 1 : 3)),
      child: InkWell(
        onTap: () {
          menuMng.setOilDetails(index);
        },
        borderRadius: menuMng.showOilDetails < 1 ? BorderRadius.circular(20) : BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        splashColor: getThemeColor(themeIndex, 0).withOpacity(0.4),
        highlightColor: getThemeColor(themeIndex, 0).withOpacity(0.4),
        child: Container(
          width: _width,
          height: _height,
          alignment: Alignment.center,
          color: Colors.transparent,
          child: Text(
            str,
            textAlign: TextAlign.center,
            style: TextStyle(
              height: 1.5,
              color: getThemeColor(themeIndex, 0),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

}