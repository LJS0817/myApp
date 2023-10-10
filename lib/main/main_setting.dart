import 'package:flutter/material.dart';
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
            ThemeChanger(),
            const Padding(padding: EdgeInsets.only(bottom: 10)),
            Text(
              "1 - 비누 2 - 화장품 3 - 오일 4 - 설정",
              textAlign: TextAlign.right,
              style: TextStyle(
                color: getMainColor(context),
                fontSize: 12,
                fontWeight: FontWeight.bold
              ),
            ),

            const Padding(padding: EdgeInsets.only(bottom: 10)),
            Material(
              color: getMainColor(context),
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
                        color: getSecondColor(context),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                )
              ),
            )
          ],
        ),
      )
    );
  }
}