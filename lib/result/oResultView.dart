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
import 'package:isma/mng/FileMng.dart';
import 'package:isma/mng/MenuMng.dart';
import 'package:isma/mng/Mng.dart';
import 'package:isma/mng/OilMng.dart';
import 'package:isma/mng/PageMng.dart';
import 'package:provider/provider.dart';
import 'package:isma/custom/graph.dart';

import '../config/Oil.dart';
import '../mng/DataMng.dart';

class oResultView extends StatelessWidget {

  double leftPadding = 15;
  int themeIndex = -1;

  oResultView(double padding, {super.key}) {
    themeIndex = 1;
    leftPadding = padding;
  }

  @override
  Widget build(BuildContext context) {
    Mng data = Provider.of<Mng>(context);
    PageMng pageMng = Provider.of<PageMng>(context);
    DataMng dataMng = Provider.of<DataMng>(context);
    MenuMng menuMng = Provider.of<MenuMng>(context);
    FileMng fileMng = Provider.of<FileMng>(context);
    OilMng oilMng = Provider.of<OilMng>(context);

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.7 + 100,
      child: Column(
        children: [
          Container(
              height: MediaQuery.of(context).size.height * 0.7,
              padding: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: getThemeColor(1, 1),
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
                      padding: EdgeInsets.only(left: leftPadding + 5, right: leftPadding, top: 20),
                      child: Text(
                        data.selectOil!.english,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: sizeMng.defaultFontSize + 4,
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
                          fontSize: sizeMng.defaultFontSize - 2,
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
                          fontSize: sizeMng.defaultFontSize,
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
                          fontSize: sizeMng.defaultFontSize,
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
            height: 70 * sizeMng.defaultScale,
            child: Stack(
              children: [
                Positioned(
                  left: 5,
                  top: 10,
                  child: Visibility(
                    visible: dataMng.selectFileName.isNotEmpty,
                    child: Material(
                      borderRadius: BorderRadius.circular(10),
                      color: getThemeColor(themeIndex, 0),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          data.init();
                          menuMng.init();
                          oilMng.removeOil(data.selectOilDataIndex);
                          fileMng.deleteFile(dataMng.selectFileName, 2);
                          dataMng.selectFileName = "";
                        },
                        splashColor: getThemeColor(themeIndex, 1).withOpacity(0.3),
                        highlightColor: getThemeColor(themeIndex, 1).withOpacity(0.3),
                        child: Container(
                          width: 100 * sizeMng.defaultScale,
                          height: 50 * sizeMng.defaultScale,
                          padding: EdgeInsets.symmetric(vertical: 7 * sizeMng.defaultScale),
                          decoration: BoxDecoration(
                            border: Border.all(color: getThemeColor(themeIndex, 1), width: 3),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: SvgPicture.asset(
                            "assets/icon/delete.svg",
                            width: 15,
                            height: 15,
                            fit: BoxFit.fitHeight,
                            color: getThemeColor(themeIndex, 1),
                          ),
                        ),
                      ),
                    ),
                  )
                ),
                Positioned(
                  right: 5,
                  top: 10,
                  child: Visibility(
                    visible: dataMng.selectFileName.isNotEmpty,
                    child: Material(
                      borderRadius: BorderRadius.circular(100),
                      color: getThemeColor(themeIndex, 0),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(100),
                        onTap: () {
                          pageMng.index = 0;
                          dataMng.initData(menuMng.index, data.selectOil);
                          data.init();
                          pageMng.changeScene(context, menuMng.index);
                        },
                        splashColor: getThemeColor(themeIndex, 1).withOpacity(0.3),
                        highlightColor: getThemeColor(themeIndex, 1).withOpacity(0.3),
                        child: Container(
                          width: 50 * sizeMng.defaultScale,
                          height: 50 * sizeMng.defaultScale,
                          padding: EdgeInsets.symmetric(vertical: 10 * sizeMng.defaultScale),
                          decoration: BoxDecoration(
                            border: Border.all(color: getThemeColor(themeIndex, 1), width: 3),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: SvgPicture.asset(
                            "assets/icon/edit.svg",
                            width: 15,
                            height: 15,
                            fit: BoxFit.fitHeight,
                            color: getThemeColor(themeIndex, 1),
                          ),
                        ),
                      ),
                    ),
                  )
                ),
                Center(
                  child: Material(
                    borderRadius: BorderRadius.circular(100),
                    color: getThemeColor(themeIndex, 0),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(100),
                      onTap: () {
                        data.hideResultView();
                        data.selectOilDataIndex = -1;
                      },
                      splashColor: getThemeColor(themeIndex, 1).withOpacity(0.3),
                      highlightColor: getThemeColor(themeIndex, 1).withOpacity(0.3),
                      child: Container(
                        padding: EdgeInsets.all(15 * sizeMng.defaultScale),
                        width: 70 * sizeMng.defaultScale,
                        height: 70 * sizeMng.defaultScale,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}