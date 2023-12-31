import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:isma/config/define.dart';
import 'package:isma/mng/FileMng.dart';
import 'package:isma/mng/Mng.dart';
import 'package:isma/mng/OilMng.dart';
import 'package:isma/mng/PageMng.dart';
import 'package:provider/provider.dart';

import '../mng/DataMng.dart';

class Footer extends StatelessWidget {
  Footer({super.key});

  @override
  Widget build(BuildContext context) {
    Mng mngProvider = Provider.of<Mng>(context);
    DataMng dataMngProvider = Provider.of<DataMng>(context);
    PageMng pageMngProvider = Provider.of<PageMng>(context);
    FileMng fileMngProvider = Provider.of<FileMng>(context);
    OilMng oilMngProvider = Provider.of<OilMng>(context);

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.09,
      child: Row(
        children: [
          Expanded(
            child: Material(
              color: (pageMngProvider.index > 0) ? getThemeColor(dataMngProvider.getTypeIndex() == 7 ? 1 : dataMngProvider.getTypeIndex(), 0) : Colors.transparent,
              borderRadius: BorderRadius.only(topRight: Radius.circular(pageMngProvider.index > 0 ? 30 : 0)),
              child: InkWell(
                onTap: () {
                  if(pageMngProvider.index > 0) {
                    pageMngProvider.prevPage(dataMngProvider.getTypeIndex(), dataMngProvider.data);
                  } else {
                    dataMngProvider.setSelectedFileName("");
                    mngProvider.selectOilDataIndex = -1;
                    Navigator.of(context).pop();
                  }
                },
                borderRadius: BorderRadius.only(topRight: Radius.circular(pageMngProvider.index > 0 ? 30 : 0)),
                splashColor: getThemeColor(dataMngProvider.getTypeIndex() == 7 ? 1 : dataMngProvider.getTypeIndex(), pageMngProvider.index > 0 ? 1 : 0).withOpacity(0.4),
                highlightColor: getThemeColor(dataMngProvider.getTypeIndex() == 7 ? 1 : dataMngProvider.getTypeIndex(), pageMngProvider.index > 0 ? 1 : 0).withOpacity(0.4),
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
                        color: getThemeColor(dataMngProvider.getTypeIndex() == 7 ? 1 : dataMngProvider.getTypeIndex(), pageMngProvider.index > 0 ? 1 : 0),
                      ),
                      Padding(padding: EdgeInsets.symmetric(horizontal: pageMngProvider.index > 0 ? 2 : 5)),
                      Text(
                        pageMngProvider.index > 0 ? language.getText(TITLE.E_PREV) : language.getText(TITLE.E_EXIT),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                            fontSize: sizeMng.defaultFontSize,
                          color: getThemeColor(dataMngProvider.getTypeIndex() == 7 ? 1 : dataMngProvider.getTypeIndex(), pageMngProvider.index > 0 ? 1 : 0)
                        ),
                      ),
                    ],
                  )
                ),
              ),
            )
          ),
          Visibility(
            visible: pageMngProvider.index > 0,
            child: Expanded(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      if((dataMngProvider.getTypeIndex() < 3 && pageMngProvider.index < 3) || (dataMngProvider.getTypeIndex() < 7 && pageMngProvider.index == 4)) {
                        pageMngProvider.setDialog(1);
                      } else if(dataMngProvider.getTypeIndex() > 2 && dataMngProvider.getTypeIndex() < 7 && pageMngProvider.index == 3) {
                        pageMngProvider.setDialog(2);
                      } else {
                        dataMngProvider.setData(pageMngProvider.index - 1, -dataMngProvider.data.data[pageMngProvider.index - 1].length - 2, '-2', needRefresh: true);
                      }
                    },
                    borderRadius: const BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30)),
                    splashColor: getThemeColor(dataMngProvider.getTypeIndex() == 7 ? 1 : dataMngProvider.getTypeIndex(), 0).withOpacity(0.4),
                    highlightColor: getThemeColor(dataMngProvider.getTypeIndex() == 7 ? 1 : dataMngProvider.getTypeIndex(), 0).withOpacity(0.4),
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
                              color: getThemeColor(dataMngProvider.getTypeIndex() == 7 ? 1 : dataMngProvider.getTypeIndex(), 0),
                            ),
                            const Padding(padding: EdgeInsets.symmetric(vertical: 3)),
                            Text(
                              pageMngProvider.addButtonText(dataMngProvider.getTypeIndex() == 7 ? 1 : dataMngProvider.getTypeIndex(), pageMngProvider.index),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: sizeMng.defaultFontSize,
                                  color: getThemeColor(dataMngProvider.getTypeIndex() == 7 ? 1 : dataMngProvider.getTypeIndex(), 0)
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
                color: getThemeColor(dataMngProvider.getTypeIndex() == 7 ? 1 : dataMngProvider.getTypeIndex(), 0),
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(30)),
                child: InkWell(
                  onTap: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    if(pageMngProvider.index >= pageMngProvider.MAX_INDEX(dataMngProvider.getTypeIndex())) {
                      String fileName = "";
                      pageMngProvider.getBeforeSaveEvent()();
                      pageMngProvider.beforeSave = () {};
                      // log(dataMngProvider.getTypeIndex().toString());
                      if(dataMngProvider.getSelectedFileName().isNotEmpty) {
                        fileName = dataMngProvider.getSelectedFileName();
                      } else {
                        fileName = DateTime.now().toString();
                      }
                      dataMngProvider.setDefaultData();
                      if(dataMngProvider.getTypeIndex() < 3) {
                        mngProvider.calculateData(dataMngProvider.data, context);
                        if(dataMngProvider.getTypeIndex() == 1) {
                          dataMngProvider.data.weight[0] = mngProvider.resultHot[0] + mngProvider.resultHot[1] + mngProvider.resultHot[4];
                          dataMngProvider.data.isReturn = false;
                        } else if(dataMngProvider.data.isReturn) {
                          dataMngProvider.data.weight[0] = dataMngProvider.data.weight[1] + dataMngProvider.data.weight[2] +
                              (mngProvider.resultWater.round() - (mngProvider.resultLye * 0.5).round()) + mngProvider.resultLye.round();
                        } else {
                          dataMngProvider.data.weight[0] = dataMngProvider.data.weight[1] + dataMngProvider.data.weight[2] +
                              mngProvider.resultWater.round() + mngProvider.resultLye.round();
                        }
                      } else if(dataMngProvider.getTypeIndex() < 7) {
                        String result = "";
                        dataMngProvider.data.weight[4] = 0;
                        for(int i = 0; i < dataMngProvider.data.data[3].values.length; i++) {
                          result = dataMngProvider.data.data[3].values.elementAt(i).split('`')[0];
                          dataMngProvider.data.weight[4] += int.parse(result);
                        }
                      } else {
                        oilMngProvider.addOil(dataMngProvider.getOilData()!, idx: mngProvider.selectOilDataIndex);
                        mngProvider.selectOilDataIndex = -1;
                      }
                      fileMngProvider.setData(pageMngProvider.typeToInt(dataMngProvider.data.type), fileName, dataMngProvider.toString());
                      fileMngProvider.writeFile(fileName.replaceAll('.txt', ''), pageMngProvider.typeToString(dataMngProvider.data.type), dataMngProvider.toString());
                      Navigator.of(context).pop();
                    } else {
                      pageMngProvider.nextPage(dataMngProvider.getTypeIndex(), dataMngProvider.data);
                    }
                  },
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(pageMngProvider.index < pageMngProvider.MAX_INDEX(dataMngProvider.getTypeIndex()) ? 30 : 0)),
                  splashColor: getThemeColor(dataMngProvider.getTypeIndex() == 7 ? 1 : dataMngProvider.getTypeIndex(), 1).withOpacity(0.4),
                  highlightColor: getThemeColor(dataMngProvider.getTypeIndex() == 7 ? 1 : dataMngProvider.getTypeIndex(), 1).withOpacity(0.4),
                  child: Container(
                      height: double.maxFinite,
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(padding: EdgeInsets.symmetric(horizontal: 7)),
                          Text(
                           pageMngProvider.index < pageMngProvider.MAX_INDEX(dataMngProvider.getTypeIndex()) ? language.getText(TITLE.E_NEXT) : language.getText(TITLE.E_SAVE),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: sizeMng.defaultFontSize,
                                color: getThemeColor(dataMngProvider.getTypeIndex() == 7 ? 1 : dataMngProvider.getTypeIndex(), 1)
                            ),
                          ),
                          Padding(padding: EdgeInsets.symmetric(horizontal: pageMngProvider.index < pageMngProvider.MAX_INDEX(dataMngProvider.getTypeIndex()) ? 2 : 5)),
                          SvgPicture.asset(
                            pageMngProvider.index < pageMngProvider.MAX_INDEX(dataMngProvider.getTypeIndex()) ? 'assets/icon/arrow_right.svg' : 'assets/icon/save.svg',
                            width: pageMngProvider.index < pageMngProvider.MAX_INDEX(dataMngProvider.getTypeIndex()) ? 20 : 15,
                            height: pageMngProvider.index < pageMngProvider.MAX_INDEX(dataMngProvider.getTypeIndex()) ? 20 : 15,
                            color: getThemeColor(dataMngProvider.getTypeIndex() == 7 ? 1 : dataMngProvider.getTypeIndex(), 1),
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