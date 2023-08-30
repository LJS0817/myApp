import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:isma/config/define.dart';
import 'package:isma/mng/PageMng.dart';
import 'package:provider/provider.dart';

import '../mng/DataMng.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    DataMng dataMngProvider = Provider.of<DataMng>(context);
    PageMng pageMng = Provider.of<PageMng>(context);
    return SizedBox(
      height: 70,
      child: Row(
        children: [
          Expanded(
            child: Material(
              color: pageMng.index > 0 ? getThemeColor(dataMngProvider.getTypeIndex(), 0) : Colors.transparent,
              borderRadius: BorderRadius.only(topRight: Radius.circular(pageMng.index > 0 ? 30 : 0)),
              child: InkWell(
                onTap: () {
                  if(pageMng.index > 0) {
                    pageMng.prevPage();
                  } else {
                    Navigator.of(context).pop();
                  }
                },
                borderRadius: BorderRadius.only(topRight: Radius.circular(pageMng.index > 0 ? 30 : 0)),
                splashColor: getThemeColor(dataMngProvider.getTypeIndex(), pageMng.index > 0 ? 1 : 0).withOpacity(0.4),
                highlightColor: getThemeColor(dataMngProvider.getTypeIndex(), pageMng.index > 0 ? 1 : 0).withOpacity(0.4),
                child: Container(
                  height: double.maxFinite,
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        pageMng.index > 0 ? 'assets/icon/arrow_left.svg' : 'assets/icon/exit.svg',
                        width: pageMng.index > 0 ? 20: 15,
                        height: pageMng.index > 0 ? 20 : 15,
                        color: getThemeColor(dataMngProvider.getTypeIndex(), pageMng.index > 0 ? 1 : 0),
                      ),
                      Padding(padding: EdgeInsets.symmetric(horizontal: pageMng.index > 0 ? 2 : 5)),
                      Text(
                        pageMng.index > 0 ? "이전" : "나가기",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: getThemeColor(dataMngProvider.getTypeIndex(), pageMng.index > 0 ? 1 : 0)
                        ),
                      ),
                    ],
                  )
                ),
              ),
            )
          ),
          Visibility(
            visible: pageMng.index > 0 && pageMng.index < pageMng.MAX_INDEX,
            child: Expanded(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {

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
                              "추가",
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
                    pageMng.nextPage();
                  },
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(30)),
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
                            "다음",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: getThemeColor(dataMngProvider.getTypeIndex(), 1)
                            ),
                          ),
                          Padding(padding: EdgeInsets.symmetric(horizontal: pageMng.index < pageMng.MAX_INDEX ? 2 : 5)),
                          SvgPicture.asset(
                            pageMng.index < pageMng.MAX_INDEX ? 'assets/icon/arrow_right.svg' : 'assets/icon/save.svg',
                            width: pageMng.index < pageMng.MAX_INDEX ? 20 : 15,
                            height: pageMng.index < pageMng.MAX_INDEX ? 20 : 15,
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