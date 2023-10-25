import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:isma/config/define.dart';
import 'package:isma/custom/customRadioButton.dart';
import 'package:isma/custom/customRadioButtonWithoutIcon.dart';
import 'package:isma/custom/customTextField.dart';
import 'package:isma/mng/DataMng.dart';
import 'package:isma/mng/PageMng.dart';
import 'package:provider/provider.dart';

class bFirstView extends StatelessWidget {
  const bFirstView({super.key});

  @override
  Widget build(BuildContext context) {
    PageMng pageMngProvider = Provider.of<PageMng>(context);
    DataMng dataMngProvider = Provider.of<DataMng>(context);
    return Expanded(
      child: ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(overscroll: false),
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            shrinkWrap: true,
            children: [
              Text(
                language.getText(TITLE.E_BEAUTY_TITLE),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: getThemeColor(dataMngProvider.getTypeIndex(), 0),
                  fontSize: sizeMng.defaultFontSize + 4,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 3)),
              CustomTextField((String data) { dataMngProvider.setName(data); }, defaultValue: dataMngProvider.getName(), active: true, index: dataMngProvider.getTypeIndex(),),

              const Padding(padding: EdgeInsets.symmetric(vertical: 20)),
              Text(
                language.getText(TITLE.E_BEAUTY_TYPE),
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
                  Expanded(child: customRadioButton(() { dataMngProvider.setType(TYPE.E_SKIN); }, TYPE.E_SKIN, dataMngProvider.getTypeIndex())),
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                  Expanded(child: customRadioButton(() { dataMngProvider.setType(TYPE.E_ESSENCE); }, TYPE.E_ESSENCE, dataMngProvider.getTypeIndex())),
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                  Expanded(child: customRadioButton(() { dataMngProvider.setType(TYPE.E_LOTION); }, TYPE.E_LOTION, dataMngProvider.getTypeIndex())),
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                  Expanded(child: customRadioButton(() { dataMngProvider.setType(TYPE.E_CREAM); }, TYPE.E_CREAM, dataMngProvider.getTypeIndex())),
                ],
              ),
              
              const Padding(padding: EdgeInsets.symmetric(vertical: 20)),
              Text(
                language.getText(TITLE.E_BEAUTY_SKINTYPE),
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
                  Expanded(child: customRadioButtonWithoutIcon(() { dataMngProvider.setSkinType(SKINTYPE.E_MINGAM); }, SKINTYPE.E_MINGAM, dataMngProvider.getTypeIndex())),
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                  Expanded(child: customRadioButtonWithoutIcon(() { dataMngProvider.setSkinType(SKINTYPE.E_GUN); }, SKINTYPE.E_GUN, dataMngProvider.getTypeIndex())),
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                  Expanded(child: customRadioButtonWithoutIcon(() { dataMngProvider.setSkinType(SKINTYPE.E_ATOPI); }, SKINTYPE.E_ATOPI, dataMngProvider.getTypeIndex())),
                ],
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 6)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(child: customRadioButtonWithoutIcon(() { dataMngProvider.setSkinType(SKINTYPE.E_JOONG); }, SKINTYPE.E_JOONG, dataMngProvider.getTypeIndex())),
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                  Expanded(child: customRadioButtonWithoutIcon(() { dataMngProvider.setSkinType(SKINTYPE.E_JI); }, SKINTYPE.E_JI, dataMngProvider.getTypeIndex())),
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                  Expanded(child: customRadioButtonWithoutIcon(() { dataMngProvider.setSkinType(SKINTYPE.E_YEO); }, SKINTYPE.E_YEO, dataMngProvider.getTypeIndex())),
                ],
              ),


              const Padding(padding: EdgeInsets.symmetric(vertical: 20)),
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
                  Expanded(child: CustomTextField((String str) { dataMngProvider.setValue(str, 8); pageMngProvider.UpdateText(dataMngProvider.data); }, defaultValue: dataMngProvider.getValue(8)!, needLb: true, labelTxt: language.getText(TITLE.E_BEAUTY_SUSANG), active: true, needBg: false, radius: 15, index: dataMngProvider.getTypeIndex(),)),
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                  Expanded(child: CustomTextField((String str) { dataMngProvider.setValue(str, 9); pageMngProvider.UpdateText(dataMngProvider.data); }, defaultValue: dataMngProvider.getValue(9)!, needLb: true, labelTxt: language.getText(TITLE.E_BEAUTY_USANG), active: true, needBg: false, radius: 15, index: dataMngProvider.getTypeIndex(),)),
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                  Expanded(child: CustomTextField((String str) { dataMngProvider.setValue(str, 10); pageMngProvider.UpdateText(dataMngProvider.data); }, defaultValue: dataMngProvider.getValue(10)!, needLb: true, labelTxt: language.getText(TITLE.E_BEAUTY_UHWA), active: true, needBg: false, radius: 15, index: dataMngProvider.getTypeIndex(),)),
                ],
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 6)),
              CustomTextField(
                (String str) {
                  dataMngProvider.calculateBeautyWeight(str);
                  pageMngProvider.UpdateText(dataMngProvider.data);
                },
                defaultValue: dataMngProvider.data.weight[0].toString(),
                needLb: true,
                labelTxt: language.getText(TITLE.E_BEAUTY_TOTAL),
                active: true,
                needBg: false,
                radius: 15,
                index: dataMngProvider.getTypeIndex(),
              ),

            ],
          )
      ),
    );
  }

}