import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:isma/config/colors.dart';
import 'package:isma/custom/customTextField.dart';
import 'package:isma/custom/resultOilBox.dart';
import 'package:isma/custom/resultValueBox.dart';
import 'package:isma/config/define.dart';
import 'package:isma/mng/MenuMng.dart';
import 'package:isma/mng/Mng.dart';
import 'package:isma/mng/PageMng.dart';
import 'package:provider/provider.dart';
import 'package:isma/custom/graph.dart';

import '../mng/DataMng.dart';

class ResultView extends StatelessWidget {

  static const double leftPadding = 15;
  int themeIndex = 0;
  bool showChart = false;
  double oilBoxSize = 23;

  ResultView(int idx, {super.key}) {
    themeIndex = idx;
  }

  @override
  Widget build(BuildContext context) {
    Mng data = Provider.of<Mng>(context);
    PageMng pageMng = Provider.of<PageMng>(context);
    DataMng dataMng = Provider.of<DataMng>(context);
    MenuMng menuMng = Provider.of<MenuMng>(context);

    return Visibility(
      visible: data.popUpActive,
      child: Stack(
        children: [
          Positioned(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Material(
                color: Colors.black.withOpacity(0.6),
                child: InkWell(
                  onTap: () {
                    data.hideResultView();
                  },
                ),
              ),
            ),
          ),
          Positioned(
            child: Center(
              child: Container(
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
                                  padding: const EdgeInsets.only(left: leftPadding + 5, right: leftPadding, bottom: 15),
                                  child: Text(
                                    data.selectData.name,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: getThemeColor(themeIndex, 0),
                                    ),
                                  ),
                                ),

                                //오일
                                Container(
                                    height: (menuMng.showOilDetails > 0) ? 260 + (menuMng.showOilDetails > 0 ? data.selectData.data[menuMng.showOilDetails - 1].length : 0) * oilBoxSize : 190,
                                    width: MediaQuery.of(context).size.width,
                                    margin: const EdgeInsets.only(left: leftPadding),
                                    decoration: BoxDecoration(
                                      color: getThemeColor(themeIndex, 0),
                                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
                                    ),
                                    child: Stack(
                                      children: [
                                        //텍스트
                                        Positioned(
                                          child: Container(
                                              alignment: Alignment.topLeft,
                                              margin: const EdgeInsets.only(left: 20, top: 12),
                                              child: Text(
                                                typeToString(parseTYPE(themeIndex.toString())),
                                                style: TextStyle(
                                                  color: getThemeColor(themeIndex, 2),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
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
                                              width: 150,
                                              height: 150,
                                              color: getThemeColor(themeIndex, 1).withOpacity(0.25),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 35,
                                          left: 20,
                                          child: Icon(
                                            Icons.water_drop_outlined,
                                            size: 29,
                                            color: getThemeColor(themeIndex, 1),
                                          ),
                                        ),
                                        Positioned(
                                          top: 35,
                                          left: 56,
                                          child: Text(
                                            "${data.selectData.weight[0]} g",
                                            style: TextStyle(
                                              color: getThemeColor(themeIndex, 1),
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),

                                        //오일 내용
                                        Center(
                                            child: Container(
                                                margin: const EdgeInsets.only(top: 80, left: leftPadding, right: leftPadding),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        ResultOilBox("오일\n${data.selectData.data[0].length}", themeIndex, 1),
                                                        ResultOilBox("슈퍼팻\n${data.selectData.data[1].length}", themeIndex, 2),
                                                        ResultOilBox("첨가물\n${data.selectData.data[2].length}", themeIndex, 3),
                                                      ],
                                                    ),
                                                    Visibility(
                                                      visible: menuMng.showOilDetails > 0,
                                                      child: Container(
                                                        width: double.maxFinite,
                                                        height: ((menuMng.showOilDetails > 0 ? data.selectData.data[menuMng.showOilDetails - 1].length : 0) * oilBoxSize + 70),
                                                        decoration: BoxDecoration(
                                                          borderRadius: const BorderRadius.only(bottomRight: Radius.circular(15), bottomLeft: Radius.circular(15)),
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
                                                                    log(data.selectData.data.toString());
                                                                    return SizedBox(
                                                                      height: oilBoxSize,
                                                                      child: Row(
                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            oilMng.oils[data.selectData.data[menuMng.showOilDetails - 1].keys.elementAt(index)]!.korean,
                                                                            style: TextStyle(
                                                                              color: getThemeColor(themeIndex, 0),
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize: 15,

                                                                            ),
                                                                          ),
                                                                          Text(
                                                                            "${data.selectData.data[menuMng.showOilDetails - 1].values.elementAt(index).split('`')[0]}g",
                                                                            style: TextStyle(
                                                                              color: getThemeColor(themeIndex, 0),
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize: 15,

                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    );
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
                                                                  fontSize: 15,
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
                                                                  height: 35,
                                                                  child: Text(
                                                                    "닫기        X",
                                                                    style: TextStyle(
                                                                      color: getThemeColor(themeIndex, 0),
                                                                      fontWeight: FontWeight.bold,
                                                                      fontSize: 15,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
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
                                              fontSize: 13,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                ),

                                AnimatedContainer(
                                    duration: const Duration(milliseconds: 130),
                                    margin: EdgeInsets.only(top: (data.showChart ? 14 : 0), left: leftPadding + 5, right: leftPadding),
                                    height: data.showChart ? 210 : 0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: getThemeColor(themeIndex, 0),
                                    ),
                                    child: ListView(
                                        shrinkWrap: true,
                                        physics: const NeverScrollableScrollPhysics(),
                                        children: [
                                          Stack(
                                            children: [
                                              Positioned(
                                                top: 0,
                                                bottom: 0,
                                                left: 0,
                                                child: Container(
                                                  width: MediaQuery.of(context).size.width * 0.365,
                                                  decoration: BoxDecoration(
                                                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
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
                                                        ),
                                                      ),
                                                      Text(
                                                        "불포화",
                                                        style: TextStyle(
                                                          color: getThemeColor(themeIndex, 1),
                                                          fontWeight: FontWeight.bold,
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
                                  margin: EdgeInsets.only(left: leftPadding, top: 15, bottom: 15, right: 15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      ResultValueBox(themeIndex, "오일양", "${data.selectData.weight[1] + data.selectData.weight[2]}g"),
                                      ResultValueBox(themeIndex, "Lye 양", "${data.resultLye.round()}g"),
                                      ResultValueBox(themeIndex, "정제수 양", "${data.getValue(2)}%\n(${data.resultWater.round()}g)"),
                                    ],
                                  ),
                                ),

                                //메모
                                Container(
                                  margin: const EdgeInsets.only(left: leftPadding, right: 15),
                                  child: CustomTextField((String str) {}, index: themeIndex, str: data.selectData.memo, maxLines: 3, height: 80, radius: 15,),
                                ),
                              ],
                            ),
                          )
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        height: 70,
                        child: Stack(
                          children: [
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
                                    dataMng.initData(menuMng.index == 1);
                                    dataMng.data = data.selectData;
                                    data.init();
                                    pageMng.changeScene(context, menuMng.index);
                                  },
                                  splashColor: getThemeColor(themeIndex, 1).withOpacity(0.3),
                                  highlightColor: getThemeColor(themeIndex, 1).withOpacity(0.3),
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: getThemeColor(themeIndex, 1), width: 3),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: SvgPicture.asset(
                                      "assets/icon/edit.svg",
                                      width: 15,
                                      height: 15,
                                      fit: BoxFit.none,
                                      color: getThemeColor(themeIndex, 1),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 65,
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
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: getThemeColor(themeIndex, 1), width: 3),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: SvgPicture.asset(
                                      "assets/icon/chart.svg",
                                      width: 15,
                                      height: 15,
                                      fit: BoxFit.none,
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
                                    padding: EdgeInsets.all(15),
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
                          ],
                        ),
                      ),
                    ],
                  )
              ),
            ),
          ),
        ],
      ),
    );
  }
}