import 'dart:ui';


const List<Color> mainTheme = [
  Color(0xFF3B6C95),
  Color(0xFF75A657),
  Color(0xFF918BDE),
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
///[3] - 비활성화 버튼
const List<List<Color>> soapThemeColor = [
  [ Color(0xFF20567A), Color(0xFFE9F6FF), Color(0xFF98D6FF), Color(0xFFA3B8C9) ],
  [ Color(0xFF007EA3), Color(0xFFD5F5FE), Color(0xFF3DD3FF), Color(0xFF99C0CC) ],
  [ Color(0xFF6391BE), Color(0xFFE7F3FF), Color(0xFF194672), Color(0xFFB6D0E9) ]
];

///[0] - 테마,
///[1] - 텍스트,
///[2] - 강조, 활성화(버튼),
///[3] - 비활성화 버튼
const List<List<Color>> beautyThemeColor = [
  [ Color(0xFF247365), Color(0xFFE9FFFB), Color(0xFF77FFE7), Color(0xFFB5CBC7) ],
  [ Color(0xFF92A863), Color(0xFFF6FFE3), Color(0xFFEAEE1A), Color(0xFFD7E7B5) ],
  [ Color(0xFF4F8F61), Color(0xFFEAFFF0), Color(0xFF4DEC7A), Color(0xFFB6CEBD) ],
  [ Color(0xFFA18D5A), Color(0xFFFFF7E2), Color(0xFFFFD66E), Color(0xFFD1C7AF) ],
];

///[0] - 테마,
///[1] - 텍스트,
///[2] - 강조, 활성화(버튼),
///[3] - 비활성화 버튼
const List<Color> oilThemeColor = [
  Color(0xFF4D4794),
  Color(0xFFE7E6FF),
  Color(0xFF857BFF),
  Color(0xFF727286),
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