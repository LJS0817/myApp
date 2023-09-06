import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:isma/custom/EditableOilContainer.dart';
import 'package:isma/custom/customTextArea.dart';
import 'package:isma/mng/DataMng.dart';
import 'package:isma/mng/PageMng.dart';
import 'package:provider/provider.dart';


class bSecondView extends StatelessWidget {
  const bSecondView({super.key});

  @override
  Widget build(BuildContext context) {
    DataMng dataMngProvider = Provider.of<DataMng>(context);
    PageMng pageMngProvider = Provider.of<PageMng>(context);
    return Expanded(
      child: Container(
        margin: EdgeInsets.zero,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          children: [
            const Text("data"),
            const Padding(padding: EdgeInsets.symmetric(vertical: 6)),
            Expanded(
                child: customTextArea(
                  dataMngProvider.getTypeIndex(),
                  0,
                  (str) { dataMngProvider.data.data[0][0] = str; },
                  (str) { dataMngProvider.setData(0, 0, str); },
                  data: dataMngProvider.getData(0, 0),)
            ),

            const Padding(padding: EdgeInsets.symmetric(vertical: 15)),

            const Text("tests"),
            const Padding(padding: EdgeInsets.symmetric(vertical: 6)),
            Expanded(
                child: customTextArea(
                  dataMngProvider.getTypeIndex(),
                  1,
                  (str) { dataMngProvider.data.data[0][1] = str; },
                  (str) { dataMngProvider.setData(0, 1, str); },
                  data: dataMngProvider.getData(0, 1),)
            ),
          ],
        ),
      ),
    );
  }
}