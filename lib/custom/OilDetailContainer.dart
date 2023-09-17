import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:isma/config/Oil.dart';
import 'package:isma/mng/MenuMng.dart';
import 'package:isma/mng/Mng.dart';
import 'package:provider/provider.dart';

import '../config/define.dart';
import '../mng/DataMng.dart';
import '../mng/PageMng.dart';

class OilDetailContainer extends StatelessWidget {
  String title = "";
  int index = 0;
  late Oil data;


  OilDetailContainer(int idx, Oil oil, {super.key}) {
    data = oil;
    title = data.getName();
    index = idx;
  }

  @override
  Widget build(BuildContext context) {


    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
      color: Colors.transparent,
      child: Material(
        color: getThemeColor(-1, 0),
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: () {
            Provider.of<Mng>(context, listen: false).showResultView(null, context, oil: data);
          },
          splashColor: getThemeColor(-1, 1).withOpacity(0.5),
          highlightColor: getThemeColor(-1, 1).withOpacity(0.5),
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 38,
            width: double.maxFinite,
            color: Colors.transparent,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/icon/oil.svg',
                  width: 17,
                  height: 17,
                  color: getThemeColor(-1, 1),
                ),
                const Padding(padding: EdgeInsets.only(left: 15)),
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: getThemeColor(-1, 1),
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