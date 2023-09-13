import 'package:flutter/material.dart';
import 'package:isma/config/define.dart';
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
                  "${(int.parse(data.selectData.data[menuMng.showOilDetails - 1].values.elementAt(index).split('`')[0]) / data.selectData.weight[1] * 100).round()}%",
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
    return SizedBox(
      height: _size,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            oilMng.oils(data.selectData.data[menuMng.showOilDetails - 1].keys.elementAt(index)).korean,
            style: TextStyle(
              color: getThemeColor(themeIndex, 0),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
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

  Widget addDetails(BuildContext context) {
    Mng data = Provider.of<Mng>(context);
    MenuMng menuMng = Provider.of<MenuMng>(context);
    return SizedBox(
      height: _size,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            data.selectData.data[menuMng.showOilDetails - 1].values.elementAt(index).split('`')[1],
            style: TextStyle(
              color: getThemeColor(themeIndex, 0),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
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