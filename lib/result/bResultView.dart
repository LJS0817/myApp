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

    log(menuMng.showOilDetails.toString());

    return Container(
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
                        padding: EdgeInsets.only(left: leftPadding + 5, right: leftPadding, bottom: 15),
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
                          height: (menuMng.showOilDetails > 0) ? 260 + (menuMng.showOilDetails > 0 ? (data.selectData.type.index > 2 ? (menuMng.showOilDetails == 1 ? data.selectData.data[0].length + data.selectData.data[1].length : data.selectData.data[menuMng.showOilDetails].length) : data.selectData.data[menuMng.showOilDetails - 1].length) : 0) * oilBoxSize : 190,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(left: leftPadding),
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
                                      margin: EdgeInsets.only(top: 80, left: leftPadding, right: leftPadding),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              ResultOilBox("수상층\n${data.selectData.data[0].length + data.selectData.data[1].length}", themeIndex, 1, w: 70, h: 70,),
                                              ResultOilBox("유상층\n${data.selectData.data[2].length}", themeIndex, 2, w: 70, h: 70,),
                                              ResultOilBox("유화제\n${data.selectData.data[3].length}", themeIndex, 3, w: 70, h: 70,),
                                              ResultOilBox("EO\n${data.selectData.data[4].length}", themeIndex, 4, w: 70, h: 70,),
                                            ],
                                          ),
                                          Visibility(
                                              visible: menuMng.showOilDetails > 0,
                                              child: Transform.translate(
                                                offset: const Offset(0, -1),
                                                child: Container(
                                                  width: double.maxFinite,

                                                  height: ((menuMng.showOilDetails > 0 ? (data.selectData.type.index > 2 ? (menuMng.showOilDetails == 1 ? data.selectData.data[0].length + data.selectData.data[1].length : data.selectData.data[menuMng.showOilDetails].length) : data.selectData.data[menuMng.showOilDetails - 1].length) : 0) * oilBoxSize + 70),
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
                                                          "총합    -    ${(data.selectData.type.index > 2 && menuMng.showOilDetails == 1 ? data.selectData.weight[1] + data.selectData.weight[2] : data.selectData.weight[1 + menuMng.showOilDetails])}${menuMng.showOilDetails == 4 ? "dr" : "g"}",
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

                      const Padding(padding: EdgeInsets.only(bottom: 15)),

                      //메모
                      Container(
                        margin: EdgeInsets.only(left: leftPadding, right: 15),
                        child: CustomTextField((String str) {}, index: themeIndex, defaultValue: data.selectData.memo, maxLines: 11, height: 210, radius: 15,),
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
                          width: 100,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(color: getThemeColor(themeIndex, 1), width: 3),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: SvgPicture.asset(
                            "assets/icon/delete.svg",
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
                          data.init();
                          log(dataMng.data.toString());
                          pageMng.UpdateText(dataMng.data);
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
    );
  }
}