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
            CustomTextField((String data) { dataMngProvider.setName(data); }, defaultValue: dataMngProvider.getName(), active: true, index: dataMngProvider.getTypeIndex(),),

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
            const Padding(padding: EdgeInsets.symmetric(vertical: 6)),

            AnimatedContainer(
              duration: const Duration(milliseconds: 240),
              width: double.maxFinite,
              height: dataMngProvider.getTypeIndex() == 0 || dataMngProvider.getTypeIndex() == 2 ? 60 : 0,
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
                    dataMngProvider.setSoapType();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
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
                              height: 45,
                              width: 45,
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
                            Text(
                              "${dataMngProvider.data.isReturn ? "일반비누용" : "비누화수용"}으로 계산하기",
                              style: TextStyle(
                                color: getThemeColor(dataMngProvider.getTypeIndex(), dataMngProvider.data.isReturn ? 0 : 1),
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        SvgPicture.asset(
                          'assets/icon/click.svg',
                          width: 30,
                          color: getThemeColor(dataMngProvider.getTypeIndex(), dataMngProvider.data.isReturn ? 0 : 1),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Visibility(
            //   visible: dataMngProvider.getTypeIndex() == 0 || dataMngProvider.getTypeIndex() == 2,
            //   child: Material(
            //     color: getThemeColor(dataMngProvider.getTypeIndex(), dataMngProvider.data.isReturn ? 1 : 0),
            //     borderRadius: BorderRadius.circular(10),
            //     child: InkWell(
            //       borderRadius: BorderRadius.circular(10),
            //       highlightColor: getThemeColor(dataMngProvider.getTypeIndex(), dataMngProvider.data.isReturn ? 0 : 1).withOpacity(0.5),
            //       splashColor: getThemeColor(dataMngProvider.getTypeIndex(), dataMngProvider.data.isReturn ? 0 : 1).withOpacity(0.5),
            //       onTap: () {
            //         dataMngProvider.setSoapType();
            //       },
            //       child: Container(
            //         width: double.maxFinite,
            //         height: 60,
            //         padding: const EdgeInsets.symmetric(horizontal: 20),
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(10),
            //           border: Border.all(width: dataMngProvider.data.isReturn ? 3 : 0, color: getThemeColor(dataMngProvider.getTypeIndex(), 0)),
            //         ),
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //             Row(
            //               children: [
            //                 Container(
            //                   height: 45,
            //                   width: 45,
            //                   padding: const EdgeInsets.all(10),
            //                   decoration: BoxDecoration(
            //                     borderRadius: BorderRadius.circular(100),
            //                     color: getThemeColor(dataMngProvider.getTypeIndex(), dataMngProvider.data.isReturn ? 0 : 1),
            //                   ),
            //                   child: SvgPicture.asset(
            //                     'assets/icon/change.svg',
            //                     color: getThemeColor(dataMngProvider.data.type.index, dataMngProvider.data.isReturn ? 1 : 0),
            //                   ),
            //                 ),
            //                 const Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
            //                 Text(
            //                   "${dataMngProvider.data.isReturn ? "일반비누용" : "비누화수용"}으로 계산하기",
            //                   style: TextStyle(
            //                     color: getThemeColor(dataMngProvider.getTypeIndex(), dataMngProvider.data.isReturn ? 0 : 1),
            //                     fontWeight: FontWeight.bold,
            //                     fontSize: 16,
            //                   ),
            //                 ),
            //               ],
            //             ),
            //             SvgPicture.asset(
            //               'assets/icon/click.svg',
            //               width: 30,
            //               color: getThemeColor(dataMngProvider.getTypeIndex(), dataMngProvider.data.isReturn ? 0 : 1),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ),
            // ),



            const Padding(padding: EdgeInsets.symmetric(vertical: 20)),
            Text(
              "값 입력 [기본 단위 %]",
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
                Expanded(child: CustomTextField((String str) { dataMngProvider.setValue(str, 0); }, defaultValue: dataMngProvider.getValue(0)!, needLb: true, labelTxt: "Lye Purity", active: true, needBg: false, radius: 15, index: dataMngProvider.getTypeIndex(),)),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                Expanded(child: CustomTextField((String str) { dataMngProvider.setValue(str, 1); }, defaultValue: dataMngProvider.getValue(1)!, needLb: true, labelTxt: "Lye Count", active: true, needBg: false, radius: 15, index: dataMngProvider.getTypeIndex(),)),
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
                        Expanded(child: CustomTextField((String str) { dataMngProvider.setValue(str, 2); }, defaultValue: dataMngProvider.getValue(2)!, needLb: true, labelTxt: "Water", active: true, needBg: false, radius: 15, index: dataMngProvider.getTypeIndex(),)),
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
                      Expanded(child: CustomTextField((String str) { dataMngProvider.setValue(str, 3); }, defaultValue:dataMngProvider.getValue(3)!, needLb: true, labelTxt: "Pure Soap", active: true, needBg: false, radius: 15, index: dataMngProvider.getTypeIndex(),)),
                      const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                      Expanded(child: CustomTextField((String str) { dataMngProvider.setValue(str, 4); }, defaultValue:dataMngProvider.getValue(4)!, needLb: true, labelTxt: "Glycerine", active: true, needBg: false, radius: 15, index: dataMngProvider.getTypeIndex(),)),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 6)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(child: CustomTextField((String str) { dataMngProvider.setValue(str, 5); }, defaultValue:dataMngProvider.getValue(5)!, needLb: true, labelTxt: "Sugar", active: true, needBg: false, radius: 15, index: dataMngProvider.getTypeIndex(),)),
                      const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                      Expanded(child: CustomTextField((String str) { dataMngProvider.setValue(str, 6); }, defaultValue:dataMngProvider.getValue(6)!, needLb: true, labelTxt: "Solvent", active: true, needBg: false, radius: 15, index: dataMngProvider.getTypeIndex(),)),
                      const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                      Expanded(child: CustomTextField((String str) { dataMngProvider.setValue(str, 7); }, defaultValue:dataMngProvider.getValue(7)!, needLb: true, labelTxt: "Ethanol", active: true, needBg: false, radius: 15, index: dataMngProvider.getTypeIndex(),)),
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