import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:isma/config/define.dart';
import 'package:isma/mng/DataMng.dart';
import 'package:isma/tabs/soap.dart';
import 'package:isma/workspace/beauty/bFifthView.dart';
import 'package:isma/workspace/beauty/bFirstView.dart';
import 'package:isma/workspace/beauty/bFourthView.dart';
import 'package:isma/workspace/beauty/bSecondView.dart';
import 'package:isma/workspace/beauty/bSixthView.dart';
import 'package:isma/workspace/beauty/bThirdView.dart';
import 'package:isma/workspace/soap/first.dart';
import 'package:isma/workspace/soap/fourth.dart';
import 'package:isma/workspace/soap/second.dart';
import 'package:isma/workspace/soap/third.dart';


class PageMng with ChangeNotifier {
  final List<String> Workspaces = [
    '/tabs/soap',
    '/tabs/beauty',
    '/tabs/oil',
    '/tabs/config'
  ];
  final int SOAP_MAX_INDEX = 4;
  final int BEAUTY_MAX_INDEX = 6;
  final int OIL_MAX_INDEX = 1;
  int MAX_INDEX(int type) {
    if(type < 3) {
      return SOAP_MAX_INDEX - 1;
    } else if(type < 7) {
      return BEAUTY_MAX_INDEX - 1;
    } else {
      return OIL_MAX_INDEX - 1;
    }
  }

  int index = 0;
  int enableDialog = 0;

  List<Widget> headerText = [];
  
  final List<List<String>> headerTextTitles = [
    ["오일", "슈퍼팻", "첨가물", "총량"],
    ["오일"],
    ["슈퍼팻"],
    ["첨가물"],
    
    ["수상층", "유상층", "유화제", "총량"],
    ["워터", "첨가물", "총량", "", "설정값"],
    ["유화제", "", "설정값"],
    ["유상층", "", "설정값"],
    ["EO"],
  ];

  ///0 : 비누, 1 : 화장품, 2 : 오일, 3 : 설정
  void changeScene(BuildContext context, int idx) {
    Navigator.pushNamed(context, Workspaces[idx]);
  }

  String addButtonText(int type, int idx) {
    if(idx == 1) {
      return type > 2 ? "워터" : "오일";
    } else if(idx == 2 && type != 1) {
      return type > 2 ? "첨가물" : "슈퍼팻";
    } else if(idx == 3) {
      return type > 2 ? "유화제" : "첨가물";
    } else if(idx == 4) {
      return type > 2 ? "유상층" : "첨가물";
    }  else {
      return type > 2 ? "EO" : "첨가물";
    }
  }

  Widget textWidget(String str, Color color) {
    return Text(
      str,
      style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: 13
      ),
    );
  }

  Widget rowTextWidget(String title, String detail, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          textWidget(title, color),
          textWidget(detail, color),
        ],
      ),
    );
  }

  void changeText(int colorIndex, List<String> detail) {
    headerText = [];
    int idx = colorIndex < 3 ? index : 4 + (index == 0 ? 0 : index < 3 ? 1 : index - 1);

    log(headerTextTitles[idx].toString());
    for(int i = 0; i < headerTextTitles[idx].length; i++) {
      headerText.add(rowTextWidget(headerTextTitles[idx][i], detail[i], getThemeColor(colorIndex, 1)));
    }
  }

  void UpdateText(Data data, {bool re=false}) {
    changeText(data.type.index, getDetails(data));
    if(re) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  late Function beforeSave;

  void setBeforeSaveEvent(Function func) {
    beforeSave = func;
  }

  Function getBeforeSaveEvent() {
    return beforeSave;
  }

  List<String> getDetails(Data data) {
    List<String> result = [];

    switch(index) {
      case 0:
        if(data.type.index < 3) {
          result = [
            data.weight[1].toString(),
            data.weight[2].toString(),
            data.weight[3].toString(),
            data.weight[0].toString(),
          ];
        } else {
          result = [
            "${(int.parse(data.getValue(8)!) * data.weight[0] * 0.01).round()}g",
            "${(int.parse(data.getValue(9)!) * data.weight[0] * 0.01).round()}g",
            "${(int.parse(data.getValue(10)!) * data.weight[0] * 0.01).round()}g",
            "${data.weight[0]}g",
          ];
        }
        break;
      case 1:
        if(data.type.index < 3) {
          result = [
            data.weight[1].toString(),
          ];
        } else {
          result = [
            data.weight[1].toString(),
            data.weight[2].toString(),
            (data.weight[1] + data.weight[2]).toString(),
            "",
            (int.parse(data.getValue(8)!) * data.weight[0] * 0.01).round().toString(),
          ];
        }
        break;
      case 2:
        if(data.type.index < 3) {
          result = [
            data.weight[2].toString(),
          ];
        } else {
          result = [
            data.weight[1].toString(),
            data.weight[2].toString(),
            (data.weight[1] + data.weight[2]).toString(),
            "",
            (int.parse(data.getValue(8)!) * data.weight[0] * 0.01).round().toString(),
          ];
        }
        break;
      case 3:
        if(data.type.index < 3) {
          result = [
            data.weight[3].toString(),
          ];
        } else {
          result = [
            data.weight[3].toString(),
            "",
            (int.parse(data.getValue(10)!) * data.weight[0] * 0.01).round().toString(),
          ];
        }
        break;
      case 4:
        result = [
          data.weight[4].toString(),
          "",
          (int.parse(data.getValue(9)!) * data.weight[0] * 0.01).round().toString(),
        ];
        break;
      case 5:
        result = [
          data.weight[5].toString(),
        ];
        break;
      default:
        result = [

        ];
        break;
    }

    return result;
  }

  void nextPage(int type, Data detail) {
    index++;
    if(type == 1 && index == 2) index++;
    if(index >= MAX_INDEX(type)) {
      index = MAX_INDEX(type);
    }
    changeText(type, getDetails(detail));
    notifyListeners();
  }

  void prevPage(int type, Data detail) {
    index--;
    if(type == 1 && index == 2) index--;
    if(index < 0) {
      index = 0;
      return;
    }
    changeText(type, getDetails(detail));
    notifyListeners();
  }

  int getIndexSub1() {
    if(index - 1 >= 0) {
      return index - 1;
    } else {
      return index;
    }
  }

  String typeToString(TYPE type) {
    if(type.index < 3) {
      return 'UserData_Recipe';
    } else if(type.index <7) {
      return 'UserData_Beauty';
    } else {
      return 'UserData_Oil';
    }
  }

  int typeToInt(TYPE type) {
    if(type.index < 3) {
      return 0;
    } else if(type.index < 7) {
      return 1;
    } else {
      return 2;
    }
  }

  ///```
  ///0 - disabled
  ///1 - soap
  ///2 - beauty
  void setDialog(int setIndex) {
    enableDialog = setIndex;
    notifyListeners();
  }

  Widget getCurPage(bool isSoap) {
    if(isSoap) {
      switch(index) {
        case 0: return FirstView();
        case 1: return SecondView();
        case 2: return ThirdView();
        case 3: return FourthView();
        default: return FirstView();
      }
    } else {
      switch(index) {
        case 0: return bFirstView();
        case 1: return bSecondView();
        case 2: return bThirdView();
        case 3: return bFourthView();
        case 4: return bFifthView();
        case 5: return bSixthView();
        default: return bFirstView();
      }
    }

  }
}