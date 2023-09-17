import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:isma/config/colors.dart';
import 'package:isma/custom/circleBorderBox.dart';
import 'package:isma/custom/circleRoundBox.dart';
import 'package:isma/custom/circleChart.dart';
import 'package:isma/custom/customTextField.dart';
import 'package:isma/custom/resultOilBox.dart';
import 'package:isma/custom/resultOilDetails.dart';
import 'package:isma/custom/resultValueBox.dart';
import 'package:isma/config/define.dart';
import 'package:isma/mng/MenuMng.dart';
import 'package:isma/mng/Mng.dart';
import 'package:isma/mng/PageMng.dart';
import 'package:provider/provider.dart';
import 'package:isma/custom/graph.dart';

import '../config/Oil.dart';
import '../mng/DataMng.dart';

class oResultView extends StatelessWidget {

  double leftPadding = 15;
  int themeIndex = -1;

  oResultView(double padding, {super.key}) {
    themeIndex = -1;
    leftPadding = padding;
  }

  @override
  Widget build(BuildContext context) {
    Mng data = Provider.of<Mng>(context);
    PageMng pageMng = Provider.of<PageMng>(context);
    DataMng dataMng = Provider.of<DataMng>(context);
    MenuMng menuMng = Provider.of<MenuMng>(context);

    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      height: 600,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Container(
              height: 500,
              padding: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: mainTextColor[Provider.of<MenuMng>(context).getIndex()],
                borderRadius: BorderRadius.circular(30),
              ),
              child: ScrollConfiguration(
                behavior: const ScrollBehavior().copyWith(overscroll: false),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    //이름
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(left: leftPadding + 5, right: leftPadding),
                      child: Text(
                        data.selectOil!.english,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: getThemeColor(themeIndex, 0),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(left: leftPadding + 5, right: leftPadding, bottom: 15),
                      child: Text(
                        data.selectOil!.korean,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: getThemeColor(themeIndex, 0).withOpacity(0.5),
                        ),
                      ),
                    ),

                    //기본값
                    Container(
                      padding: EdgeInsets.only(left: leftPadding + 5, right: leftPadding, bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: circleRoundBox("NaOH", data.selectOil!.NaOH.toString(), themeIndex),
                          ),
                          const Padding(padding: EdgeInsets.only(left: 15)),
                          Expanded(
                            child: circleRoundBox("KOH", data.selectOil!.KOH.toString(), themeIndex),
                          ),
                        ],
                      ),
                    ),

                    Center(
                      child: Text(
                        "Fat",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: getThemeColor(themeIndex, 0),
                        ),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.only(left: leftPadding + 5, right: leftPadding, bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: circleBorderBox("Lauric", data.selectOil!.getFat(FAT_TYPE.Lauric).toString(), themeIndex),
                          ),
                          const Padding(padding: EdgeInsets.only(left: 15)),
                          Expanded(
                            child: circleBorderBox("Myristic", data.selectOil!.getFat(FAT_TYPE.Myristic).toString(), themeIndex),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: leftPadding + 5, right: leftPadding, bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: circleBorderBox("Palmitic", data.selectOil!.getFat(FAT_TYPE.Palmitic).toString(), themeIndex),
                          ),
                          const Padding(padding: EdgeInsets.only(left: 15)),
                          Expanded(
                            child: circleBorderBox("Stearic", data.selectOil!.getFat(FAT_TYPE.Stearic).toString(), themeIndex),
                          ),
                        ],
                      ),
                    ),


                    Center(
                      child: Text(
                        "Unfat",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: getThemeColor(themeIndex, 0),
                        ),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.only(left: leftPadding + 5, right: leftPadding, bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: circleBorderBox("Linolenic", data.selectOil!.getFat(FAT_TYPE.Linolenic).toString(), themeIndex),
                          ),
                          const Padding(padding: EdgeInsets.only(left: 15)),
                          Expanded(
                            child: circleBorderBox("Ricinoleic", data.selectOil!.getFat(FAT_TYPE.Ricinoleic).toString(), themeIndex),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: leftPadding + 5, right: leftPadding, bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: circleBorderBox("Oleic", data.selectOil!.getFat(FAT_TYPE.Oleic).toString(), themeIndex),
                          ),
                          const Padding(padding: EdgeInsets.only(left: 15)),
                          Expanded(
                            child: circleBorderBox("Linoleic", data.selectOil!.getFat(FAT_TYPE.Linoleic).toString(), themeIndex),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.maxFinite,
                      padding: EdgeInsets.only(left: leftPadding + 5, right: leftPadding, bottom: 20),
                      child: circleBorderBox("Palmitoleic", data.selectOil!.getFat(FAT_TYPE.Palmitoleic).toString(), themeIndex, width: 90,),
                    ),

                  ],
                ),
              )
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            height: 70,
            child:  Center(
              child: Material(
                borderRadius: BorderRadius.circular(100),
                color: getThemeColor(themeIndex, 0),
                child: InkWell(
                  borderRadius: BorderRadius.circular(100),
                  onTap: () {
                    data.hideResultView();
                  },
                  splashColor: getThemeColor(themeIndex, 1).withOpacity(0.3),
                  highlightColor: getThemeColor(themeIndex, 1).withOpacity(0.3),
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      border: Border.all(color: getThemeColor(themeIndex, 1), width: 3),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: SvgPicture.asset(
                      "assets/icon/close.svg",
                      color: getThemeColor(themeIndex, 1),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}