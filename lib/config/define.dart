import 'dart:developer';
import 'dart:ui';

import 'package:isma/config/colors.dart';
import 'package:isma/mng/LanMng.dart';
import 'package:isma/mng/OilMng.dart';
import 'package:isma/mng/FileMng.dart';
import 'package:isma/mng/MenuMng.dart';
import 'package:isma/mng/Mng.dart';
import 'package:isma/mng/PageMng.dart';
import 'package:isma/mng/SizeMng.dart';

import '../mng/DataMng.dart';

enum TYPE { E_COLD, E_HOT, E_PASTE, E_SKIN, E_ESSENCE, E_LOTION, E_CREAM, E_ETC }

enum SKINTYPE { E_MINGAM, E_GUN, E_ATOPI, E_JOONG, E_JI, E_YEO }


enum TITLE {
  E_SOAPTITLE,
  E_MAKEUPTITLE,
  E_OILTITLE,
  E_CONFIGTITLE,

  E_CONFIG_COLOR_TITLE,
  E_CONFIG_CONTACT_TITLE,
  E_CONFIG_CONTACT_WHY,
  E_CONFIG_CONTACT_INFO,

  E_TYPE_CP,
  E_TYPE_HP,
  E_TYPE_PASTE,
  E_TYPE_SKIN,
  E_TYPE_ESSENCE,
  E_TYPE_LOTION,
  E_TYPE_CREAM,

  E_SKINTYPE_SENSITIVE,
  E_SKINTYPE_DRY,
  E_SKINTYPE_ATOPIC,
  E_SKINTYPE_COMBINATION,
  E_SKINTYPE_OILY,
  E_SKINTYPE_ACNE,
  E_SKINTYPE_TITLE,

  E_OIL_OIL,
  E_OIL_SUPERFAT,
  E_OIL_ADDITIVE,
  E_OIL_FAT,
  E_OIL_UNFAT,
  E_OIL_LYE,
  E_OIL_WATER,
  E_OIL_WATER2,
  E_OIL_NEEDWATER,
  E_OIL_SOAPHWA,
  E_OIL_NORMAL,
  E_OIL_PURESOAP,
  E_OIL_SOLVENT,
  E_OIL_ETHANOL,
  E_OIL_GLYCERINE,
  E_OIL_SUGAR,
  E_OIL_SUGARWATER,
  E_OIL_AMOUNT,

  E_SOAP_RECIPENAME,
  E_SOAP_TYPETITLE,
  E_SOAP_CALCULATE,
  E_SOAP_ENTERVALUE,
  E_SOAP_LYEPURITY,
  E_SOAP_LYECOUNT,
  E_SOAP_ADDOIL,

  E_BEAUTY_TITLE,
  E_BEAUTY_TYPE,
  E_BEAUTY_SKINTYPE,
  E_BEAUTY_TOTAL,
  E_BEAUTY_SUSANG,
  E_BEAUTY_USANG,
  E_BEAUTY_UHWA,
  E_BEAUTY_EO,
  E_BEAUTY_WATER,
  E_BEAUTY_SETTING,
  E_BEAUTY_ADDUHWA,

  E_OIL_TITLE,
  E_OIL_ENTERVALUE,
  E_OIL_NONAME,

  E_RESULT_TOTAL,
  E_RESULT_CLOSE,
  E_RESULT_TOUCHSIGN,
  E_NONAME,
  E_SHORTADD,

  E_MEMO,
  E_LOADING,

  E_NEXT,
  E_EXIT,
  E_PREV,
  E_SAVE,


}

const int aniTime = 240;

final SizeMng sizeMng = SizeMng();
final LanguageMng language = LanguageMng();

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
      return TYPE.E_ESSENCE;
    case '5':
      return TYPE.E_LOTION;
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

TITLE typeToTitleEnum(TYPE t) {
  switch(t) {
    case TYPE.E_COLD:
      return TITLE.E_TYPE_CP;
    case TYPE.E_HOT:
      return TITLE.E_TYPE_HP;
    case TYPE.E_PASTE:
      return TITLE.E_TYPE_PASTE;
    case TYPE.E_SKIN:
      return TITLE.E_TYPE_SKIN;
    case TYPE.E_ESSENCE:
      return TITLE.E_TYPE_ESSENCE;
    case TYPE.E_LOTION:
      return TITLE.E_TYPE_LOTION;
    case TYPE.E_CREAM:
      return TITLE.E_TYPE_CREAM;
    default:
      return TITLE.E_TYPE_CP;
  }
}

TITLE skinTypeToTitleEnum(SKINTYPE t) {
  switch(t) {
    case SKINTYPE.E_MINGAM:
      return TITLE.E_SKINTYPE_SENSITIVE;
    case SKINTYPE.E_GUN:
      return TITLE.E_SKINTYPE_DRY;
    case SKINTYPE.E_ATOPI:
      return TITLE.E_SKINTYPE_ATOPIC;
    case SKINTYPE.E_JOONG:
      return TITLE.E_SKINTYPE_COMBINATION;
    case SKINTYPE.E_JI:
      return TITLE.E_SKINTYPE_OILY;
    case SKINTYPE.E_YEO:
      return TITLE.E_SKINTYPE_ACNE;
    default:
      return TITLE.E_SKINTYPE_SENSITIVE;
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

