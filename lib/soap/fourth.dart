import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:isma/custom/EditableOilContainer.dart';
import 'package:isma/custom/OilMng.dart';
import 'package:isma/mng/DataMng.dart';
import 'package:provider/provider.dart';

import '../config/define.dart';
import '../mng/PageMng.dart';

class FourthView extends StatelessWidget {
  const FourthView({super.key});

  @override
  Widget build(BuildContext context) {
    DataMng dataMngProvider = Provider.of<DataMng>(context);
    PageMng pageMngProvider = Provider.of<PageMng>(context);
    return Expanded(
      child: Container(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        child:  ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(overscroll: false),
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            itemCount: dataMngProvider.data.data[pageMngProvider.index - 1].length,
            itemBuilder: (BuildContext con, int idx) {
              return EditableOilContainer(dataMngProvider.data.data[pageMngProvider.index - 1].keys.elementAt(idx));
            },
          ),
        ),
      ),
    );
  }
}