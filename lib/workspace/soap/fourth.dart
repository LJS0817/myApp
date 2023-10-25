import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:isma/config/define.dart';
import 'package:isma/custom/customTextField.dart';
import 'package:isma/mng/DataMng.dart';
import 'package:isma/mng/PageMng.dart';
import 'package:isma/workspace/dataListView.dart';
import 'package:provider/provider.dart';


class FourthView extends StatelessWidget {
  const FourthView({super.key});

  @override
  Widget build(BuildContext context) {
    DataMng dataMngProvider = Provider.of<DataMng>(context);
    PageMng pageMngProvider = Provider.of<PageMng>(context);
    return Expanded(
      child: Column(
        children: [
          DataListView(pageMngProvider.index),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Focus(
              onFocusChange: (hasFocus) {
                if(!hasFocus) {

                }
              },
              child: CustomTextField(
                 (_) {
                  dataMngProvider.setMemo(_);
                },
                multipleLine: true,
                index: dataMngProvider.getTypeIndex(),
                needBg: true,
                active: true,
                maxLines: 12,
                height: 120,
                radius: 20,
                defaultValue: dataMngProvider.data.memo,
                hintStr: language.getText(TITLE.E_MEMO),
              ),
            )
          )
        ],
      ),
    );
  }
}