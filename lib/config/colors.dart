import 'dart:ui';

const List<String> themeTitle = [
  "차가운 얼음",
  "숲속의 나무",

  "보라빛 달",
  "진흙",

  "벽돌",
  "홍학",

  "모래성",
  "얕은 바다",

  "진흙",
  "깊은 바다",

  "올리브",
  "초콜릿",
];

const List<Color> themeBackgrounds = [
  Color(0xFFEFF8FF),
  Color(0xFFE9FFFB),

  Color(0xFFF5F0FF),
  Color(0xFFFFF1EE),

  Color(0xFFFFF2EE),
  Color(0xFFFFEBF0),

  Color(0xFFFFF2E3),
  Color(0xFFE9F9FF),

  Color(0xFFFFF3E2),
  Color(0xFFE2F7FF),

  Color(0xFFf1efea),
  Color(0xFFffe3d3),
];

///```
///[0] - 테마,
///[1] - 텍스트,
///[2] - 강조, 활성화(버튼),
///[3] - 비활성화 버튼
const List<List<List<Color>>> themes = [
  [
    [ Color(0xFF114060), Color(0xFFd4e9f7), Color(0xff60bffd), Color(0xFF8BA7B6) ],
    [ Color(0xFF255D82), Color(0xFFD5F5FE), Color(0xFF3DD3FF), Color(0xFF99C0CC) ],
    [ Color(0xFF3979A3), Color(0xFFE7F3FF), Color(0xFF92c9ff), Color(0xFFB6D0E9) ],
    [ Color(0xFF67A2CA), Color(0xFFE7F3FF), Color(0xFF194672), Color(0xFFced7df) ],
  ],
  [
    [ Color(0xFF1B4F46), Color(0xFFE9FFFB), Color(0xFF1dc7aa), Color(0xFFB5CBC7) ],
    [ Color(0xFF14685A), Color(0xFFE3FFFD), Color(0xFF77CCC4), Color(0xFF9FBDB7) ],
    [ Color(0xFF198D79), Color(0xFFCCECE4), Color(0xFF065446), Color(0xFFA2D3CA) ],
    [ Color(0xFF6FB8AC), Color(0xFFD7FFF0), Color(0xFF1A9181), Color(0xFFBDE1DC) ],
  ],
  [
    [ Color(0xFF3E3893), Color(0xFFDEDDFF), Color(0xFF8883E5), Color(0xFFA5A2C9) ],
    [ Color(0xFF5C56A9), Color(0xFFE3E0FF), Color(0xFFABA7D5), Color(0xFFB8B5EA) ],
    [ Color(0xFF8881C9), Color(0xFFEFECFF), Color(0xFF4E43A1), Color(0xFFBCBBE3) ],
    [ Color(0xFFB3AFE5), Color(0xFFE9E8FF), Color(0xFF454193), Color(0xFF6A6AB6) ],
  ],
  [
    [ Color(0xFF832F21), Color(0xFFFFEFEB), Color(0xFFE7B5A9), Color(0xFFCBB2AC) ],
    [ Color(0xFF9E4B3D), Color(0xFFFFF0EE), Color(0xFFECB6AD), Color(0xFFD9ABA5) ],
    [ Color(0xFFC97465), Color(0xFFFFD2CA), Color(0xFF4F2119), Color(0xFFE8C9BA) ],
    [ Color(0xFFEE9181), Color(0xFFFFE8E2), Color(0xFF9F1E09), Color(0xFFE8C7C0) ],
  ],
  [
    [ Color(0xFFCC423B), Color(0xFFFFE7E5), Color(0xFF59221F), Color(0xFFCCAFAC) ],
    [ Color(0xFFDC6760), Color(0xFFFFF0EF), Color(0xFF75423F), Color(0xFFDEBDBB) ],
    [ Color(0xFFEC9793), Color(0xFFFFECEC), Color(0xFFA44C48), Color(0xFFE7C9C6) ],
    [ Color(0xFFF0CCCA), Color(0xFFE09E9B), Color(0xFFD9564F), Color(0xFFB77672) ],
  ],
  [
    [ Color(0xFFF35D74), Color(0xFFFFDDE3), Color(0xFF853B45), Color(0xFFDCC5C8) ],
    [ Color(0xFFF37E90), Color(0xFFFFF5F6), Color(0xFF7C5158), Color(0xFFF3CED4) ],
    [ Color(0xFFEFA1AD), Color(0xFFFFE5E9), Color(0xFF987B80), Color(0xFFC56875) ],
    [ Color(0xFFF3CCD2), Color(0xFFF191A0), Color(0xFFDA4D62), Color(0xFFC29BA2) ],
  ],
  [
    [ Color(0xFFDF813E), Color(0xFFFFF2E9), Color(0xFF80502D), Color(0xFFEFBD9B) ],
    [ Color(0xFFEB9C64), Color(0xFFFFF7F2), Color(0xFF9D5C26), Color(0xFFE7D4C9) ],
    [ Color(0xFFEFB790), Color(0xFFFFF2E9), Color(0xFF8A6F5B), Color(0xFFC28B65) ],
    [ Color(0xFFF5CFB3), Color(0xFFE59E6A), Color(0xFF9A6844), Color(0xFFC5A187) ],
  ],
  [
    [ Color(0xFF0077C2), Color(0xFFCEE0EE), Color(0xFF78D2FF), Color(0xFFC1D6E1) ],
    [ Color(0xFF3D96CE), Color(0xFFEAF7FF), Color(0xFF14517E), Color(0xFFAFD3EA) ],
    [ Color(0xFF6DB4E1), Color(0xFFEBF6FF), Color(0xFF476B81), Color(0xFFB1DCF6) ],
    [ Color(0xFFA4CCE5), Color(0xFFE2F1FF), Color(0xFF2C86BD), Color(0xFF719FBD) ],
  ],
  [
    [ Color(0xFF675640), Color(0xFFFFF7F2), Color(0xFFEEB774), Color(0xFFD3CDC5) ],
    [ Color(0xFF8F795D), Color(0xFFFFFDFA), Color(0xFF5D3F17), Color(0xFFD3C2AE) ],
    [ Color(0xFFAA9A85), Color(0xFFFFF1DD), Color(0xFFFFC06C), Color(0xFFDCC7AE) ],
    [ Color(0xFFD7C4AC), Color(0xFFFFFBF6), Color(0xFF987D5C), Color(0xFF93806A) ],
  ],
  [
    [ Color(0xFF007EA7), Color(0xFFE1F7FF), Color(0xFF9CE6FF), Color(0xFFAECDD7) ],
    [ Color(0xFF2C97B9), Color(0xFFF0FBFF), Color(0xFF13566C), Color(0xFFA8D2E0) ],
    [ Color(0xFF68AFC5), Color(0xFFD1EFF8), Color(0xFF315864), Color(0xFFC4DDE5) ],
    [ Color(0xFF95C8D8), Color(0xFFE9F8FF), Color(0xFF4495AF), Color(0xFFDDEAEE) ],
  ],
  [
    [ Color(0xFF606650), Color(0xFFF5FFDA), Color(0xFFCAE07A), Color(0xFFC3C5BE) ],
    [ Color(0xFF798066), Color(0xFFF4FFDC), Color(0xFFADC965), Color(0xFFC9D5A7) ],
    [ Color(0xFF9DA684), Color(0xFFE2EFC0), Color(0xFF536425), Color(0xFFCED3C0) ],
    [ Color(0xFFC1CCA2), Color(0xFF8F9D62), Color(0xFF587508), Color(0xFF959F7A) ],
  ],
  [
    [ Color(0xFF835F54), Color(0xFFF8E4DE), Color(0xFFF5A389), Color(0xFFCCB6AE) ],
    [ Color(0xFF9E7A6E), Color(0xFFFFEDE9), Color(0xFFEFA994), Color(0xFFD9B4A8) ],
    [ Color(0xFFAD8F86), Color(0xFFFFE6E0), Color(0xFF724235), Color(0xFFF3C0B3) ],
    [ Color(0xFFC59F92), Color(0xFFFFF5F1), Color(0xFF5B4A40), Color(0xFF967B76) ],
  ],
];
//
// const List<Color> mainTheme = [
//   Color(0xFF3B6C95),
//   Color(0xFF75A657),
//   Color(0xFF918BDE),
//   Color(0xFFEE9181),
// ];
//
// const List<Color> mainTextColor = [
//   Color(0xFFEFF1F5),
//   Color(0xFFEDF2E8),
//   Color(0xFFFCF8FF),
//   Color(0xFFFFF6F4),
// ];
//
// const List<Color> themeIconColors = [
//   Color(0xFFBFE2FF),
//   Color(0xFFE5F0DB),
//   Color(0xFFF8EEFF),
//   Color(0xFFFEE6E1),
//
//   Color(0xFF07263F),
//   Color(0xFF344127),
//   Color(0xFF3B2349),
//   Color(0xFF782011),
// ];

