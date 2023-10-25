import 'package:flutter/material.dart';
import 'package:isma/config/define.dart';
import 'package:isma/workspace/config/themeConfig.dart';

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
              language.getText(TITLE.E_CONFIG_COLOR_TITLE),
              style: TextStyle(
                  color: getThemeColor(1, 0),
                  fontSize: sizeMng.defaultFontSize + 4,
                  fontWeight: FontWeight.bold
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 5)),
            ThemeChanger(),
            const Padding(padding: EdgeInsets.only(bottom: 5)),
            Text(
              "1 - ${language.getText(TITLE.E_SOAPTITLE)}, 2 - ${language.getText(TITLE.E_MAKEUPTITLE)}, 3 - ${language.getText(TITLE.E_OILTITLE)}, 4 - ${language.getText(TITLE.E_CONFIGTITLE)}",

              textAlign: TextAlign.right,
              style: TextStyle(
                color: getThemeColor(1, 0),
                fontSize: sizeMng.defaultFontSize - 4,
                fontWeight: FontWeight.bold
              ),
            ),

            const Padding(padding: EdgeInsets.only(bottom: 15)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "${language.getText(TITLE.E_CONFIG_CONTACT_TITLE)} ",
                  style: TextStyle(
                    color: getThemeColor(1, 0),
                    fontWeight: FontWeight.bold,
                    fontSize: sizeMng.defaultFontSize + 1,
                  ),
                ),
                Text(
                  language.getText(TITLE.E_CONFIG_CONTACT_WHY),
                  style: TextStyle(
                    color: getThemeColor(1, 0),
                    fontWeight: FontWeight.bold,
                    fontSize: sizeMng.defaultFontSize - 4,
                  ),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(bottom: 5)),
            Text(
              "${language.getText(TITLE.E_CONFIG_CONTACT_INFO)}    -    iam0817jun@gmail.com",
              style: TextStyle(
                color: getThemeColor(1, 0),
                fontSize: sizeMng.defaultFontSize - 2,
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 20)),
          ],
        ),
      )
    );
  }
}