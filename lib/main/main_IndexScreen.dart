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

// Color getMainColor(BuildContext context) {
//   MenuMng menu = Provider.of<MenuMng>(context);
//
//   return mainTheme[menu.getIndex()];
// }
//
// Color getSecondColor(BuildContext context) {
//   MenuMng menu = Provider.of<MenuMng>(context);
//
//   return mainTextColor[menu.getIndex()];
// }

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
                        color: getThemeColor(1, 0),
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
                        color: getThemeColor(1, 0),
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
              color: getThemeColor(1, 0),
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
                  iconButton('assets/icon/soap.svg', 0, () { mng.changePage(Provider.of<FileMng>(context, listen: false).data[3]['config.txt'].toString()); menuMng.setIndex(0);  Mng.curThemeColorIndex = mng.themeColorIndex[menuMng.index];  }),
                  iconButton('assets/icon/beauty.svg', 1, () { mng.changePage(Provider.of<FileMng>(context, listen: false).data[3]['config.txt'].toString()); menuMng.setIndex(1);  Mng.curThemeColorIndex = mng.themeColorIndex[menuMng.index]; }),
                  Expanded(child: Container(),),
                  iconButton('assets/icon/oil.svg', 2, () { mng.changePage(Provider.of<FileMng>(context, listen: false).data[3]['config.txt'].toString()); menuMng.setIndex(2); Mng.curThemeColorIndex = mng.themeColorIndex[menuMng.index]; }, size: 16),
                  iconButton('assets/icon/settings.svg', 3, () { mng.changePage(Provider.of<FileMng>(context, listen: false).data[3]['config.txt'].toString()); menuMng.setIndex(3); Mng.curThemeColorIndex = mng.themeColorIndex[menuMng.index]; }),
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
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
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
                  color: getThemeColor(1, 0),
                  borderRadius: BorderRadius.circular(500),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(500),
                    splashColor: getThemeColor(1, 1).withOpacity(0.2),
                    highlightColor: getThemeColor(1, 1).withOpacity(0.5),
                    onTap: () {
                      if(menuMng.isConfig) {
                        FileMng fileMng = Provider.of<FileMng>(context, listen: false);
                        fileMng.writeFile("config", "UserData_Config", mng.getThemeSaveString());
                        fileMng.setData(3, "config.txt", mng.getThemeSaveString());
                        mng.changePage(fileMng.data[3]['config.txt'].toString());
                        Mng.curThemeColorIndex = mng.themeColorIndex[menuMng.index];
                      } else {
                        pageMng.index = 0;
                        dataMng.initData(menuMng.index);
                        dataMng.selectFileName = "";
                        mng.selectData = Data();
                        menuMng.init();

                        if(dataMng.getTypeIndex() != 7) {
                          pageMng.UpdateText(dataMng.data);
                        }
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
                              color: getThemeColor(1, 0).withOpacity(0.5)
                          )
                      ),
                      child: menuMng.isConfig ? SvgPicture.asset(
                        'assets/icon/save.svg',
                        width: 29,
                        height: 29,
                        color: getThemeColor(1, 1),
                        fit: BoxFit.none,) : Icon(
                        Icons.add_rounded,
                        size: 30,
                        color: getThemeColor(1, 1),
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
  // await Permission.storage.request();
  return !await Permission.storage.request().isDenied;
}

class _IndexScreenState extends State<IndexScreen> with TickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
    requestPermission();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  Future<String> _fetch1() async {
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
                  Mng.curThemeColorIndex = Provider.of<Mng>(context, listen: false).setThemeColor(fileMng.data[3]['config.txt'].toString().split('\n')[0])
                )
              })
          )
      );
      Mng.isLoad = true;
    }
    await Future.delayed(Duration(seconds: 4));
    return 'Call Data';
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: themeBackgrounds[Mng.curThemeColorIndex],
        body: FutureBuilder(
          future: _fetch1(),
          builder: (BuildContext contxt, AsyncSnapshot snapshot) {
            if(!snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FadeTransition(
                    opacity: CurvedAnimation(
                      parent: AnimationController(
                        vsync: this,
                        duration: const Duration(milliseconds: 1500),
                      )..forward(),
                      curve: Curves.decelerate,
                    ),
                    child: Image.asset(
                      "assets/icon/icon.png",
                      width: 130,
                      height: 130,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 30)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ScaleTransition(
                        scale: CurvedAnimation(
                          parent: AnimationController(
                            vsync: this,
                            duration: const Duration(milliseconds: 2000),
                          )..repeat(reverse: true),
                          curve: Curves.fastOutSlowIn,
                        ),
                        child: SvgPicture.asset(
                          "assets/icon/phone.svg",
                          width: 40,
                          height: 40,
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(right: 20)),
                      ScaleTransition(
                        scale: CurvedAnimation(
                          parent: AnimationController(
                            vsync: this,
                            duration: const Duration(milliseconds: 1800),
                          )..repeat(reverse: true),
                          curve: Curves.elasticInOut,
                        ),
                        child: SvgPicture.asset(
                          "assets/icon/save.svg",
                          width: 40,
                          height: 40,
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(right: 20)),
                      ScaleTransition(
                        scale: CurvedAnimation(
                          parent: AnimationController(
                            vsync: this,
                            duration: const Duration(milliseconds: 2000),
                          )..repeat(reverse: true),
                          curve: Curves.easeInOutBack,
                        ),
                        child: SvgPicture.asset(
                          "assets/icon/calculator.svg",
                          width: 40,
                          height: 40,
                        ),
                      ),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 40)),
                  Text(
                    "데이터를 불러오고 있습니다...",
                  ),
                ],
              );
            } else {
              return Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 240),
                      height: 80,
                      color: getThemeColor(1, 0),
                      alignment: Alignment.bottomCenter,
                      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 10),
                      child: Text(
                        "테스트",
                        style: TextStyle(
                          color: getThemeColor(1, 1),
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
              );
            }
          },
        ),
      )
    );
  }
}