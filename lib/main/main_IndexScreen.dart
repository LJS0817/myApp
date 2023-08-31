import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:isma/custom/OilMng.dart';
import 'package:isma/mng/MenuMng.dart';
import 'package:isma/mng/Mng.dart';
import 'package:isma/result/resultView.dart';
import 'package:provider/provider.dart';

import 'package:isma/custom/iconButton.dart';
import 'package:isma/main/main_beauty.dart';
import 'package:isma/main/main_oil.dart';
import 'package:isma/main/main_setting.dart';
import 'package:isma/main/main_soap.dart';
import 'package:isma/config/Oil.dart';
import 'package:isma/config/colors.dart';
import 'package:isma/config/define.dart';


class IndexScreen extends StatefulWidget {
  @override
  _IndexScreenState createState() => _IndexScreenState();
}

void loadAsset(BuildContext context) async {
  String s = await DefaultAssetBundle.of(context).loadString(fileMng.dataPath);
  List<String> list = s.split('\n');
  List<String> data = [];
  late Oil oil;
  for(int i = 0; i < list.length; i++) {
    try{
      data = list[i].split(',');
      oil = Oil(korean: data[1], english: data[2], NaOH: double.parse(data[3]),
          KOH: double.parse(data[4]), fat: List.generate(FAT_TYPE.LENGTH.index,
                  (index) => double.tryParse(data[index + 5]) ?? 0.0));
      list = s.split('\n');
      //data added
      //오일 데이터 = oil
      oilMng.oils[int.parse(data[0])] = oil;
    } catch(ex) {
      log("ERROR : $ex");
    }
  }
  //key : index
  //korean,english,NaOH,KOH,Lauric,Myristic,Palmitic,Stearic,Palmitoleic,Ricinoleic,Oleic,Linoleic,Linolenic
}

Widget getIndex(BuildContext context) {
  int idx = Provider.of<MenuMng>(context).getIndex();
  if(idx == 0) { return mainSoapScreen(); }
  if(idx == 1) { return mainBeautyScreen(); }
  if(idx == 2) { return mainOilScreen(); }
  else { return mainSettingScreen(); }
}

Color getMainColor(BuildContext context) {
  MenuMng menu = Provider.of<MenuMng>(context);

  return mainTheme[menu.getIndex()];
}

Color getSecondColor(BuildContext context) {
  MenuMng menu = Provider.of<MenuMng>(context);

  return mainTextColor[menu.getIndex()];
}

Widget BottomBar(BuildContext context) {

  MenuMng menu = Provider.of<MenuMng>(context);

  return Positioned(
    bottom: 0,
    child: Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: 0,
            child: SizedBox(
              height: 70,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Expanded(
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: menu.aniTime),
                      width: 100,
                      height: 70,
                      decoration: BoxDecoration(
                        color: getMainColor(context),
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(47),
                        ),
                      ),
                    ),
                  ),

                  const Padding(padding: EdgeInsets.symmetric(horizontal: 31)),
                  Expanded(
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: menu.aniTime),
                      width: 100,
                      height: 70,
                      decoration: BoxDecoration(
                        color: getMainColor(context),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(47),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: AnimatedContainer(
              duration: Duration(milliseconds: menu.aniTime),
              width: 90,
              height: 41,
              color: getMainColor(context),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 70,
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  iconButton('assets/icon/soap.svg', 0, () { menu.setIndex(0); }),
                  iconButton('assets/icon/beauty.svg', 1, () { menu.setIndex(1); }),
                  const SizedBox(width: 82, height: 80, ),
                  iconButton('assets/icon/oil.svg', 2, () { menu.setIndex(2); }, size: 16),
                  iconButton('assets/icon/settings.svg', 3, () { menu.setIndex(3); }),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 21,
            child: AnimatedContainer(
              duration: Duration(milliseconds: menu.aniTime),
              width: 80,
              height: 50,
              decoration: BoxDecoration(
                color: getSecondColor(context),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(500),
                  bottomRight: Radius.circular(500),
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 35,
              child: Material(
                borderRadius: BorderRadius.circular(500),
                color: mainTheme[menu.getIndex()],
                child: InkWell(
                  borderRadius: BorderRadius.circular(500),
                  splashColor: getSecondColor(context).withOpacity(0.2),
                  highlightColor: getSecondColor(context).withOpacity(0.5),
                  onTap: () {
                    pageMng.changeScene(context, menu.index);
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: menuMng.aniTime),
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(500.0),
                        border: Border.all(
                           strokeAlign: StrokeAlign.inside,
                            width: 4,
                            color: getMainColor(context).withOpacity(0.36)
                        )
                    ),
                    child: menuMng.isConfig ? SvgPicture.asset(
                      'assets/icon/save.svg',
                      width: 29,
                      height: 29,
                      color: themeIconColors[menu.getIndex()],
                      fit: BoxFit.none,) : Icon(
                      Icons.add_rounded,
                      size: 30,
                      color: themeIconColors[menu.getIndex()],
                    ),
                  ),
                ),
              )
          ),
        ],
      ),
    ),
  );
}

class _IndexScreenState extends State<IndexScreen> {

  @override
  void initState() {
    super.initState();
    loadAsset(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getSecondColor(context),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: getMainColor(context),
        title: Text("테스트"),
      ),
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: getIndex(context),
          ),
          BottomBar(context),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: ResultView(Provider.of<Mng>(context).selectData.type.index),
          ),
        ],
      ),
    );
  }
}