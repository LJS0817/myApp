import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:isma/config/define.dart';
import 'package:isma/custom/OilDetailContainer.dart';
import 'package:isma/mng/FileMng.dart';
import 'package:isma/mng/OilMng.dart';
import 'package:provider/provider.dart';

class mainOilScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    OilMng oilMng = Provider.of<OilMng>(context);
    FileMng fileMng = Provider.of<FileMng>(context);

    return ScrollConfiguration(
      behavior: const ScrollBehavior().copyWith(overscroll: false),
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 10),
        itemCount: oilMng.length(),
        itemBuilder: (BuildContext context, int index) {
          if(index < oilMng.userOils.length) {
            return OilDetailContainer(index + oilMng.default_oils.length, oilMng.oils(index + oilMng.default_oils.length), fileMng.data[2].keys.elementAt(index));
          } else {
            return OilDetailContainer(index - oilMng.userOils.length, oilMng.oils(index - oilMng.userOils.length), "");
          }
        },
      ),
    );
  }
}