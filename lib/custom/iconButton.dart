import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:isma/config/colors.dart';
import 'package:isma/config/define.dart';
import 'package:isma/mng/FileMng.dart';
import 'package:isma/mng/MenuMng.dart';
import 'package:provider/provider.dart';

class iconButton extends StatelessWidget {
  late String _src;
  late Function _func;
  late int _index;
  late double scale = 15;

  iconButton(String s, int idx, Function f, {double size = 15}) {
    _src = s;
    _index = idx;
    _func = f;
    scale = size;
  }

  @override
  Widget build(BuildContext context) {
    MenuMng menu = Provider.of<MenuMng>(context);
    return Expanded(
        child: AnimatedContainer(
            duration: const Duration(milliseconds: aniTime),
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(500),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                  borderRadius: BorderRadius.circular(500),
                  splashColor: mainTextColor[menu.getIndex()].withOpacity(0.2),
                  highlightColor: mainTextColor[menu.getIndex()].withOpacity(0.5),
                  onTap: () {
                    menu.init();
                    _func();
                  },
                  child: Container(
                    padding: EdgeInsets.all(scale),
                    child: SvgPicture.asset(
                      _src,
                      color: menu.getIndex() == _index ? themeIconColors[menu.getIndex()] : themeIconColors[menu.getIndex() + 4],
                    ),
                  )
              ),
            )
        ));
  }
}