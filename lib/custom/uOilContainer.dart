import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:isma/mng/OilMng.dart';
import 'package:provider/provider.dart';

import '../config/define.dart';
import '../mng/DataMng.dart';
import '../mng/PageMng.dart';

class uOilContainer extends StatelessWidget {
  int index = 0;


  uOilContainer(int idx, {super.key}) {
    index = idx;
  }

  @override
  Widget build(BuildContext context) {
    DataMng dataMngProvider = Provider.of<DataMng>(context);
    PageMng pageMngProvider = Provider.of<PageMng>(context);
    OilMng oilMng = Provider.of<OilMng>(context);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2,),
      color: Colors.transparent,
      child: Material(
        color: getThemeColor(dataMngProvider.getTypeIndex(), 0),
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: () {
            if(dataMngProvider.getData(pageMngProvider.index - 1, index).isEmpty) {
              dataMngProvider.setData(pageMngProvider.index - 1, index, '0`${oilMng.oils(index).korean}');
            }
          },
          splashColor: getThemeColor(dataMngProvider.getTypeIndex(), 1).withOpacity(0.5),
          highlightColor: getThemeColor(dataMngProvider.getTypeIndex(), 1).withOpacity(0.5),
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 38,
            width: double.maxFinite,
            color: Colors.transparent,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              oilMng.oils(index).english,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
                color: getThemeColor(dataMngProvider.getTypeIndex(), 1),
              ),
            ),
          ),
        ),
      ),
    );
  }

}