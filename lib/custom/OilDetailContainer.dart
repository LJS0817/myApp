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
  String _path = "";


  OilDetailContainer(int idx, Oil oil, String path, {super.key}) {
    data = oil;
    title = data.getName();
    index = idx;
    _path = path;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
      color: Colors.transparent,
      child: Material(
        color: getThemeColor(_path.isNotEmpty ? 0 : 1, 0),
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: () {
            Provider.of<DataMng>(context, listen: false).setSelectedFileName(_path);
            Provider.of<Mng>(context, listen: false).showResultView(null, context, oil: data, idx: index);
          },
          splashColor: getThemeColor(_path.isNotEmpty ? 0 : 1, 1).withOpacity(0.5),
          highlightColor: getThemeColor(_path.isNotEmpty ? 0 : 1, 1).withOpacity(0.5),
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
                  color: getThemeColor(_path.isNotEmpty ? 0 : 1, 1),
                ),
                const Padding(padding: EdgeInsets.only(left: 15)),
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: getThemeColor(_path.isNotEmpty ? 0 : 1, 1),
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