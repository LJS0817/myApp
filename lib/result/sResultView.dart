import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:isma/config/colors.dart';
import 'package:isma/custom/circleChart.dart';
import 'package:isma/custom/customTextField.dart';
import 'package:isma/custom/resultOilBox.dart';
import 'package:isma/custom/resultOilDetails.dart';
import 'package:isma/custom/resultValueBox.dart';
import 'package:isma/config/define.dart';
import 'package:isma/mng/FileMng.dart';
import 'package:isma/mng/MenuMng.dart';
import 'package:isma/mng/Mng.dart';
import 'package:isma/mng/PageMng.dart';
import 'package:provider/provider.dart';
import 'package:isma/custom/graph.dart';

import '../mng/DataMng.dart';

class sResultView extends StatelessWidget {

  double leftPadding = 15;
  int themeIndex = 0;
  bool showChart = false;
  double oilBoxSize = 50;

  sResultView(int idx, double padding, double boxSize, {super.key}) {
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
                  borderRadius: BorderRadius.circular(30 * sizeMng.defaultScale),
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
                        padding: EdgeInsets.only(left: leftPadding + 5, right: leftPadding, bottom: 15 * sizeMng.defaultScale,),
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
                          height: (menuMng.showOilDetails > 0) ? 260 + (menuMng.showOilDetails > 0 ? data.selectData.data[menuMng.showOilDetails - 1].length : 0) * oilBoxSize * sizeMng.defaultScale + sizeMng.defaultPadding : 190 * sizeMng.defaultScale - sizeMng.defaultPadding,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(left: leftPadding),
                          decoration: BoxDecoration(
                            color: getThemeColor(themeIndex, 0),
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(20 * sizeMng.defaultScale), bottomLeft: Radius.circular(20 * sizeMng.defaultScale)),
                          ),
                          child: Stack(
                            children: [
                              //텍스트
                              Positioned(
                                child: Container(
                                    alignment: Alignment.topLeft,
                                    margin: const EdgeInsets.only(left: 20, top: 12),
                                    child: Text(
                                      "${typeToString(parseTYPE(themeIndex.toString()))}  ${data.selectData.isReturn ? "[ 비누화수 ]" : "[ 일반비누 ]"}",
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
                                left: 20,
                                child: Icon(
                                  Icons.water_drop_outlined,
                                  size: 29 * sizeMng.defaultScale,
                                  color: getThemeColor(themeIndex, 1),
                                ),
                              ),
                              Positioned(
                                top: 35,
                                left: 56 + sizeMng.defaultPadding,
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
                                              ResultOilBox("오일\n${data.selectData.data[0].length}", themeIndex, 1, function: () { menuMng.sizeChanged(false); },),
                                              ResultOilBox("슈퍼팻\n${data.selectData.data[1].length}", themeIndex, 2, function: () { menuMng.sizeChanged(true); },),
                                              ResultOilBox("첨가물\n${data.selectData.data[2].length}", themeIndex, 3, function: () { menuMng.sizeChanged(true); },),
                                            ],
                                          ),
                                          Visibility(
                                              visible: menuMng.showOilDetails > 0,
                                              child: Transform.translate(
                                                offset: const Offset(0, -1),
                                                child: Container(
                                                  width: double.maxFinite,
                                                  height: ((menuMng.showOilDetails > 0 ? data.selectData.data[menuMng.showOilDetails - 1].length : 0) * oilBoxSize + 35 + (35 * sizeMng.defaultScale)),
                                                  margin: const EdgeInsets.only(left: 5, right: 5),
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(15 * sizeMng.defaultScale), bottomLeft: Radius.circular(15 * sizeMng.defaultScale)),
                                                    color: getThemeColor(themeIndex, 1),
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                          height: (menuMng.showOilDetails > 0 ? data.selectData.data[menuMng.showOilDetails - 1].length : 0) * oilBoxSize + 5,
                                                          child: ListView.builder(
                                                            shrinkWrap: true,
                                                            padding: const EdgeInsets.only(left: 10, right: 10, top: 4),
                                                            itemCount: (menuMng.showOilDetails > 0 ? data.selectData.data[menuMng.showOilDetails - 1].length : 0),
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
                                                          "총합    -    ${data.selectData.weight[menuMng.showOilDetails]}g",
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
                                                              "닫기        X",
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
                                margin: const EdgeInsets.only(bottom: 7),
                                child: Text(
                                  "각 항목을 터치하면 사용한 목록이 나옵니다.",
                                  style: TextStyle(
                                    color: getThemeColor(themeIndex, 1).withOpacity(0.5),
                                    fontWeight: FontWeight.bold,
                                    fontSize: sizeMng.defaultFontSize - 3,
                                  ),
                                ),
                              ),
                            ],
                          )
                      ),

                      AnimatedContainer(
                          duration: const Duration(milliseconds: 130),
                          margin: EdgeInsets.only(top: (data.showChart ? 14 : 0), left: leftPadding + 5, right: leftPadding),
                          height: data.showChart ? 210 * sizeMng.defaultScale : 0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: getThemeColor(themeIndex, 0),
                          ),
                          child: ListView(
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                Stack(
                                  children: [
                                    Positioned(
                                      top: 0,
                                      bottom: 0,
                                      left: 0,
                                      child: Container(
                                        width: MediaQuery.of(context).size.width * 0.365 + sizeMng.defaultPadding * sizeMng.defaultScale,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20 * sizeMng.defaultScale), bottomLeft: Radius.circular(20 * sizeMng.defaultScale)),
                                          color: getThemeColor(themeIndex, 1).withOpacity(0.6),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            CustomChartBar(themeIndex, data.resultFat[0], 0, false),
                                            CustomChartBar(themeIndex, data.resultFat[1], 1, false),
                                            CustomChartBar(themeIndex, data.resultFat[2], 2, false),
                                            CustomChartBar(themeIndex, data.resultFat[3], 3, false),

                                            CustomChartBar(themeIndex, data.resultFat[6], 4, true),
                                            CustomChartBar(themeIndex, data.resultFat[7], 5, true),
                                            CustomChartBar(themeIndex, data.resultFat[4], 6, true),
                                            CustomChartBar(themeIndex, data.resultFat[5], 7, true),
                                            CustomChartBar(themeIndex, data.resultFat[8], 8, true),
                                          ],
                                        ),
                                        const Padding(padding: EdgeInsets.symmetric(vertical: 3)),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              "포화",
                                              style: TextStyle(
                                                color: getThemeColor(themeIndex, 0),
                                                fontWeight: FontWeight.bold,
                                                fontSize: sizeMng.defaultFontSize - 2,
                                              ),
                                            ),
                                            Text(
                                              "불포화",
                                              style: TextStyle(
                                                color: getThemeColor(themeIndex, 1),
                                                fontWeight: FontWeight.bold,
                                                fontSize: sizeMng.defaultFontSize - 2,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Padding(padding: EdgeInsets.symmetric(vertical: 100)),
                                      ],
                                    ),
                                  ],
                                ),
                              ]
                          )
                      ),

                      //설정값
                      Container(
                        margin: EdgeInsets.only(left: leftPadding, top: 15, bottom: 15, right: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ResultValueBox(themeIndex, "오일양", "${data.selectData.weight[1] + data.selectData.weight[2]}g"),
                            ResultValueBox(themeIndex, !data.selectData.isReturn ? "Lye 양" : "비누화수양", "${data.resultLye.round()}g"),
                            ResultValueBox(themeIndex,
                                !data.selectData.isReturn ? "정제수 양" : "필요 물 양\n(식초 등)",
                                !data.selectData.isReturn ? "${data.getValue(2)}%\n(${data.resultWater.round()}g)" : "${(data.resultWater - data.resultLye * 0.5).round()}"),
                          ],
                        ),
                      ),

                      Visibility(
                        visible: data.selectData.isReturn,
                        child: Container(
                          height: 100 * sizeMng.defaultScale,
                          width: double.maxFinite,
                          margin: EdgeInsets.only(left: leftPadding, bottom: 15, right: 15),
                          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                          decoration: BoxDecoration(
                            color: getThemeColor(themeIndex, 0),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "비누화수 물의 양",
                                    style: TextStyle(
                                      color: getThemeColor(themeIndex, 1),
                                      fontSize: sizeMng.defaultFontSize - 1,
                                    ),
                                  ),
                                  Text(
                                    "${(data.resultLye * 0.5).round()}",
                                    style: TextStyle(
                                      color: getThemeColor(themeIndex, 1),
                                      fontSize: sizeMng.defaultFontSize - 1,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "비누화수 Lye 양",
                                    style: TextStyle(
                                      color: getThemeColor(themeIndex, 1),
                                      fontSize: sizeMng.defaultFontSize - 1,
                                    ),
                                  ),
                                  Text(
                                    "${(data.resultLye * 0.5).round()}",
                                    style: TextStyle(
                                      color: getThemeColor(themeIndex, 1),
                                      fontSize: sizeMng.defaultFontSize - 1,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "정제수 양  [ ${data.getValue(2)}% ]",
                                    style: TextStyle(
                                      color: getThemeColor(themeIndex, 1),
                                      fontSize: sizeMng.defaultFontSize - 1,
                                    ),
                                  ),
                                  Text(
                                    "${data.resultWater.round()}",
                                    style: TextStyle(
                                      color: getThemeColor(themeIndex, 1),
                                      fontSize: sizeMng.defaultFontSize - 1,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),

                      Visibility(
                        visible: data.selectData.type == TYPE.E_HOT,
                        child: Container(
                            height: 170 * sizeMng.defaultScale,
                            margin: EdgeInsets.only(left: leftPadding, bottom: 15, right: 15),
                            decoration: BoxDecoration(
                              color: getThemeColor(themeIndex, 1),
                              borderRadius: BorderRadius.circular(20 * sizeMng.defaultScale),
                              border: Border.all(color: getThemeColor(themeIndex, 0), width: 3),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                        child: Transform.translate(
                                          offset: const Offset(-1 , -1),
                                          child: Container(
                                            height: 50 * sizeMng.defaultScale,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              borderRadius: const BorderRadius.only(topLeft: Radius.circular(15), bottomRight: Radius.circular(15),),
                                              color: getThemeColor(themeIndex, 0),
                                            ),
                                            child: Text(
                                              "Pure Soap\n${data.selectData.values[3]}%  -  ${data.resultHot[0]}g",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: getThemeColor(themeIndex, 1),
                                                  fontSize: sizeMng.defaultFontSize - 3,
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ),
                                        )
                                    ),
                                    Expanded(
                                      child: Transform.translate(
                                        offset: const Offset(0, -1),
                                        child: Container(
                                          height: 50 * sizeMng.defaultScale,
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Solvent\n${data.selectData.values[6]}%  -  ${data.resultHot[1]}g",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: getThemeColor(themeIndex, 0),
                                                fontSize: sizeMng.defaultFontSize - 3,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          CircleChart("Ethanol", "${data.selectData.values[7]}", data.resultHot[2]),
                                          CircleChart("Glycerine", "${data.selectData.values[4]}", data.resultHot[3]),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          CircleChart("Sugar", "${data.selectData.values[5]}", data.resultHot[4]),
                                          CircleChart("Water of sugar", "", data.resultHot[5]),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )
                        ),
                      ),

                      //메모
                      Container(
                        margin: EdgeInsets.only(left: leftPadding, right: 15),
                        child: CustomTextField((String str) {}, index: themeIndex, defaultValue: data.selectData.memo, maxLines: 3, height: 80, radius: 15,),
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
                          fileMng.deleteFile(dataMng.selectFileName, 0);
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
                          dataMng.data.weight[0] = dataMng.data.weight[1] + dataMng.data.weight[2];
                          data.init();
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
                  Positioned(
                    right: 65 * sizeMng.defaultScale,
                    top: 10,
                    child: Material(
                      borderRadius: BorderRadius.circular(100),
                      color: getThemeColor(themeIndex, 1),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(100),
                        onTap: () {
                          data.clickChartResult();
                        },
                        splashColor: getThemeColor(themeIndex, 0).withOpacity(0.3),
                        highlightColor: getThemeColor(themeIndex, 0).withOpacity(0.3),
                        child: Container(
                          width: 50 * sizeMng.defaultScale,
                          height: 50 * sizeMng.defaultScale,
                          padding: EdgeInsets.symmetric(vertical: 10 * sizeMng.defaultScale),
                          decoration: BoxDecoration(
                            border: Border.all(color: getThemeColor(themeIndex, 1), width: 3),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: SvgPicture.asset(
                            "assets/icon/chart.svg",
                            width: 15,
                            height: 15,
                            fit: BoxFit.fitHeight,
                            color: getThemeColor(themeIndex, 0),
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