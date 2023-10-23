import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:isma/config/define.dart';
import 'package:provider/provider.dart';

import '../mng/PageMng.dart';

class StepView extends StatelessWidget {
  StepView(int idx, int page, {super.key}) {
    log(idx.toString());
    colorIndex = idx;
    pageIndex = page;
  }

  int colorIndex = 0;
  final double padding = 15;
  int pageIndex = 0;

  Widget Dot(bool isShown) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: isShown ? 20 * sizeMng.defaultScale : 7 * sizeMng.defaultScale,
      height: 7 * sizeMng.defaultScale,
      decoration: BoxDecoration(
        color: isShown ? getThemeColor(colorIndex == 7 ? 1 : colorIndex, 0) : getThemeColor(colorIndex == 7 ? 1 : colorIndex, 3),
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }

  bool getChecked(int idx) {
    return pageIndex == idx;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30 * sizeMng.defaultScale,
      alignment: Alignment.center,
      child: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.zero,
          itemCount: context.watch<PageMng>().MAX_INDEX(colorIndex) + 1,
          itemBuilder: (BuildContext context, int index) {
            return Center(child: Container(margin: const EdgeInsets.symmetric(horizontal: 12), child: Dot(getChecked(index + 1)),));
          },
        ),
      ),
    );
  }
}