///[0] - 테마,
///[1] - 텍스트,
///[2] - 강조, 활성화(버튼),
///[3] - 비활성화 버튼
// const List<List<Color>> soapThemeColor = [
//   [ Color(0xFF20567A), Color(0xFFE9F6FF), Color(0xFF98D6FF), Color(0xFFA3B8C9) ],
//   [ Color(0xFF007EA3), Color(0xFFD5F5FE), Color(0xFF3DD3FF), Color(0xFF99C0CC) ],
//   [ Color(0xFF6391BE), Color(0xFFE7F3FF), Color(0xFF194672), Color(0xFFB6D0E9) ]
// ];
//
// ///[0] - 테마,
// ///[1] - 텍스트,
// ///[2] - 강조, 활성화(버튼),
// ///[3] - 비활성화 버튼
// const List<List<Color>> beautyThemeColor = [
//   [ Color(0xFF247365), Color(0xFFE9FFFB), Color(0xFF77FFE7), Color(0xFFB5CBC7) ],
//   [ Color(0xFF92A863), Color(0xFFF6FFE3), Color(0xFFEAEE1A), Color(0xFFD7E7B5) ],
//   [ Color(0xFF4F8F61), Color(0xFFEAFFF0), Color(0xFF4DEC7A), Color(0xFFB6CEBD) ],
//   [ Color(0xFFA18D5A), Color(0xFFFFF7E2), Color(0xFFFFD66E), Color(0xFFD1C7AF) ],
// ];
//
// ///[0] - 테마,
// ///[1] - 텍스트,
// ///[2] - 강조, 활성화(버튼),
// ///[3] - 비활성화 버튼
// const List<Color> oilThemeColor = [
//   Color(0xFF4D4794),
//   Color(0xFFE7E6FF),
//   Color(0xFF857BFF),
//   Color(0xFF727286),
// ];

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