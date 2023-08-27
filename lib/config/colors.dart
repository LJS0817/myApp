import 'dart:ui';

//soap main
// primary : 3B6C95
//text & background : EFF1F5

//beauty main
//primary : 75A657
//text & background : EDF2E8
const List<Color> mainTheme = [
  Color(0xFF3B6C95),
  Color(0xFF75A657),
  Color(0xFFAC94BB),
  Color(0xFFEE9181),
];

const List<Color> mainTextColor = [
  Color(0xFFEFF1F5),
  Color(0xFFEDF2E8),
  Color(0xFFFCF8FF),
  Color(0xFFFFF6F4),
];

const List<Color> themeIconColors = [
  Color(0xFFBFE2FF),
  Color(0xFFE5F0DB),
  Color(0xFFF8EEFF),
  Color(0xFFFEE6E1),

  Color(0xFF07263F),
  Color(0xFF344127),
  Color(0xFF3B2349),
  Color(0xFF782011),
];

///[0] - 테마,
///[1] - 텍스트,
///[2] - 강조, 활성화(버튼),
///[4] - 비활성화 버튼
const List<List<Color>> soapThemeColor = [
  [ Color(0xFF20567A), Color(0xFFE9F6FF), Color(0xFF98D6FF), Color(0xFFA3B8C9) ],
  [ Color(0xFF007EA3), Color(0xFFD5F5FE), Color(0xFF3DD3FF), Color(0xFF99C0CC) ],
  [ Color(0xFF6391BE), Color(0xFFE7F3FF), Color(0xFF194672), Color(0xFFB6D0E9) ]
];

///[0] - 테마,
///[1] - 텍스트,
///[2] - 강조, 활성화(버튼),
const List<List<Color>> beautyThemeColor = [
  [ Color(0xFFC5B3A6), Color(0xFFFDF9F5), Color(0xFF463A2E) ],
  [ Color(0xFFB7DA9B), Color(0xFF4B9411), Color(0xFF1B6C46) ],
  [ Color(0xFF7FCBAE), Color(0xFF2D936C), Color(0xFF085236) ],
  [ Color(0xFF00A356), Color(0xFFCAF3DD), Color(0xFF003D20) ],
];


int parseIndex(String type) {
  switch(type) {
    case "C.P" :
    case "Skin" :
      return 0;
    case "H.P":
    case "essense":
      return 1;
    case "Paste":
    case "Lotion":
      return 1;
    default:
      return 3;
  }
}