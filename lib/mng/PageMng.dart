import 'package:flutter/cupertino.dart';
import 'package:isma/config/define.dart';
import 'package:isma/workspace/beauty/bFifthView.dart';
import 'package:isma/workspace/beauty/bFirstView.dart';
import 'package:isma/workspace/beauty/bFourthView.dart';
import 'package:isma/workspace/beauty/bSecondView.dart';
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
  final int BEAUTY_MAX_INDEX = 5;
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

  ///0 : 비누, 1 : 화장품, 2 : 오일, 3 : 설정
  void changeScene(BuildContext context, int idx) {
    Navigator.pushNamed(context, Workspaces[idx]);
  }

  String addButtonText(int type, int idx) {
    if(idx == 1) {
      return type > 2 ? "수상층" : "오일";
    } else if(idx == 2 && type != 1) {
      return type > 2 ? "유상층" : "슈퍼팻";
    } else if(idx == 3) {
      return type > 2 ? "유화제" : "첨가물";
    } else {
      return type > 2 ? "EO" : "첨가물";
    }
  }

  void nextPage(int type) {
    index++;
    if(type == 1 && index == 2) index++;
    if(index >= MAX_INDEX(type)) {
      index = MAX_INDEX(type);
    }
    notifyListeners();
  }

  void prevPage(int type) {
    index--;
    if(type == 1 && index == 2) index--;
    if(index < 0) {
      index = 0;
      return;
    }
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
        default: return bFirstView();
      }
    }

  }
}