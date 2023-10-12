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
      height: isFirst? 42 : 44,
      margin: const EdgeInsets.only(left: 15, right: 15),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 30,
            right: 0,
            child: Visibility(
              visible: !isFirst,
              child: Container(
                height: 2,
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
                  fontSize: 15,
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
          padding: const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 10),
          children: [
            Text(
              "오일명",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: getThemeColor(1, 0),
              ),
            ),
            CustomTextField((_) { dataMng.setOilName(_.toString()); }, index: 1, active: true, radius: 15, defaultValue: dataMng.getOilData()!.korean,),

            const Padding(padding: EdgeInsets.only(top: 20)),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      height: 90,
                      decoration: BoxDecoration(
                        color: getThemeColor(1, 0).withOpacity(0.85),
                        borderRadius: BorderRadius.circular(10),
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
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: getThemeColor(1, 1),
                              ),
                            ),
                          ),
                          const Padding(padding: EdgeInsets.only(bottom: 3)),
                          CustomTextField((_) { log(_.toString()); dataMng.setOilData(0, _); }, onlyNum: true, index: 1, active: true, radius: 11, needBor: false, height: 45, defaultValue: dataMng.getOilData()!.NaOH.toString(),),
                        ],
                      ),
                    )
                ),
                const Padding(padding: EdgeInsets.only(left: 10)),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    height: 90,
                    decoration: BoxDecoration(
                      color: getThemeColor(1, 0).withOpacity(0.85),
                      borderRadius: BorderRadius.circular(10),
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
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: getThemeColor(1, 1),
                            ),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(bottom: 3)),
                        CustomTextField((_) { dataMng.setOilData(1, _); }, onlyNum: true, index: 1, active: true, radius: 11, needBor: false, height: 45, defaultValue: dataMng.getOilData()!.KOH.toString(),),
                      ],
                    ),
                  )
                )
              ],
            ),
            const Padding(padding: EdgeInsets.only(bottom: 20)),

            Container(
              height: 440,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: getThemeColor(1, 0).withOpacity(0.85),
              ),
              child: Column(
                children: [
                  Container(
                    height: 42,
                    padding: const EdgeInsets.only(right: 15, top: 10),
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Enter Fat Values",
                      style: TextStyle(
                        color: getThemeColor(1, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ),

                  oilTextFiled((_) { dataMng.setOilData(2, _.toString().isEmpty ? dataMng.getOilData()!.fat[0].toString() : _); },"Lauric", dataMng.getOilData()!.fat[0].toString(), isFirst: true),
                  oilTextFiled((_) { dataMng.setOilData(3, _.toString().isEmpty ? dataMng.getOilData()!.fat[1].toString() : _); }, "Myristic", dataMng.getOilData()!.fat[1].toString()),
                  oilTextFiled((_) { dataMng.setOilData(4, _.toString().isEmpty ? dataMng.getOilData()!.fat[2].toString() : _); }, "Palmitic", dataMng.getOilData()!.fat[2].toString()),
                  oilTextFiled((_) { dataMng.setOilData(5, _.toString().isEmpty ? dataMng.getOilData()!.fat[3].toString() : _); }, "Stearic", dataMng.getOilData()!.fat[3].toString()),

                  oilTextFiled((_) { dataMng.setOilData(6, _.toString().isEmpty ? dataMng.getOilData()!.fat[4].toString() : _); }, "Palmitoleic", dataMng.getOilData()!.fat[4].toString()),
                  oilTextFiled((_) { dataMng.setOilData(7, _.toString().isEmpty ? dataMng.getOilData()!.fat[5].toString() : _); }, "Ricinoleic", dataMng.getOilData()!.fat[5].toString()),
                  oilTextFiled((_) { dataMng.setOilData(8, _.toString().isEmpty ? dataMng.getOilData()!.fat[6].toString() : _); }, "Oleic", dataMng.getOilData()!.fat[6].toString()),
                  oilTextFiled((_) { dataMng.setOilData(9, _.toString().isEmpty ? dataMng.getOilData()!.fat[7].toString() : _); }, "Linoleic", dataMng.getOilData()!.fat[7].toString()),
                  oilTextFiled((_) { dataMng.setOilData(10, _.toString().isEmpty ? dataMng.getOilData()!.fat[8].toString() : _); }, "Linolenic", dataMng.getOilData()!.fat[8].toString()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}