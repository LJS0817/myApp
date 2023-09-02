import 'package:flutter/cupertino.dart';
import 'package:isma/config/define.dart';
import 'package:isma/workspace/beauty/bFirstView.dart';
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
  final int MAX_INDEX = 3;

  int index = 0;
  bool enableDialog = false;

  ///0 : 비누, 1 : 화장품, 2 : 오일, 3 : 설정
  void changeScene(BuildContext context, int idx) {
    Navigator.pushNamed(context, Workspaces[idx]);
  }

  void nextPage() {
    index++;
    if(index >= MAX_INDEX) {
      index = MAX_INDEX;
    }
    notifyListeners();
  }

  void prevPage() {
    index--;
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
      return 'soap';
    } else {
      return 'beauty';
    }
  }

  int typeToInt(TYPE type) {
    if(type.index < 3) {
      return 0;
    } else {
      return 1;
    }
  }

  void setDialog() {
    enableDialog = !enableDialog;
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
        case 1: return SecondView();
        case 2: return ThirdView();
        case 3: return FourthView();
        default: return FirstView();
      }
    }

  }
}