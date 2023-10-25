import 'dart:developer';
import 'dart:io';

import 'package:isma/config/define.dart';


class LanguageMng {
  bool isEng = true;

  final List<String> _kor = [
    "비누",
    "화장품",
    "오일",
    "설정",

    "색 변경",
    "개발자 연락처",
    "( 의견 제시 )",
    "이메일",

    "고형비누",
    "HP투명비누",
    "연비누",
    "스킨",
    "에센스",
    "로션",
    "크림",

    "민감성",
    "건성",
    "아토피",
    "복합성",
    "지성",
    "여드름",
    "피부",

    "오일",
    "슈퍼팻",
    "첨가물",
    "포화",
    "불포화",
    "Lye",
    "정제수",
    "물의 양",
    "필요 물 양\n(식초 등)",
    "비누화수",
    "일반비누",
    "순비누",
    "용제",
    "에탄올",
    "글리세린",
    "설탕",
    "설탕 녹일 물",
    "양",

    "레시피 이름",
    "비누 유형",
    "용으로 계산하기",
    "값 입력 [기본 단위 %]",
    "Lye 순도",
    "Lye Count",
    "오일 추가",

    "화장품 이름",
    "화장품 유형",
    "피부 유형",
    "총용량 [ G ]",
    "수상층",
    "유상층",
    "유화제",
    "EO",
    "워터",
    "설정값",
    "유화제 추가",

    "오일명",
    "값 입력",
    "사용자 오일",

    "총합",
    "닫기",
    "각 항목을 터치하면 사용한 목록이 나옵니다.",
    "[이름없음]",
    "[첨]",

    "메모 입력",
    "데이터를 불러오고 있습니다...",

    "다음",
    "나가기",
    "이전",
    "저장",

  ];
  final List<String> _eng = [
    "Soap",
    "MakeUp",
    "Oils",
    "Config",

    "Change Theme",
    "Contact Us",
    "",
    "E-mail",


    "C.P",
    "H.P",
    "Paste",
    "Skin",
    "Essence",
    "Lotion",
    "Cream",

    "Sensitive",
    "Dry",
    "Atopic",
    "Combination",
    "Oily",
    "Acne-prone",
    "Skin",

    "Oil",
    "SuperFat",
    "Additive",
    "Fat",
    "Unfat",
    "Lye",
    "Purified water",
    "Total water",
    "Need water\n(Vinegar, etc.)",
    "50% lye water",
    "Normal",
    "Pure soap",
    "Solvent",
    "Ethanol",
    "Glycerine",
    "Sugar",
    "Water of Sugar",
    "Total",

    "Recipe Name",
    "Type of Soap",
    "Calculate to ",
    "Enter the values [default unit %]",
    "Lye Purity",
    "Lye Count",
    "Choose Oil",


    "Cosmetic name",
    "Cosmetic Type",
    "Skin Type",
    "Total Weight [ G ]",
    "수상층",
    "유상층",
    "유화제",
    "EO",
    "Water",
    "Setting value",
    "Choose 유화제",

    "Oil Name",
    "Enter Fat Values",
    "Custom Oil",

    "Total",
    "Close",
    "Touch each item to see the list you used",
    "n/a",
    "[A]",

    "Type here",
    "Loading...",

    "Next",
    "Exit",
    "Back",
    "Save"
  ];


  List<List<String>> _headerTextTitles = [];
  get headerText => _headerTextTitles;


  final List<String> _themeTitle_kor = [
    "차가운 얼음",
    "숲속의 나무",

    "보라빛 달",
    "통나무",

    "벽돌",
    "홍학",

    "모래성",
    "얕은 바다",

    "진흙",
    "깊은 바다",

    "올리브",
    "초콜릿",
  ];
  final List<String> _themeTitle_eng = [
    "Ice",
    "Tree in the Forest",

    "Purple moon",
    "Log",

    "Brick",
    "Flamingos",

    "Sand Castle",
    "Sea",

    "Mud",
    "Deep Ocean",

    "Olive",
    "Chocolate",
  ];
  get themeTitle => isEng ? _themeTitle_eng : _themeTitle_kor;


  // = [
  // ["오일", "슈퍼팻", "첨가물", "총량"],
  // ["오일"],
  // ["슈퍼팻"],
  // ["첨가물"],
  //
  // ["수상층", "유상층", "유화제", "총량"],
  // ["워터", "첨가물", "총량", "설정값"],
  // ["유화제", "", "설정값"],
  // ["유상층", "", "설정값"],
  // ["EO"],
  // ];
  //
  //
  // final List<List<String>> headerTextTitles_Eng = [
  //   ["Oil", "Superfat", "Additive", "Total"],
  //   ["Oil"],
  //   ["Suprfat"],
  //   ["Additivie"],
  //
  //   ["수상층", "유상층", "유화제", "총량"],
  //   ["워터", "첨가물", "총량", "설정값"],
  //   ["유화제", "", "설정값"],
  //   ["유상층", "", "설정값"],
  //   ["EO"],
  // ];

  void setHeaderText() {
    _headerTextTitles.add([getText(TITLE.E_OIL_OIL), getText(TITLE.E_OIL_SUPERFAT), getText(TITLE.E_OIL_ADDITIVE), getText(TITLE.E_RESULT_TOTAL)]);
    _headerTextTitles.add([getText(TITLE.E_OIL_OIL)]);
    _headerTextTitles.add([getText(TITLE.E_OIL_SUPERFAT)]);
    _headerTextTitles.add([getText(TITLE.E_OIL_ADDITIVE)]);

    _headerTextTitles.add([getText(TITLE.E_BEAUTY_SUSANG), getText(TITLE.E_BEAUTY_USANG), getText(TITLE.E_BEAUTY_UHWA), getText(TITLE.E_RESULT_TOTAL)]);
    _headerTextTitles.add([getText(TITLE.E_BEAUTY_WATER), getText(TITLE.E_OIL_ADDITIVE), getText(TITLE.E_RESULT_TOTAL), getText(TITLE.E_BEAUTY_SETTING)]);
    _headerTextTitles.add([getText(TITLE.E_BEAUTY_UHWA), "", getText(TITLE.E_BEAUTY_SETTING)]);
    _headerTextTitles.add([getText(TITLE.E_BEAUTY_USANG), "", getText(TITLE.E_BEAUTY_SETTING)]);
    _headerTextTitles.add([getText(TITLE.E_BEAUTY_EO)]);
  }

  void setLanguage() {
    isEng = Platform.localeName.contains("ko") ? false : true;
    setHeaderText();
  }

  String getText(TITLE t) {
    return isEng ? _eng[t.index] : _kor[t.index];
  }
}