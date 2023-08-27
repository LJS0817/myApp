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
import 'package:provider/provider.dart';
import 'package:isma/custom/graph.dart';

class ResultView extends StatelessWidget {

  static const double leftPadding = 15;
  int themeIndex = 0;
  bool showChart = false;

  ResultView(int idx, {super.key}) {
    themeIndex = idx;
  }

  @override
  Widget build(BuildContext context) {
    Mng data = Provider.of<Mng>(context);
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
                                  height: 190,
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
                                          "${data.selectData.weight} g",
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
                                            margin: const EdgeInsets.only(top: 50, left: leftPadding, right: leftPadding),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                ResultOilBox("오일\n${data.selectData.oil_index.length}개", themeIndex),
                                                ResultOilBox("슈퍼팻\n${data.selectData.super_index.length}개", themeIndex),
                                                ResultOilBox("첨가물\n${data.selectData.add_index.length}개", themeIndex),
                                              ],
                                            ),
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
                                  duration: Duration(milliseconds: 130),
                                  margin: EdgeInsets.only(top: (data.showChart ? 15 : 0), left: leftPadding + 5, right: leftPadding),
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
                                                child: Container(
                                                  height: 210,
                                                  width: 138,
                                                  decoration: BoxDecoration(
                                                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
                                                    color: getThemeColor(themeIndex, 1).withOpacity(0.6),
                                                  ),
                                                )
                                            ),
                                            Container(
                                                padding: const EdgeInsets.symmetric(vertical: 10),
                                                child:
                                                Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                      children: [
                                                        CustomChartBar(themeIndex, 100, 0, false),
                                                        CustomChartBar(themeIndex, 100, 1, false),
                                                        CustomChartBar(themeIndex, 100, 2, false),
                                                        CustomChartBar(themeIndex, 100, 3, false),

                                                        CustomChartBar(themeIndex, 100, 4, true),
                                                        CustomChartBar(themeIndex, 100, 5, true),
                                                        CustomChartBar(themeIndex, 100, 6, true),
                                                        CustomChartBar(themeIndex, 100, 7, true),
                                                        CustomChartBar(themeIndex, 100, 8, true),
                                                      ],
                                                    ),
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
                                                    )
                                                  ],
                                                )
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
                                    ResultValueBox(themeIndex, "오일양", "1,000,000g"),
                                    ResultValueBox(themeIndex, "Lye 양", "10,000g"),
                                    ResultValueBox(themeIndex, "정제수 양", "100%\n(10,000g)"),
                                  ],
                                ),
                              ),

                              //메모
                              CustomTextField(index: themeIndex, str: "메모\n메모\n메모\n메모\n메모\n메모\n메모", maxLines: 3, height: 80, radius: 15,),
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