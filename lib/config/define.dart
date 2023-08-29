import 'dart:ui';

import 'package:isma/config/colors.dart';
import 'package:isma/mng/FileMng.dart';
import 'package:isma/mng/MenuMng.dart';
import 'package:isma/mng/Mng.dart';
import 'package:isma/mng/PageMng.dart';

import '../mng/DataMng.dart';

enum TYPE { E_COLD, E_HOT, E_PASTE, E_SKIN, E_LOTION, E_ESSENCE, E_CREAM, E_ETC }

final DataMng dataMng = DataMng();
final FileMng fileMng = FileMng();
final MenuMng menuMng = MenuMng();
final PageMng pageMng = PageMng();
final Mng mng = Mng();

///0 - COLD
///1  - HOT
///2 - PASTE
///3 - SKIN
///4 - LOTION
///5 - ESSENCE
///6 - CREAM
TYPE parseTYPE(String str) {
  switch(str) {
    case '0':
      return TYPE.E_COLD;
    case '1':
      return TYPE.E_HOT;
    case '2':
      return TYPE.E_PASTE;
    case '3':
      return TYPE.E_SKIN;
    case '4':
      return TYPE.E_LOTION;
    case '5':
      return TYPE.E_ESSENCE;
    case '6':
      return TYPE.E_CREAM;
    default:
      return TYPE.E_ETC;
  }
}

String typeToString(TYPE t) {
  switch(t) {
    case TYPE.E_COLD:
      return "C.P";
    case TYPE.E_HOT:
      return "H.P";
    case TYPE.E_PASTE:
      return "Paste";
    case TYPE.E_SKIN:
      return "Skin";
    case TYPE.E_LOTION:
      return "Lotion";
    case TYPE.E_ESSENCE:
      return "Essence";
    case TYPE.E_CREAM:
      return "Cream";
    default:
      return "ETC";
  }
}

String getIcon(TYPE t) {
  switch(t) {
    case TYPE.E_COLD:
      return 'assets/icon/cold.svg';
    case TYPE.E_HOT:
      return 'assets/icon/hot.svg';
    case TYPE.E_PASTE:
      return 'assets/icon/paste.svg';
    case TYPE.E_SKIN:
      return 'assets/icon/skin.svg';
    case TYPE.E_LOTION:
      return 'assets/icon/lotion.svg';
    case TYPE.E_ESSENCE:
      return 'assets/icon/essense.svg';
    case TYPE.E_CREAM:
      return 'assets/icon/cream.svg';
    default:
      return 'assets/icon/star.svg';
  }
}

String getOilTypeText(int n) {
  switch(n) {
    case 0:
      return 'Lauric';
    case 1:
      return 'Myristic';
    case 2:
      return 'Palmitic';
    case 3:
      return 'Stearic';
    case 4:
      return 'Oleic';
    case 5:
      return 'Linoleic';
    case 6:
      return 'Ricinoleic';
    case 7:
      return 'Palmitoleic';
    case 8:
      return 'Linolenic';
    default:
      return 'Lauric';
  }
}

///[0] - 테마,
///[1] - 텍스트,
///[2] - 강조, 활성화(버튼),
///[4] - 비활성화 버튼
Color getThemeColor(int idx, int colorIdx) {
  if(idx < 3) {
    return soapThemeColor[idx][colorIdx];
  } else {
    return beautyThemeColor[idx - 3][colorIdx];
  }
}

