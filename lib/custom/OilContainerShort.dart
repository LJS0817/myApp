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

  OilShortContainer(int idx, {super.key}) {
    title = oilMng.oils.values.elementAt(idx).korean;
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
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
          onTap: () {
            dataMngProvider.setData(pageMngProvider.index - 1, index, '-1');
          },
          splashColor: getThemeColor(dataMngProvider.getTypeIndex(), 0).withOpacity(0.5),
          highlightColor: getThemeColor(dataMngProvider.getTypeIndex(), 0).withOpacity(0.5),
          borderRadius: BorderRadius.circular(15),
          child: Container(
            height: 38,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                color: getThemeColor(dataMngProvider.getTypeIndex(), 0),
                width: 3,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: getThemeColor(dataMngProvider.getTypeIndex(), 0),
                  ),
                ),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 3)),
                Container(
                  height: 22,
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset(
                    'assets/icon/close.svg',
                    width: 20,
                    height: 20,
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