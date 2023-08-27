import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:isma/config/define.dart';
import 'package:isma/mng/Mng.dart';
import 'package:provider/provider.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    Mng mngProvider = Provider.of<Mng>(context);
    return Container(
      height: 70,
      child: Row(
        children: [
          Expanded(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {

                },
                splashColor: getThemeColor(mngProvider.getDataType(), 0).withOpacity(0.4),
                highlightColor: getThemeColor(mngProvider.getDataType(), 0).withOpacity(0.4),
                child: Container(
                  height: double.maxFinite,
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        pageMng.index > 0 ? 'assets/icon/arrow_left.svg' : 'assets/icon/exit.svg',
                        width: pageMng.index > 0 ? 20: 15,
                        height: pageMng.index > 0 ? 20 : 15,
                        color: getThemeColor(mngProvider.getDataType(), 0),
                      ),
                      Padding(padding: EdgeInsets.symmetric(horizontal: pageMng.index > 0 ? 2 : 5)),
                      Text(
                        "나가기",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: getThemeColor(mngProvider.getDataType(), 0)
                        ),
                      ),
                    ],
                  )
                ),
              ),
            )
          ),
          Visibility(
            visible: pageMng.index > 0 && pageMng.index < pageMng.MAX_INDEX,
            child: Expanded(
              child: Container(
                color: Colors.blue,
              ),
            ),
          ),
          Expanded(
              child: Material(
                color: getThemeColor(mngProvider.getDataType(), 0),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30)),
                child: InkWell(
                  onTap: () {

                  },
                  splashColor: getThemeColor(mngProvider.getDataType(), 1).withOpacity(0.4),
                  highlightColor: getThemeColor(mngProvider.getDataType(), 1).withOpacity(0.4),
                  child: Container(
                      height: double.maxFinite,
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(padding: EdgeInsets.symmetric(horizontal: 7)),
                          Text(
                            "다음",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: getThemeColor(mngProvider.getDataType(), 1)
                            ),
                          ),
                          Padding(padding: EdgeInsets.symmetric(horizontal: pageMng.index < pageMng.MAX_INDEX ? 2 : 5)),
                          SvgPicture.asset(
                            pageMng.index < pageMng.MAX_INDEX ? 'assets/icon/arrow_right.svg' : 'assets/icon/save.svg',
                            width: pageMng.index < pageMng.MAX_INDEX ? 20 : 15,
                            height: pageMng.index < pageMng.MAX_INDEX ? 20 : 15,
                            color: getThemeColor(mngProvider.getDataType(), 1),
                          ),
                        ],
                      )
                  ),
                ),
              )
          ),
        ],
      ),
    );
  }
}