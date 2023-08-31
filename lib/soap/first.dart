import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:isma/config/define.dart';
import 'package:isma/custom/customTextField.dart';
import 'package:provider/provider.dart';

import '../custom/customRadioButton.dart';
import '../mng/DataMng.dart';

class FirstView extends StatelessWidget {
  FirstView({super.key});

  @override
  Widget build(BuildContext context) {
    DataMng dataMngProvider = Provider.of<DataMng>(context);
    return Expanded(
      child: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          shrinkWrap: true,
          children: [
            Text(
              "레시피 이름",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: getThemeColor(dataMngProvider.getTypeIndex(), 0),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 3)),
            CustomTextField((String data) { dataMngProvider.setName(data); }, active: true, index: dataMngProvider.getTypeIndex(),),

            const Padding(padding: EdgeInsets.symmetric(vertical: 20)),
            Text(
              "비누 유형",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: getThemeColor(dataMngProvider.getTypeIndex(), 0),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 6)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(child: customRadioButton(() { dataMngProvider.setType(TYPE.E_COLD); }, TYPE.E_COLD, dataMngProvider.getTypeIndex())),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                Expanded(child: customRadioButton(() { dataMngProvider.setType(TYPE.E_HOT); }, TYPE.E_HOT, dataMngProvider.getTypeIndex())),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                Expanded(child: customRadioButton(() { dataMngProvider.setType(TYPE.E_PASTE); }, TYPE.E_PASTE, dataMngProvider.getTypeIndex())),
              ],
            ),


            const Padding(padding: EdgeInsets.symmetric(vertical: 20)),
            Text(
              "값 입력",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: getThemeColor(dataMngProvider.getTypeIndex(), 0),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 6)),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(child: CustomTextField((String str) { dataMngProvider.setValue(str, 0); }, str:"100", needLb: true, labelTxt: "Lye Purity", active: true, needBg: false, radius: 15, index: dataMngProvider.getTypeIndex(),)),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                Expanded(child: CustomTextField((String str) { dataMngProvider.setValue(str, 1); }, str:"100", needLb: true, labelTxt: "Lye Count", active: true, needBg: false, radius: 15, index: dataMngProvider.getTypeIndex(),)),
                Visibility(
                  visible: dataMngProvider.data.type == TYPE.E_COLD,
                  child: const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                ),
                //여기
                Visibility(
                  visible: dataMngProvider.data.type == TYPE.E_COLD,
                  child: Expanded(
                    child: Row(
                      children: [
                        Expanded(child: CustomTextField((String str) { dataMngProvider.setValue(str, 2); }, str:"100", needLb: true, labelTxt: "Water", active: true, needBg: false, radius: 15, index: dataMngProvider.getTypeIndex(),)),
                      ],
                    ),
                  )
                ),
              ],
            ),

            Visibility(
              visible: dataMngProvider.data.type == TYPE.E_HOT,
              child: Column(
                children: [
                  const Padding(padding: EdgeInsets.symmetric(vertical: 6)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(child: CustomTextField((String str) { dataMngProvider.setValue(str, 3); }, str:"55", needLb: true, labelTxt: "Pure Soap", active: true, needBg: false, radius: 15, index: dataMngProvider.getTypeIndex(),)),
                      const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                      Expanded(child: CustomTextField((String str) { dataMngProvider.setValue(str, 6); }, str:"10", needLb: true, labelTxt: "Glycerine", active: true, needBg: false, radius: 15, index: dataMngProvider.getTypeIndex(),)),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 6)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(child: CustomTextField((String str) { dataMngProvider.setValue(str, 5); }, str:"8", needLb: true, labelTxt: "Sugar", active: true, needBg: false, radius: 15, index: dataMngProvider.getTypeIndex(),)),
                      const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                      Expanded(child: CustomTextField((String str) { dataMngProvider.setValue(str, 4); }, str:"45", needLb: true, labelTxt: "Solvent", active: true, needBg: false, radius: 15, index: dataMngProvider.getTypeIndex(),)),
                      const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                      Expanded(child: CustomTextField((String str) { dataMngProvider.setValue(str, 5); }, str:"30", needLb: true, labelTxt: "Ethanol", active: true, needBg: false, radius: 15, index: dataMngProvider.getTypeIndex(),)),
                    ],
                  ),
                ],
              )
            ),

          ],
        )
      ),
    );
  }
}