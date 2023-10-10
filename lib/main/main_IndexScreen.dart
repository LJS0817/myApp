import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:isma/mng/OilMng.dart';
import 'package:isma/mng/DataMng.dart';
import 'package:isma/mng/FileMng.dart';
import 'package:isma/mng/MenuMng.dart';
import 'package:isma/mng/Mng.dart';
import 'package:isma/mng/PageMng.dart';
import 'package:isma/result/resultView.dart';
import 'package:permission_handler/permission_handler.dart';
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
  String s = await DefaultAssetBundle.of(context).loadString(Provider.of<FileMng>(context).dataPath);
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
      Provider.of<OilMng>(context, listen: false).default_oils[int.parse(data[0]) - 1] = oil;
    } catch(ex) {
      log("ERROR : $ex");
    }
  }
  //key : index
  //korean,english,NaOH,KOH,Lauric,Myristic,Palmitic,Stearic,Palmitoleic,Ricinoleic,Oleic,Linoleic,Linolenic
}

void loadUAsset(BuildContext context) async {
  String s = await DefaultAssetBundle.of(context).loadString(Provider.of<FileMng>(context).UdataPath);
  List<String> list = s.split('\n');
  late Oil oil;
  for(int i = 0; i < list.length; i++) {
    try{
      oil = Oil(korean: list[i].split(',')[0], english: list[i].split(',')[1], NaOH: 0,
          KOH: 0, fat: List.generate(FAT_TYPE.LENGTH.index,
                  (index) => 0));
      //data added
      Provider.of<OilMng>(context, listen: false).Udata[i] = oil;
      list = s.split('\n');
    } catch(ex) {
      log("ERROR : $ex");
    }
  }
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
  Mng mng = Provider.of<Mng>(context);
  MenuMng menuMng = Provider.of<MenuMng>(context);
  PageMng pageMng = Provider.of<PageMng>(context);
  DataMng dataMng = Provider.of<DataMng>(context);


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
                      duration: const Duration(milliseconds: aniTime),
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
                      duration: const Duration(milliseconds: aniTime),
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
              duration: const Duration(milliseconds: aniTime),
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
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  iconButton('assets/icon/soap.svg', 0, () { menuMng.setIndex(0); mng.changePage(Provider.of<FileMng>(context, listen: false).data[3]['config.txt'].toString());  }),
                  iconButton('assets/icon/beauty.svg', 1, () { menuMng.setIndex(1); mng.changePage(Provider.of<FileMng>(context, listen: false).data[3]['config.txt'].toString());   }),
                  Expanded(child: Container(),),
                  iconButton('assets/icon/oil.svg', 2, () { menuMng.setIndex(2); mng.changePage(Provider.of<FileMng>(context, listen: false).data[3]['config.txt'].toString());   }, size: 16),
                  iconButton('assets/icon/settings.svg', 3, () { menuMng.setIndex(3); mng.changePage(Provider.of<FileMng>(context, listen: false).data[3]['config.txt'].toString());   }),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 21,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: aniTime),
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
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 240),
                decoration: BoxDecoration(
                  color: mainTheme[menuMng.getIndex()],
                  borderRadius: BorderRadius.circular(500),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(500),
                    splashColor: getSecondColor(context).withOpacity(0.2),
                    highlightColor: getSecondColor(context).withOpacity(0.5),
                    onTap: () {
                      if(menuMng.isConfig) {
                        FileMng fileMng = Provider.of<FileMng>(context, listen: false);
                        fileMng.writeFile("config", "UserData_Config", mng.getThemeSaveString());
                        fileMng.setData(3, "config.txt", mng.getThemeSaveString());
                      } else {
                        pageMng.index = 0;
                        dataMng.initData(menuMng.index);
                        dataMng.selectFileName = "";
                        mng.selectData = Data();
                        menuMng.init();

                        pageMng.UpdateText(dataMng.data);
                        pageMng.changeScene(context, menuMng.index);
                      }
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(500.0),
                          border: Border.all(
                              strokeAlign: BorderSide.strokeAlignOutside,
                              width: 4,
                              color: getMainColor(context).withOpacity(0.5)
                          )
                      ),
                      child: menuMng.isConfig ? SvgPicture.asset(
                        'assets/icon/save.svg',
                        width: 29,
                        height: 29,
                        color: themeIconColors[menuMng.getIndex()],
                        fit: BoxFit.none,) : Icon(
                        Icons.add_rounded,
                        size: 30,
                        color: themeIconColors[menuMng.getIndex()],
                      ),
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

Future<bool> requestPermission() async {
  await Permission.storage.request();
  return true;
}

class _IndexScreenState extends State<IndexScreen> {

  @override
  void initState() {
    super.initState();
    requestPermission();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if(!Mng.isLoad) {
      log("실패");
      loadAsset(context);
      loadUAsset(context);
      FileMng fileMng =  Provider.of<FileMng>(context, listen: false);
      OilMng oilMng =  Provider.of<OilMng>(context, listen: false);
      fileMng.load();
      fileMng.readDirectory('soap', 0).then((value) =>
          fileMng.readDirectory('beauty', 1).then((value) =>
              fileMng.readDirectory('oil', 2).then((value) =>
              {
                oilMng.syncUserData(fileMng.data[2].values.toList()),
                fileMng.readDirectory('config', 3).then((value) =>
                    Provider.of<Mng>(context, listen: false).setThemeColor(fileMng.data[3]['config.txt'].toString().split('\n')[0])
                )
              })
          )
      );
      Mng.isLoad = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: getSecondColor(context),
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 240),
                height: 80,
                color: getMainColor(context),
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.only(left: 25, right: 25, bottom: 10),
                child: Text(
                  "테스트",
                  style: TextStyle(
                    color: getSecondColor(context),
                    fontSize: 20,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 80,
              bottom: 80,
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
      ),
    );
  }
}