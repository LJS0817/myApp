import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:isma/main/main_beauty.dart';
import 'package:isma/main/main_oil.dart';
import 'package:isma/main/main_setting.dart';
import 'package:isma/main/main_soap.dart';
import 'package:isma/mng/MenuMng.dart';
import 'package:provider/provider.dart';

class mainScreen extends StatelessWidget {
  const mainScreen({super.key});

  Widget defaultSetting(Widget widget, BuildContext context, int idx) {
    MenuMng menuMng = Provider.of<MenuMng>(context);
    return Positioned(
      child: widget,
      // replacement: IgnorePointer(ignoring: true, child: Container(color: Colors.transparent, ),),
      // visible: menuMng.compareIndex(idx),
    ).animate(target: menuMng.index == idx ? 1 : 0).slideX(duration: 240.milliseconds, begin: menuMng.index == idx ? 1 : -1, end: 0).fade(curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          defaultSetting(mainSoapScreen(), context, 0),
          defaultSetting(mainBeautyScreen(), context, 1),
          defaultSetting(mainOilScreen(), context, 2),
          defaultSetting(mainSettingScreen(), context, 3),
        ],
      ),
    );
  }
}
