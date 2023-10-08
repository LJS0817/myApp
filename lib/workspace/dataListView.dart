import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:isma/custom/EditableOilContainer.dart';
import 'package:isma/mng/DataMng.dart';
import 'package:isma/mng/PageMng.dart';
import 'package:provider/provider.dart';

class DataListView extends StatelessWidget {
  int page = 0;

  DataListView(int pageId, {super.key}) {
    page = pageId - 1 < 0 ? 0 : pageId - 1;
  }

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
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            itemCount: dataMngProvider.data.data[page].length,
            itemBuilder: (BuildContext con, int idx) {
              return EditableOilContainer(dataMngProvider.data.data[page].keys.elementAt(idx), pageMngProvider.index);
            },
          ),
        ),
      ),
    );
  }

}