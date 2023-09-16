import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:isma/config/define.dart';
import 'package:isma/custom/OilDetailContainer.dart';
import 'package:isma/mng/OilMng.dart';
import 'package:provider/provider.dart';

class mainOilScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    OilMng oilMng = Provider.of<OilMng>(context);

    return ScrollConfiguration(
      behavior: const ScrollBehavior().copyWith(overscroll: false),
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 10),
        itemCount: oilMng.length(),
        itemBuilder: (BuildContext context, int index) {
          return OilDetailContainer(index, oilMng.oils(index));
        },
      ),
    );
  }
}