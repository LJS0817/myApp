import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:isma/config/define.dart';
import 'package:isma/custom/customRadioButton.dart';
import 'package:isma/custom/customTextField.dart';
import 'package:isma/mng/DataMng.dart';
import 'package:provider/provider.dart';


class FirstView extends StatelessWidget {
  FirstView({super.key});

  @override
  Widget build(BuildContext context) {
    DataMng dataMngProvider = Provider.of<DataMng>(context);
    return Expanded(
      child: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20 * sizeMng.defaultScale),
          shrinkWrap: true,
          children: [
            Text(
              language.getText(TITLE.E_SOAP_RECIPENAME),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: getThemeColor(dataMngProvider.getTypeIndex(), 0),
                fontSize: sizeMng.defaultFontSize + 4,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 3)),
            CustomTextField((String data) { dataMngProvider.setName(data); }, defaultValue: dataMngProvider.getName(), active: true, index: dataMngProvider.getTypeIndex(),),

            Padding(padding: EdgeInsets.symmetric(vertical: 20 + sizeMng.defaultPadding,)),
            Text(
              language.getText(TITLE.E_SOAP_TYPETITLE),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: getThemeColor(dataMngProvider.getTypeIndex(), 0),
                fontSize: sizeMng.defaultFontSize + 4,
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
            const Padding(padding: EdgeInsets.symmetric(vertical: 6)),

            AnimatedContainer(
              duration: const Duration(milliseconds: 240),
              width: double.maxFinite,
              height: dataMngProvider.getTypeIndex() == 0 || dataMngProvider.getTypeIndex() == 2 ? 60 * sizeMng.defaultScale : 0,
              decoration: BoxDecoration(
                color: getThemeColor(dataMngProvider.getTypeIndex(), dataMngProvider.data.isReturn ? 1 : 0),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  highlightColor: getThemeColor(dataMngProvider.getTypeIndex(), dataMngProvider.data.isReturn ? 0 : 1).withOpacity(0.5),
                  splashColor: getThemeColor(dataMngProvider.getTypeIndex(), dataMngProvider.data.isReturn ? 0 : 1).withOpacity(0.5),
                  onTap: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    dataMngProvider.setSoapType();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: dataMngProvider.data.isReturn ?  17 : 20, vertical: dataMngProvider.data.isReturn ?  4 * sizeMng.defaultScale : 7 * sizeMng.defaultScale),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: dataMngProvider.data.isReturn ? 3 : 0, color: (dataMngProvider.getTypeIndex() == 0 || dataMngProvider.getTypeIndex() == 2 ? getThemeColor(dataMngProvider.getTypeIndex(), 0) : Colors.transparent)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 45 * sizeMng.defaultScale,
                              width: 45 * sizeMng.defaultScale,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: getThemeColor(dataMngProvider.getTypeIndex(), dataMngProvider.data.isReturn ? 0 : 1),
                              ),
                              child: SvgPicture.asset(
                                'assets/icon/change.svg',
                                color: getThemeColor(dataMngProvider.data.type.index, dataMngProvider.data.isReturn ? 1 : 0),
                              ),
                            ),
                            const Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                            FittedBox(
                              child: Text(
                                language.isEng ? "${language.getText(TITLE.E_SOAP_CALCULATE)}${dataMngProvider.data.isReturn ? language.getText(TITLE.E_OIL_NORMAL) : language.getText(TITLE.E_OIL_SOAPHWA)}"
                                    : "${dataMngProvider.data.isReturn ? language.getText(TITLE.E_OIL_NORMAL) : language.getText(TITLE.E_OIL_SOAPHWA)}${language.getText(TITLE.E_SOAP_CALCULATE)}",
                                style: TextStyle(
                                  color: getThemeColor(dataMngProvider.getTypeIndex(), dataMngProvider.data.isReturn ? 0 : 1),
                                  fontWeight: FontWeight.bold,
                                  fontSize: sizeMng.defaultFontSize,
                                ),
                              ),
                            )
                          ],
                        ),
                        SvgPicture.asset(
                          'assets/icon/click.svg',
                          width: 30 * sizeMng.defaultScale,
                          color: getThemeColor(dataMngProvider.getTypeIndex(), dataMngProvider.data.isReturn ? 0 : 1),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),


            Padding(padding: EdgeInsets.symmetric(vertical: 20 * sizeMng.defaultScale)),
            Text(
              language.getText(TITLE.E_SOAP_ENTERVALUE),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: getThemeColor(dataMngProvider.getTypeIndex(), 0),
                fontSize: sizeMng.defaultFontSize + 4,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 6)),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(child: CustomTextField((String str) { dataMngProvider.setValue(str, 0); }, hintStr : dataMngProvider.getValue(0)!, needLb: true, labelTxt: language.getText(TITLE.E_SOAP_LYEPURITY), active: true, needBg: false, radius: 15, index: dataMngProvider.getTypeIndex(),)),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                Expanded(child: CustomTextField((String str) { dataMngProvider.setValue(str, 1); }, hintStr: dataMngProvider.getValue(1)!, needLb: true, labelTxt: language.getText(TITLE.E_SOAP_LYECOUNT), active: true, needBg: false, radius: 15, index: dataMngProvider.getTypeIndex(),)),
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
                        Expanded(child: CustomTextField((String str) { dataMngProvider.setValue(str, 2); }, hintStr: dataMngProvider.getValue(2)!, needLb: true, labelTxt: language.getText(TITLE.E_OIL_WATER), active: true, needBg: false, radius: 15, index: dataMngProvider.getTypeIndex(),)),
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
                      Expanded(child: CustomTextField((String str) { dataMngProvider.setValue(str, 3); }, hintStr:dataMngProvider.getValue(3)!, needLb: true, labelTxt: language.getText(TITLE.E_OIL_PURESOAP), active: true, needBg: false, radius: 15, index: dataMngProvider.getTypeIndex(),)),
                      const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                      Expanded(child: CustomTextField((String str) { dataMngProvider.setValue(str, 4); }, hintStr:dataMngProvider.getValue(4)!, needLb: true, labelTxt: language.getText(TITLE.E_OIL_GLYCERINE), active: true, needBg: false, radius: 15, index: dataMngProvider.getTypeIndex(),)),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 6)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(child: CustomTextField((String str) { dataMngProvider.setValue(str, 5); }, hintStr:dataMngProvider.getValue(5)!, needLb: true, labelTxt: language.getText(TITLE.E_OIL_SUGAR), active: true, needBg: false, radius: 15, index: dataMngProvider.getTypeIndex(),)),
                      const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                      Expanded(child: CustomTextField((String str) { dataMngProvider.setValue(str, 6); }, hintStr:dataMngProvider.getValue(6)!, needLb: true, labelTxt: language.getText(TITLE.E_OIL_SOLVENT), active: true, needBg: false, radius: 15, index: dataMngProvider.getTypeIndex(),)),
                      const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                      Expanded(child: CustomTextField((String str) { dataMngProvider.setValue(str, 7); }, hintStr:dataMngProvider.getValue(7)!, needLb: true, labelTxt: language.getText(TITLE.E_OIL_ETHANOL), active: true, needBg: false, radius: 15, index: dataMngProvider.getTypeIndex(),)),
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