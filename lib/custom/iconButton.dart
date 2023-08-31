import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:isma/config/colors.dart';
import 'package:isma/config/define.dart';
import 'package:isma/mng/MenuMng.dart';
import 'package:provider/provider.dart';

class iconButton extends StatelessWidget {
  late String _src;
  late Function _func;
  late int _index;
  late double scale;

  iconButton(String s, int idx, Function f, {double size = 15}) {
    _src = s;
    _index = idx;
    _func = f;
    scale = size;
  }

  @override
  Widget build(BuildContext context) {
    MenuMng menu = Provider.of<MenuMng>(context);
    return AnimatedContainer(
        duration: const Duration(milliseconds: aniTime),
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: mainTheme[menu.getIndex()],
          borderRadius: BorderRadius.circular(500),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
              borderRadius: BorderRadius.circular(500),
              splashColor: mainTextColor[menu.getIndex()].withOpacity(0.2),
              highlightColor: mainTextColor[menu.getIndex()].withOpacity(0.5),
              onTap: () {
                _func();
                log(menu.getIndex().toString());
                //menu.Update();
              },
              child: Container(
                padding: EdgeInsets.all(scale),
                child: SvgPicture.asset(
                  _src,
                  width: scale,
                  height: scale,
                  color: menu.getIndex() == _index ? themeIconColors[menu.getIndex()] : themeIconColors[menu.getIndex() + 4],
                ),
              )
          ),
        )
    );
  }
}