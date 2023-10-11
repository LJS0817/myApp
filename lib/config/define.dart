import 'dart:developer';
import 'dart:ui';

import 'package:isma/config/colors.dart';
import 'package:isma/mng/OilMng.dart';
import 'package:isma/mng/FileMng.dart';
import 'package:isma/mng/MenuMng.dart';
import 'package:isma/mng/Mng.dart';
import 'package:isma/mng/PageMng.dart';

import '../mng/DataMng.dart';

enum TYPE { E_COLD, E_HOT, E_PASTE, E_SKIN, E_ESSENCE, E_LOTION, E_CREAM, E_ETC }

enum SKINTYPE { E_MINGAM, E_GUN, E_ATOPI, E_JOONG, E_JI, E_YEO }

const int aniTime = 240;

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
    case "SOLID":
      return TYPE.E_COLD;
    case '1':
    case 'H.P.':
      return TYPE.E_HOT;
    case '2':
    case 'PASTE':
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

///0 - 민감성
///1  - 건성
///2 - 아토피
///3 - 중성
///4 - 지성
///5 - 여드름
SKINTYPE parseSKINTYPE(String str) {
  switch(str) {
    case '0':
      return SKINTYPE.E_MINGAM;
    case '1':
      return SKINTYPE.E_GUN;
    case '2':
      return SKINTYPE.E_ATOPI;
    case '3':
      return SKINTYPE.E_JOONG;
    case '4':
      return SKINTYPE.E_JI;
    case '5':
      return SKINTYPE.E_YEO;
    default:
      return SKINTYPE.E_MINGAM;
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

String skinTypeToString(SKINTYPE t) {
  switch(t) {
    case SKINTYPE.E_MINGAM:
      return "민감성";
    case SKINTYPE.E_GUN:
      return "건성";
    case SKINTYPE.E_ATOPI:
      return "아토피";
    case SKINTYPE.E_JOONG:
      return "중복합성";
    case SKINTYPE.E_JI:
      return "지성";
    case SKINTYPE.E_YEO:
      return "여드름";
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
      return 'assets/icon/cold.svg';
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
  if(idx == -1 || idx == 7 || idx < 3) {
    return themes[Mng.curThemeColorIndex][idx][colorIdx];
  } else {
    return themes[Mng.curThemeColorIndex][idx - 3][colorIdx];
  }
}

