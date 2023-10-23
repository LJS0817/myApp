import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../config/define.dart';
import '../mng/DataMng.dart';
import '../mng/PageMng.dart';

class OilShortContainer extends StatelessWidget {
  String title = "";
  int index = 0;

  OilShortContainer(int idx, String name, {super.key}) {
    title = name;
    index = idx;
  }

  @override
  Widget build(BuildContext context) {
    DataMng dataMngProvider = Provider.of<DataMng>(context);
    PageMng pageMngProvider = Provider.of<PageMng>(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 4),
      color: Colors.transparent,
      child: Material(
        color: getThemeColor(dataMngProvider.getTypeIndex(), 1),
        borderRadius: BorderRadius.circular(15 * sizeMng.defaultScale),
        child: InkWell(
          onTap: () {
            dataMngProvider.setWeight(pageMngProvider.index, -int.parse(dataMngProvider.getData(pageMngProvider.index - 1, index).split('`')[0]));
            dataMngProvider.setData(pageMngProvider.index - 1, index, '-1', needRefresh: true);
            pageMngProvider.UpdateText(dataMngProvider.data, re: true);
          },
          splashColor: getThemeColor(dataMngProvider.getTypeIndex(), 0).withOpacity(0.5),
          highlightColor: getThemeColor(dataMngProvider.getTypeIndex(), 0).withOpacity(0.5),
          borderRadius: BorderRadius.circular(15 * sizeMng.defaultScale),
          child: Container(
            height: 38 * sizeMng.defaultScale,
            padding: EdgeInsets.symmetric(horizontal: 10 * sizeMng.defaultScale),
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                color: getThemeColor(dataMngProvider.getTypeIndex(), 0),
                width: 3 * sizeMng.defaultScale,
              ),
              borderRadius: BorderRadius.circular(15 * sizeMng.defaultScale),
            ),
            child: Row(
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: getThemeColor(dataMngProvider.getTypeIndex(), 0),
                    fontSize: sizeMng.defaultFontSize - 1,
                  ),
                ),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 3)),
                Container(
                  height: 22 * sizeMng.defaultScale,
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset(
                    'assets/icon/close.svg',
                    width: 20 * sizeMng.defaultScale,
                    height: 20 * sizeMng.defaultScale,
                    fit: BoxFit.fitHeight,
                    color: getThemeColor(dataMngProvider.getTypeIndex(), 0),
                  ),
                ),

              ],
            )
          ),
        ),
      ),
    );
  }

}