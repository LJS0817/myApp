import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:isma/config/define.dart';
import 'package:isma/mng/OilMng.dart';
import 'package:isma/mng/MenuMng.dart';
import 'package:isma/mng/Mng.dart';
import 'package:provider/provider.dart';

class ResultOilDetailsContainer extends StatelessWidget {
  double _size = 0;
  int themeIndex = 0;
  int index = 0;

  ResultOilDetailsContainer(double size, int color, int idx, {super.key}) {
    _size = size;
    themeIndex = color;
    index = idx;
  }

  Widget oilDetails(BuildContext context) {
    Mng data = Provider.of<Mng>(context);
    MenuMng menuMng = Provider.of<MenuMng>(context);
    OilMng oilMng = Provider.of<OilMng>(context);

    String percent = "";
    try {
      percent = (int.parse(data.selectData.data[menuMng.showOilDetails - 1].values.elementAt(index).split('`')[0]) / data.selectData.weight[1] * 100).round().toString();
    } catch(e) {
      percent = "0";
    }

    return SizedBox(
      height: _size,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: getThemeColor(themeIndex, 0),
                ),
                alignment: Alignment.center,
                child: Text(
                  "$percent%",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: getThemeColor(themeIndex, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.only(right: 10)),
              Column(
                crossAxisAlignment : CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    oilMng.oils(data.selectData.data[menuMng.showOilDetails - 1].keys.elementAt(index)).korean,
                    style: TextStyle(
                      color: getThemeColor(themeIndex, 0),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "Lye  -  ${data.selectData.data[menuMng.showOilDetails - 1].values.elementAt(index).split('`')[2]}g",
                    style: TextStyle(
                      color: getThemeColor(themeIndex, 0).withOpacity(0.5),
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ],
              )
            ],
          ),
          Text(
            "${data.selectData.data[menuMng.showOilDetails - 1].values.elementAt(index).split('`')[0]}g",
            style: TextStyle(
              color: getThemeColor(themeIndex, 0),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  Widget otherDetails(BuildContext context) {
    Mng data = Provider.of<Mng>(context);
    MenuMng menuMng = Provider.of<MenuMng>(context);
    OilMng oilMng = Provider.of<OilMng>(context);

    return SizedBox(
      height: _size,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            oilMng.oils(data.selectData.data[menuMng.showOilDetails - (data.selectData.type.index > 2 ? 0 : 1)].keys.elementAt(index)).korean,
            style: TextStyle(
              color: getThemeColor(themeIndex, 0),
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          Text(
            "${data.selectData.data[menuMng.showOilDetails - (data.selectData.type.index > 2 ? 0 : 1)].values.elementAt(index).split('`')[0]}g",
            style: TextStyle(
              color: getThemeColor(themeIndex, 0),
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  Widget addDetails(BuildContext context) {
    Mng data = Provider.of<Mng>(context);
    MenuMng menuMng = Provider.of<MenuMng>(context);
    List<String> dataList = [];

    if(data.selectData.type.index > 2) {
      if(menuMng.showOilDetails == 1) {
        try {
          dataList = data.selectData.data[0].values.elementAt(index).split('`');
        } catch(e) {
          dataList = data.selectData.data[1].values.elementAt(index - data.selectData.data[0].values.length).split('`');
        }

      } else {
        dataList = data.selectData.data[menuMng.showOilDetails].values.elementAt(index).split('`');
      }
    } else {
      dataList = data.selectData.data[menuMng.showOilDetails - 1].values.elementAt(index).split('`');
    }

    String name = dataList.length > 1 && dataList[1].isNotEmpty ? dataList[1] : "${data.selectData.type.index > 2 && menuMng.showOilDetails == 1 && index >= data.selectData.data[0].values.length ? "[첨] " : ""}[이름없음]";
    String gram = dataList[0].isEmpty || dataList[0] == "null" ? "0" : dataList[0];

    return SizedBox(
      height: _size,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: TextStyle(
              color: getThemeColor(themeIndex, 0),
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          Text(
            "$gram${menuMng.showOilDetails == 4 ? "dr" : "g"}",
            style: TextStyle(
              color: getThemeColor(themeIndex, 0),
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    MenuMng menuMng = Provider.of<MenuMng>(context);
    Mng mng = Provider.of<Mng>(context);
    if(menuMng.showOilDetails == 3 || mng.selectData.type.index > 2) {
      return addDetails(context);
    }
    if(menuMng.showOilDetails == 1) {
      return oilDetails(context);
    } else{
      return otherDetails(context);
    }
  }

}