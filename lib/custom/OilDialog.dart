import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:isma/custom/OilContainer.dart';
import 'package:isma/custom/OilContainerShort.dart';
import 'package:isma/main/main_IndexScreen.dart';
import 'package:provider/provider.dart';

import '../config/define.dart';
import '../mng/DataMng.dart';
import '../mng/PageMng.dart';

class OilDialog extends StatelessWidget {
  const OilDialog({super.key});

  @override
  Widget build(BuildContext context) {
    DataMng dataMngProvider = Provider.of<DataMng>(context);
    PageMng pageMngProvider = Provider.of<PageMng>(context);
    return Visibility(
      visible: pageMngProvider.enableDialog,
      child: SafeArea(
        child: Material(
          color: Colors.black.withOpacity(0.4),
          child: InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: () {
              pageMngProvider.setDialog();
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
                      log("message111");
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
                            "오일 추가",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: getThemeColor(dataMngProvider.getTypeIndex(), 0),
                              fontSize: 20,
                            ),
                          ),
                          const Padding(padding: EdgeInsets.only(top: 10)),
                          Expanded(
                            child: Container(
                              width: double.maxFinite,
                              child: Column(
                                children: [
                                  Expanded(
                                    child:  ScrollConfiguration(
                                      behavior: const ScrollBehavior().copyWith(overscroll: false),
                                      child:ListView.builder(
                                        itemCount: oilMng.oils.length + oilMng.userOils.length,
                                        itemBuilder: (BuildContext con, int idx) {
                                          return OilContainer(idx);
                                        },
                                      ),
                                    ),
                                  ),
                                  const Padding(padding: EdgeInsets.only(top: 7)),
                                  Container(
                                    height: 50,
                                    width: double.maxFinite,
                                    child: ScrollConfiguration(
                                      behavior: const ScrollBehavior().copyWith(overscroll: false),
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: dataMngProvider.data.data[pageMngProvider.index - 1].length,
                                        itemBuilder: (BuildContext con, int idx) {
                                          return OilShortContainer(dataMngProvider.data.data[pageMngProvider.index - 1].keys.elementAt(idx));
                                        },
                                      ),
                                    ),
                                  ),
                                  Container(
                                    color: Colors.black,
                                    height: 50,
                                    alignment: Alignment.bottomRight,
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