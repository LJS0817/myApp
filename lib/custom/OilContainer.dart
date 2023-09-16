import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../config/define.dart';
import '../mng/DataMng.dart';
import '../mng/PageMng.dart';

class OilContainer extends StatelessWidget {
  String title = "";
  int index = 0;


  OilContainer(int idx, String name, {super.key}) {
    title = name;
    index = idx;
  }

  @override
  Widget build(BuildContext context) {
    DataMng dataMngProvider = Provider.of<DataMng>(context);
    PageMng pageMngProvider = Provider.of<PageMng>(context);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2,),
      color: Colors.transparent,
      child: Material(
        color: getThemeColor(dataMngProvider.getTypeIndex(), 0),
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: () {
            if(dataMngProvider.getData(pageMngProvider.index - 1, index).isEmpty) {
              dataMngProvider.setData(pageMngProvider.index - 1, index, '0');
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
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: getThemeColor(dataMngProvider.getTypeIndex(), 1),
              ),
            ),
          ),
        ),
      ),
    );
  }

}