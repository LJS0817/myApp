import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:isma/config/define.dart';
import 'package:isma/custom/customTextField.dart';
import 'package:isma/mng/DataMng.dart';
import 'package:provider/provider.dart';

class oFirstView extends StatelessWidget {
  const oFirstView({super.key});
  
  Widget oilTextFiled(Function func, String title, String defaultValue, {bool isFirst=false}) {
    TextEditingController controller = TextEditingController();
    return Container(
      height: isFirst? 42 * sizeMng.defaultScale : 44 * sizeMng.defaultScale,
      margin: const EdgeInsets.only(left: 15, right: 15),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 30 * sizeMng.defaultScale,
            right: 0,
            child: Visibility(
              visible: !isFirst,
              child: Container(
                height: 2 * sizeMng.defaultScale,
                color: getThemeColor(1, 1),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: getThemeColor(1, 1),
                  fontSize: sizeMng.defaultFontSize - 1,
                ),
              ),
              Expanded(
                child: Focus(
                  onFocusChange: (hasFocus) {
                    if(!hasFocus) {
                      func(controller.text);
                    }
                  },
                  child: TextField(
                    controller: controller,
                    textAlign: TextAlign.right,
                    textInputAction: TextInputAction.done,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    style: TextStyle(
                      color: getThemeColor(1, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: sizeMng.defaultFontSize - 2,
                    ),
                    onSubmitted: (_) {
                      func(_);
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: defaultValue,
                        hintStyle: TextStyle(
                          color: getThemeColor(1, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: sizeMng.defaultFontSize - 2,
                        )
                    ),
                  ),
                )
              ),
            ],
          ),
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    DataMng dataMng = Provider.of<DataMng>(context);
    return Expanded(
      child: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: ListView(
          padding: EdgeInsets.only(left: 20 * sizeMng.defaultScale, right: 20 * sizeMng.defaultScale, top: 15 * sizeMng.defaultScale, bottom: 10),
          children: [
            Text(
              language.getText(TITLE.E_OIL_TITLE),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: sizeMng.defaultFontSize + 2,
                fontWeight: FontWeight.bold,
                color: getThemeColor(1, 0),
              ),
            ),
            CustomTextField((_) { dataMng.setOilName(_.toString()); }, index: 1, active: true, radius: 15 * sizeMng.defaultScale, defaultValue: dataMng.getOilData()!.korean,),

            Padding(padding: EdgeInsets.only(top: 20 * sizeMng.defaultScale)),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      height: 90 * sizeMng.defaultScale,
                      decoration: BoxDecoration(
                        color: getThemeColor(1, 0).withOpacity(0.85),
                        borderRadius: BorderRadius.circular(10 * sizeMng.defaultScale),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: const EdgeInsets.only(left: 10),
                            child: Text(
                              "NaOH",
                              style: TextStyle(
                                fontSize: sizeMng.defaultFontSize - 1,
                                fontWeight: FontWeight.bold,
                                color: getThemeColor(1, 1),
                              ),
                            ),
                          ),
                          const Padding(padding: EdgeInsets.only(bottom: 3)),
                          CustomTextField((_) { log(_.toString()); dataMng.setOilData(0, _); }, onlyNum: true, index: 1, active: true, radius: 11 * sizeMng.defaultScale, needBor: false, height: 45 + (sizeMng.defaultPadding * sizeMng.defaultScale), defaultValue: dataMng.getOilData()!.NaOH.toString(),),
                        ],
                      ),
                    )
                ),
                const Padding(padding: EdgeInsets.only(left: 10)),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    height: 90 * sizeMng.defaultScale,
                    decoration: BoxDecoration(
                      color: getThemeColor(1, 0).withOpacity(0.85),
                      borderRadius: BorderRadius.circular(10 * sizeMng.defaultScale),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: const EdgeInsets.only(left: 10),
                          child: Text(
                            "KOH",
                            style: TextStyle(
                              fontSize: sizeMng.defaultFontSize - 1,
                              fontWeight: FontWeight.bold,
                              color: getThemeColor(1, 1),
                            ),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(bottom: 3)),
                        CustomTextField((_) { dataMng.setOilData(1, _); }, onlyNum: true, index: 1, active: true, radius: 11 * sizeMng.defaultScale, needBor: false, height: 45 + (sizeMng.defaultPadding * sizeMng.defaultScale), defaultValue: dataMng.getOilData()!.KOH.toString(),),
                      ],
                    ),
                  )
                )
              ],
            ),
            const Padding(padding: EdgeInsets.only(bottom: 20)),

            Container(
              height: 440 * sizeMng.defaultScale,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: getThemeColor(1, 0).withOpacity(0.85),
              ),
              child: Column(
                children: [
                  Container(
                    height: 42 * sizeMng.defaultScale,
                    padding: const EdgeInsets.only(right: 15, top: 10),
                    alignment: Alignment.centerRight,
                    child: Text(
                      language.getText(TITLE.E_OIL_ENTERVALUE),
                      style: TextStyle(
                        color: getThemeColor(1, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: sizeMng.defaultFontSize,
                      ),
                    ),
                  ),

                  oilTextFiled((_) { dataMng.setOilData(2, _.toString().isEmpty ? dataMng.getOilData()!.fat[0].toString() : _); }, "[ C12:0 ]  Lauric", dataMng.getOilData()!.fat[0].toString(), isFirst: true),
                  oilTextFiled((_) { dataMng.setOilData(3, _.toString().isEmpty ? dataMng.getOilData()!.fat[1].toString() : _); }, "[ C14:0 ]   Myristic", dataMng.getOilData()!.fat[1].toString()),
                  oilTextFiled((_) { dataMng.setOilData(4, _.toString().isEmpty ? dataMng.getOilData()!.fat[2].toString() : _); }, "[ C16:0 ]   Palmitic", dataMng.getOilData()!.fat[2].toString()),
                  oilTextFiled((_) { dataMng.setOilData(5, _.toString().isEmpty ? dataMng.getOilData()!.fat[3].toString() : _); }, "[ C18:0 ]   Stearic", dataMng.getOilData()!.fat[3].toString()),

                  oilTextFiled((_) { dataMng.setOilData(6, _.toString().isEmpty ? dataMng.getOilData()!.fat[4].toString() : _); }, "[ C16:1 ]   Palmitoleic", dataMng.getOilData()!.fat[4].toString()),
                  oilTextFiled((_) { dataMng.setOilData(7, _.toString().isEmpty ? dataMng.getOilData()!.fat[5].toString() : _); }, "[ C18:1 ]   Ricinoleic*", dataMng.getOilData()!.fat[5].toString()),
                  oilTextFiled((_) { dataMng.setOilData(8, _.toString().isEmpty ? dataMng.getOilData()!.fat[6].toString() : _); }, "[ C18:1 ]   Oleic", dataMng.getOilData()!.fat[6].toString()),
                  oilTextFiled((_) { dataMng.setOilData(9, _.toString().isEmpty ? dataMng.getOilData()!.fat[7].toString() : _); }, "[ C18:2 ]   Linoleic", dataMng.getOilData()!.fat[7].toString()),
                  oilTextFiled((_) { dataMng.setOilData(10, _.toString().isEmpty ? dataMng.getOilData()!.fat[8].toString() : _); }, "[ C18:3 ]   Linolenic", dataMng.getOilData()!.fat[8].toString()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}