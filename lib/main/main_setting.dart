import 'package:flutter/material.dart';
import 'package:isma/config/define.dart';
import 'package:isma/main/main_IndexScreen.dart';
import 'package:isma/workspace/config/themeConfig.dart';
import 'package:provider/provider.dart';

class mainSettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: ListView(
          primary: false,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          children: [
            Text(
              "색 변경하기",
              style: TextStyle(
                  color: getThemeColor(1, 0),
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 5)),
            ThemeChanger(),
            const Padding(padding: EdgeInsets.only(bottom: 5)),
            Text(
              "1 - 비누, 2 - 화장품, 3 - 오일, 4 - 설정",
              textAlign: TextAlign.right,
              style: TextStyle(
                color: getThemeColor(1, 0),
                fontSize: 12,
                fontWeight: FontWeight.bold
              ),
            ),

            const Padding(padding: EdgeInsets.only(bottom: 15)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "개발자 연락처 ",
                  style: TextStyle(
                    color: getThemeColor(1, 0),
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                Text(
                  "( 의견 제시 )",
                  style: TextStyle(
                    color: getThemeColor(1, 0),
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(bottom: 5)),
            Text(
              "이메일    -    iam0817jun@gmail.com",
              style: TextStyle(
                color: getThemeColor(1, 0),
              ),
            ),

            const Padding(padding: EdgeInsets.only(bottom: 35)),
            Material(
              color: getThemeColor(1, 0),
              borderRadius: BorderRadius.circular(20),
              child: InkWell(
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: FittedBox(
                    child: Text(
                      "데이터 초기화",
                      style: TextStyle(
                        color: getThemeColor(1, 1),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                )
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 20)),
          ],
        ),
      )
    );
  }
}