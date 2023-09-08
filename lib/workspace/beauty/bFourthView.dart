import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:isma/config/define.dart';
import 'package:isma/custom/EditableOilContainer.dart';
import 'package:isma/custom/customTextArea.dart';
import 'package:isma/custom/customTextField.dart';
import 'package:isma/mng/DataMng.dart';
import 'package:isma/mng/PageMng.dart';
import 'package:provider/provider.dart';


class bFourthView extends StatelessWidget {
  const bFourthView({super.key});

  @override
  Widget build(BuildContext context) {
    DataMng dataMngProvider = Provider.of<DataMng>(context);
    // PageMng pageMngProvider = Provider.of<PageMng>(context);
    return Expanded(
      child: Container(
        margin: EdgeInsets.zero,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(overscroll: false),
          child: ListView(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            children: [
              Center(
                child: Text(
                  "EO",
                  style: TextStyle(
                    color: getThemeColor(dataMngProvider.getTypeIndex(), 0),
                    fontWeight: FontWeight.bold,
                    fontSize: 17
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 6)),
              customTextArea(
                dataMngProvider.getTypeIndex(),
                (str) { dataMngProvider.data.data[1][0] = str; },
                (str) { dataMngProvider.setData(1, 0, str); },
                (data) { dataMngProvider.data.data[1][1] = data; return data; },
                data: dataMngProvider.getData(1, 0),),

              const Padding(padding: EdgeInsets.symmetric(vertical: 5)),


              Center(
                child: Text(
                  "메모",
                  style: TextStyle(
                      color: getThemeColor(dataMngProvider.getTypeIndex(), 0),
                      fontWeight: FontWeight.bold,
                      fontSize: 17
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 6)),
              CustomTextField(
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
                radius: 12,
                str: dataMngProvider.data.memo.isEmpty ? "메모 입력" : dataMngProvider.data.memo,
              ),
            ],
          ),
        )
      ),
    );
  }
}