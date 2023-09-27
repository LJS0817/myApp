import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:isma/custom/OilContainer.dart';
import 'package:isma/custom/OilContainerShort.dart';
import 'package:isma/custom/uOilContainer.dart';
import 'package:isma/main/main_IndexScreen.dart';
import 'package:isma/mng/OilMng.dart';
import 'package:provider/provider.dart';

import '../config/define.dart';
import '../mng/DataMng.dart';
import '../mng/PageMng.dart';

class uOilDialog extends StatelessWidget {
  const uOilDialog({super.key});

  @override
  Widget build(BuildContext context) {
    DataMng dataMngProvider = Provider.of<DataMng>(context);
    PageMng pageMngProvider = Provider.of<PageMng>(context);
    OilMng oilMng = Provider.of<OilMng>(context);
    return Visibility(
      visible: pageMngProvider.enableDialog == 2,
      child: SafeArea(
        child: Material(
          color: Colors.black.withOpacity(0.4),
          child: InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: () {
              pageMngProvider.setDialog(0);
            },
            child: Container(
                alignment: Alignment.center,
                height: double.maxFinite,
                margin: const EdgeInsets.symmetric(vertical: 55, horizontal: 20),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    onTap: () {
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                      decoration: BoxDecoration(
                        color: getSecondColor(context),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "유화제 추가",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: getThemeColor(dataMngProvider.getTypeIndex(), 0),
                              fontSize: 20,
                            ),
                          ),
                          const Padding(padding: EdgeInsets.only(top: 10)),
                          Expanded(
                            child: SizedBox(
                              width: double.maxFinite,
                              child: Column(
                                children: [
                                  Expanded(
                                    child:  ScrollConfiguration(
                                      behavior: const ScrollBehavior().copyWith(overscroll: false),
                                      child:ListView.builder(
                                        itemCount: oilMng.Udata.length,
                                        itemBuilder: (BuildContext con, int idx) {
                                          return uOilContainer(100000 + idx);
                                        },
                                      ),
                                    ),
                                  ),
                                  const Padding(padding: EdgeInsets.only(top: 7)),
                                  SizedBox(
                                    height: 50,
                                    width: double.maxFinite,
                                    child: ScrollConfiguration(
                                      behavior: const ScrollBehavior().copyWith(overscroll: false),
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: dataMngProvider.data.data[pageMngProvider.getIndexSub1()].length,
                                        itemBuilder: (BuildContext con, int idx) {
                                          int i = dataMngProvider.data.data[pageMngProvider.getIndexSub1()].keys.elementAt(idx);
                                          return OilShortContainer(i, oilMng.oils(i).english);
                                        },
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    alignment: Alignment.bottomRight,
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        borderRadius: BorderRadius.circular(100),
                                        splashColor: getThemeColor(dataMngProvider.getTypeIndex(), 0).withOpacity(0.3),
                                        highlightColor: getThemeColor(dataMngProvider.getTypeIndex(), 0).withOpacity(0.3),
                                        onTap: () {
                                          pageMngProvider.setDialog(0);
                                        },
                                        child: Container(
                                          width: 50,
                                          height: 50,
                                          color: Colors.transparent,
                                          alignment: Alignment.center,
                                          child: Text(
                                            "확인",
                                            style: TextStyle(
                                              color: getThemeColor(dataMngProvider.getTypeIndex(), 0),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
            ),
          ),
        ),
      ),
    );
  }
}