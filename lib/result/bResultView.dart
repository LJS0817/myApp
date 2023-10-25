import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:isma/config/colors.dart';
import 'package:isma/custom/customTextField.dart';
import 'package:isma/custom/resultOilBox.dart';
import 'package:isma/custom/resultOilDetails.dart';
import 'package:isma/config/define.dart';
import 'package:isma/mng/FileMng.dart';
import 'package:isma/mng/MenuMng.dart';
import 'package:isma/mng/Mng.dart';
import 'package:isma/mng/PageMng.dart';
import 'package:provider/provider.dart';

import '../mng/DataMng.dart';

class bResultView extends StatelessWidget {

  double leftPadding = 15;
  int themeIndex = 0;
  bool showChart = false;
  double oilBoxSize = 50;

  bResultView(int idx, double padding, double boxSize, {super.key}) {
    themeIndex = idx;
    leftPadding = padding;
    oilBoxSize = boxSize;
  }

  @override
  Widget build(BuildContext context) {
    Mng data = Provider.of<Mng>(context);
    PageMng pageMng = Provider.of<PageMng>(context);
    DataMng dataMng = Provider.of<DataMng>(context);
    MenuMng menuMng = Provider.of<MenuMng>(context);
    FileMng fileMng = Provider.of<FileMng>(context);

    return Container(
        height: MediaQuery.of(context).size.height * 0.6 + 100,
        child: Column(
          children: [
            Container(
                height: MediaQuery.of(context).size.height * 0.6,
                padding: EdgeInsets.only(bottom: 20 * sizeMng.defaultScale, top: 20 * sizeMng.defaultScale,),
                decoration: BoxDecoration(
                  color: getThemeColor(1, 1),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: ScrollConfiguration(
                  behavior: const ScrollBehavior().copyWith(overscroll: false),
                  child: ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    children: [
                      //이름
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(left: leftPadding + 5, right: leftPadding, bottom: 15),
                        child: Text(
                          data.selectData.name,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: sizeMng.defaultFontSize + 4,
                            fontWeight: FontWeight.bold,
                            color: getThemeColor(themeIndex, 0),
                          ),
                        ),
                      ),

                      //오일
                      Container(
                          height: (menuMng.showOilDetails > 0) ? 200 + (60 * sizeMng.defaultScale + sizeMng.defaultPadding)+ (menuMng.showOilDetails > 0 ? (data.selectData.type.index > 2 ? (menuMng.showOilDetails == 1 ? data.selectData.data[0].length + data.selectData.data[1].length : data.selectData.data[menuMng.showOilDetails].length) : data.selectData.data[menuMng.showOilDetails - 1].length) : 0) * oilBoxSize : 190 * sizeMng.defaultScale - sizeMng.defaultPadding,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(left: leftPadding),
                          decoration: BoxDecoration(
                            color: getThemeColor(themeIndex, 0),
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(20 * sizeMng.defaultScale ), bottomLeft: Radius.circular(20 * sizeMng.defaultScale )),
                          ),
                          child: Stack(
                            children: [
                              //텍스트
                              Positioned(
                                child: Container(
                                    alignment: Alignment.topLeft,
                                    margin: const EdgeInsets.only(left: 20, top: 12),
                                    child: Text(
                                      "${language.getText(typeToTitleEnum(parseTYPE(themeIndex.toString())))} [ ${language.getText(skinTypeToTitleEnum(data.selectData.skinType))} ${language.getText(TITLE.E_SKINTYPE_TITLE)} ]",
                                      style: TextStyle(
                                        color: getThemeColor(themeIndex, 2),
                                        fontWeight: FontWeight.bold,
                                        fontSize: sizeMng.defaultFontSize,
                                      ),
                                    )
                                ),
                              ),
                              Positioned(
                                child: Container(
                                  alignment: Alignment.topRight,
                                  margin: const EdgeInsets.only(right: 10, top: 15),
                                  child: SvgPicture.asset(
                                    getIcon(parseTYPE(themeIndex.toString())),
                                    width: 150 * sizeMng.defaultScale,
                                    height: 150 * sizeMng.defaultScale,
                                    color: getThemeColor(themeIndex, 1).withOpacity(0.25),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 35,
                                left: 20 * sizeMng.defaultScale,
                                child: Icon(
                                  Icons.water_drop_outlined,
                                  size: 29 * sizeMng.defaultScale,
                                  color: getThemeColor(themeIndex, 1),
                                ),
                              ),
                              Positioned(
                                top: 35,
                                left: 56 * sizeMng.defaultScale,
                                child: Text(
                                  "${data.selectData.weight[0]} g",
                                  style: TextStyle(
                                    color: getThemeColor(themeIndex, 1),
                                    fontSize: sizeMng.defaultFontSize + 8,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),

                              //오일 내용
                              Center(
                                  child: Container(
                                      margin: EdgeInsets.only(top: 80 + sizeMng.defaultPadding, left: leftPadding - 5, right: leftPadding - 5),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              ResultOilBox("${language.getText(TITLE.E_BEAUTY_SUSANG)}\n${data.selectData.data[0].length + data.selectData.data[1].length}", themeIndex, 1, w: 70, h: 70,),
                                              ResultOilBox("${language.getText(TITLE.E_BEAUTY_USANG)}\n${data.selectData.data[3].length}", themeIndex, 3, w: 70, h: 70,),
                                              ResultOilBox("${language.getText(TITLE.E_BEAUTY_UHWA)}\n${data.selectData.data[2].length}", themeIndex, 2, w: 70, h: 70,),
                                              ResultOilBox("${language.getText(TITLE.E_BEAUTY_EO)}\n${data.selectData.data[4].length}", themeIndex, 4, w: 70, h: 70,),
                                            ],
                                          ),
                                          Visibility(
                                              visible: menuMng.showOilDetails > 0,
                                              child: Transform.translate(
                                                offset: const Offset(0, -1),
                                                child: Container(
                                                  width: double.maxFinite,
                                                  margin: const EdgeInsets.only(left: 5, right: 5),
                                                  height: ((menuMng.showOilDetails > 0 ? (data.selectData.type.index > 2 ? (menuMng.showOilDetails == 1 ? data.selectData.data[0].length + data.selectData.data[1].length : data.selectData.data[menuMng.showOilDetails].length) : data.selectData.data[menuMng.showOilDetails - 1].length) : 0) * oilBoxSize + 35 + (35 * sizeMng.defaultScale)),
                                                  decoration: BoxDecoration(
                                                    borderRadius: const BorderRadius.only(bottomRight: Radius.circular(15), bottomLeft: Radius.circular(15)),
                                                    color: getThemeColor(themeIndex, 1),
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      SizedBox(
                                                          height: (menuMng.showOilDetails > 0 ? (data.selectData.type.index > 2 ? (menuMng.showOilDetails == 1 ? data.selectData.data[0].length + data.selectData.data[1].length : data.selectData.data[menuMng.showOilDetails].length) : data.selectData.data[menuMng.showOilDetails - 1].length) : 0) * oilBoxSize + 5,
                                                          child: ListView.builder(
                                                            shrinkWrap: true,
                                                            padding: const EdgeInsets.only(left: 10, right: 10, top: 4),
                                                            itemCount: (menuMng.showOilDetails > 0 ? (data.selectData.type.index > 2 ? (menuMng.showOilDetails == 1 ? data.selectData.data[0].length + data.selectData.data[1].length : data.selectData.data[menuMng.showOilDetails].length) : data.selectData.data[menuMng.showOilDetails - 1].length) : 0),
                                                            itemBuilder: (con, index)  {
                                                              return ResultOilDetailsContainer(oilBoxSize, themeIndex, index);
                                                            },
                                                          )
                                                      ),

                                                      Container(
                                                        height: 30,
                                                        alignment: Alignment.centerRight,
                                                        padding: const EdgeInsets.only(left: 10, right: 10, top: 4),
                                                        child: Text(
                                                          "${language.getText(TITLE.E_RESULT_TOTAL)}    -    ${(data.selectData.type.index > 2 && menuMng.showOilDetails == 1 ? data.selectData.weight[1] + data.selectData.weight[2] : data.selectData.weight[1 + menuMng.showOilDetails])}${menuMng.showOilDetails == 4 ? "dr" : "g"}",
                                                          style: TextStyle(
                                                            color: getThemeColor(themeIndex, 0),
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: sizeMng.defaultFontSize - 1,
                                                          ),
                                                        ),
                                                      ),

                                                      Material(
                                                        color: getThemeColor(themeIndex, 2),
                                                        borderRadius: const BorderRadius.only(bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10)),
                                                        child: InkWell(
                                                          onTap: () {
                                                            menuMng.setOilDetails(0);
                                                          },
                                                          borderRadius: const BorderRadius.only(bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10)),
                                                          splashColor: getThemeColor(themeIndex, 0).withOpacity(0.4),
                                                          highlightColor: getThemeColor(themeIndex, 0).withOpacity(0.4),
                                                          child: Container(
                                                            color: Colors.transparent,
                                                            width: double.maxFinite,
                                                            alignment: Alignment.center,
                                                            height: 35 * sizeMng.defaultScale,
                                                            child: Text(
                                                              "${language.getText(TITLE.E_RESULT_CLOSE)}        X",
                                                              style: TextStyle(
                                                                color: getThemeColor(themeIndex, 0),
                                                                fontWeight: FontWeight.bold,
                                                                fontSize: sizeMng.defaultFontSize - 1,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                          )
                                        ],
                                      )
                                  )
                              ),

                              //마지막
                              Container(
                                alignment: Alignment.bottomCenter,
                                margin: const EdgeInsets.only(bottom: 5, left: 30, right: 30),
                                child: FittedBox(
                                  child: Text(
                                    language.getText(TITLE.E_RESULT_TOUCHSIGN),
                                    style: TextStyle(
                                      color: getThemeColor(themeIndex, 1).withOpacity(0.5),
                                      fontWeight: FontWeight.bold,
                                      fontSize: sizeMng.defaultFontSize - 2,
                                    ),
                                  ),
                                )
                              ),
                            ],
                          )
                      ),

                      const Padding(padding: EdgeInsets.only(bottom: 15)),

                      //메모
                      Container(
                        margin: EdgeInsets.only(left: leftPadding, right: 15),
                        child: CustomTextField((String str) {}, index: themeIndex, defaultValue: data.selectData.memo, maxLines: 11, height: 210 * sizeMng.defaultScale + sizeMng.defaultPadding, radius: 15,),
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
                    child: Material(
                      borderRadius: BorderRadius.circular(10),
                      color: getThemeColor(themeIndex, 0),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          data.init();
                          menuMng.init();
                          fileMng.deleteFile(dataMng.selectFileName, 1);
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
                  ),
                  Positioned(
                    right: 5,
                    top: 10,
                    child: Material(
                      borderRadius: BorderRadius.circular(100),
                      color: getThemeColor(themeIndex, 0),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(100),
                        onTap: () {
                          pageMng.index = 0;
                          dataMng.initData(menuMng.index);
                          dataMng.data = data.selectData;
                          log(data.selectData.toString());
                          data.init();
                          log(dataMng.data.toString());
                          pageMng.UpdateText(dataMng.data);
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
                  ),
                  Center(
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
        )
    );
  }
}