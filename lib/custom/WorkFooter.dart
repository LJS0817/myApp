import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:isma/config/define.dart';
import 'package:isma/mng/FileMng.dart';
import 'package:isma/mng/Mng.dart';
import 'package:isma/mng/PageMng.dart';
import 'package:provider/provider.dart';

import '../mng/DataMng.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  String addText(int page, int type) {
    if(page == 1) {
      return "오일";
    } else if(page == 2 && type != 1) {
      return "슈퍼팻";
    } else {
      return "첨가물";
    }
  }

  @override
  Widget build(BuildContext context) {
    Mng mngProvider = Provider.of<Mng>(context);
    DataMng dataMngProvider = Provider.of<DataMng>(context);
    PageMng pageMngProvider = Provider.of<PageMng>(context);
    FileMng fileMngProvider = Provider.of<FileMng>(context);
    return SizedBox(
      height: 70,
      child: Row(
        children: [
          Expanded(
            child: Material(
              color: (pageMngProvider.index > 0 && dataMngProvider.getTypeIndex() < 3) ? getThemeColor(dataMngProvider.getTypeIndex(), 0) : Colors.transparent,
              borderRadius: BorderRadius.only(topRight: Radius.circular(pageMngProvider.index > 0 ? 30 : 0)),
              child: InkWell(
                onTap: () {
                  if(pageMngProvider.index > 0) {
                    pageMngProvider.prevPage(dataMngProvider.getTypeIndex());
                  } else {
                    dataMngProvider.setSelectedFileName("");
                    Navigator.of(context).pop();
                  }
                },
                borderRadius: BorderRadius.only(topRight: Radius.circular(pageMngProvider.index > 0 && dataMngProvider.getTypeIndex() < 3 ? 30 : 0)),
                splashColor: getThemeColor(dataMngProvider.getTypeIndex(), pageMngProvider.index > 0 && dataMngProvider.getTypeIndex() < 3 ? 1 : 0).withOpacity(0.4),
                highlightColor: getThemeColor(dataMngProvider.getTypeIndex(), pageMngProvider.index > 0 && dataMngProvider.getTypeIndex() < 3 ? 1 : 0).withOpacity(0.4),
                child: Container(
                  height: double.maxFinite,
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        pageMngProvider.index > 0 ? 'assets/icon/arrow_left.svg' : 'assets/icon/exit.svg',
                        width: pageMngProvider.index > 0 ? 20: 15,
                        height: pageMngProvider.index > 0 ? 20 : 15,
                        color: getThemeColor(dataMngProvider.getTypeIndex(), pageMngProvider.index > 0 && dataMngProvider.getTypeIndex() < 3 ? 1 : 0),
                      ),
                      Padding(padding: EdgeInsets.symmetric(horizontal: pageMngProvider.index > 0 && dataMngProvider.getTypeIndex() < 3 ? 2 : 5)),
                      Text(
                        pageMngProvider.index > 0 ? "이전" : "나가기",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: getThemeColor(dataMngProvider.getTypeIndex(), pageMngProvider.index > 0 && dataMngProvider.getTypeIndex() < 3 ? 1 : 0)
                        ),
                      ),
                    ],
                  )
                ),
              ),
            )
          ),
          Visibility(
            visible: pageMngProvider.index > 0 && dataMngProvider.getTypeIndex() < 3,
            child: Expanded(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      if(pageMngProvider.index < 3) {
                        pageMngProvider.setDialog();
                      } else {
                        dataMngProvider.setData(2, -dataMngProvider.data.data[2].length - 2, '-2');
                      }
                      /*log("message");
                      pageMngProvider.setDialog();*/
                    },
                    borderRadius: const BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30)),
                    splashColor: getThemeColor(dataMngProvider.getTypeIndex(), 0).withOpacity(0.4),
                    highlightColor: getThemeColor(dataMngProvider.getTypeIndex(), 0).withOpacity(0.4),
                    child: Container(
                        height: double.maxFinite,
                        color: Colors.transparent,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/icon/add.svg',
                              width: 20,
                              height: 20,
                              color: getThemeColor(dataMngProvider.getTypeIndex(), 0),
                            ),
                            const Padding(padding: EdgeInsets.symmetric(vertical: 3)),
                            Text(
                              addText(pageMngProvider.index, dataMngProvider.getTypeIndex()),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: getThemeColor(dataMngProvider.getTypeIndex(), 0)
                              ),
                            ),
                          ],
                        )
                    ),
                  ),
                )
            ),
          ),
          Expanded(
              child: Material(
                color: getThemeColor(dataMngProvider.getTypeIndex(), 0),
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(30)),
                child: InkWell(
                  onTap: () {
                    if(pageMngProvider.index >= pageMngProvider.MAX_INDEX(dataMngProvider.getTypeIndex())) {
                      String fileName = "";
                      log(dataMngProvider.getSelectedFileName());
                      if(dataMngProvider.getSelectedFileName().isNotEmpty) {
                        fileName = dataMngProvider.getSelectedFileName();
                      } else {
                        fileName = DateTime.now().toString();
                      }
                      dataMngProvider.setDefaultData();
                      mngProvider.calculateData(dataMngProvider.data);
                      dataMngProvider.data.weight[0] = dataMngProvider.data.weight[1] + dataMngProvider.data.weight[2] +
                          mngProvider.resultWater.round() + mngProvider.resultLye.round();
                      fileMngProvider.setData(pageMngProvider.typeToInt(dataMngProvider.data.type), fileName, dataMngProvider.toString());
                      fileMngProvider.writeFile(fileName.replaceAll('.txt', ''), pageMngProvider.typeToString(dataMngProvider.data.type), dataMngProvider.toString());
                      Navigator.of(context).pop();
                    } else {
                      pageMngProvider.nextPage(dataMngProvider.getTypeIndex());
                    }
                  },
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(pageMngProvider.index < pageMngProvider.MAX_INDEX(dataMngProvider.getTypeIndex()) ? 30 : 0)),
                  splashColor: getThemeColor(dataMngProvider.getTypeIndex(), 1).withOpacity(0.4),
                  highlightColor: getThemeColor(dataMngProvider.getTypeIndex(), 1).withOpacity(0.4),
                  child: Container(
                      height: double.maxFinite,
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(padding: EdgeInsets.symmetric(horizontal: 7)),
                          Text(
                            pageMngProvider.index < pageMngProvider.MAX_INDEX(dataMngProvider.getTypeIndex()) ? "다음" : "저장",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: getThemeColor(dataMngProvider.getTypeIndex(), 1)
                            ),
                          ),
                          Padding(padding: EdgeInsets.symmetric(horizontal: pageMngProvider.index < pageMngProvider.MAX_INDEX(dataMngProvider.getTypeIndex()) ? 2 : 5)),
                          SvgPicture.asset(
                            pageMngProvider.index < pageMngProvider.MAX_INDEX(dataMngProvider.getTypeIndex()) ? 'assets/icon/arrow_right.svg' : 'assets/icon/save.svg',
                            width: pageMngProvider.index < pageMngProvider.MAX_INDEX(dataMngProvider.getTypeIndex()) ? 20 : 15,
                            height: pageMngProvider.index < pageMngProvider.MAX_INDEX(dataMngProvider.getTypeIndex()) ? 20 : 15,
                            color: getThemeColor(dataMngProvider.getTypeIndex(), 1),
                          ),
                        ],
                      )
                  ),
                ),
              )
          ),
        ],
      ),
    );
  }
}