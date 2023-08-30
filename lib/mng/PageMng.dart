import 'package:flutter/cupertino.dart';
import 'package:isma/soap/first.dart';
import 'package:isma/soap/second.dart';

class PageMng with ChangeNotifier {
  final List<String> Workspaces = [
    '/tabs/soap',
    '/tabs/beauty',
    '/tabs/oil',
    '/tabs/config'
  ];
  final int MAX_INDEX = 5;

  int index = 0;

  ///0 : 비누, 1 : 화장품, 2 : 오일, 3 : 설정
  void changeScene(BuildContext context, int idx) {
    Navigator.pushNamed(context, Workspaces[idx]);
  }

  void nextPage() {
    index++;
    if(index >= MAX_INDEX) {
      index = MAX_INDEX;
      return;
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

  Widget getCurPage() {
    switch(index) {
      case 0: return FirstView();
      case 1: return SecondView();
      default: return FirstView();
    }
  }
}