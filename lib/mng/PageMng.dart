import 'package:flutter/cupertino.dart';
import 'package:isma/soap/first.dart';

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

  Widget getCurPage() {
    switch(index) {
      case 0: return FirstView();
      default: return FirstView();
    }
  }
}