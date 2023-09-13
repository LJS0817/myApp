import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:isma/config/define.dart';
import 'package:isma/custom/EditableOilContainer.dart';
import 'package:isma/custom/customTextArea.dart';
import 'package:isma/custom/customTextField.dart';
import 'package:isma/mng/DataMng.dart';
import 'package:isma/mng/PageMng.dart';
import 'package:provider/provider.dart';

import '../dataListView.dart';


class bFifthView extends StatelessWidget {
  const bFifthView({super.key});

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
                  log(_);
                  dataMngProvider.setMemo(_);
                },
                multipleLine: true,
                index: dataMngProvider.getTypeIndex(),
                needBg: true,
                active: true,
                maxLines: 12,
                height: 150,
                radius: 20,
                str: dataMngProvider.data.memo.isEmpty ? "메모 입력" : dataMngProvider.data.memo,
              ),
            ),
          ),
        ],
      ),
    );
  }
}