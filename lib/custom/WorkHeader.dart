import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:isma/config/define.dart';
import 'package:isma/mng/Mng.dart';
import 'package:provider/provider.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    Mng mngProvider = Provider.of<Mng>(context);
    return Container(
      decoration: BoxDecoration(
        color: getThemeColor(mngProvider.getDataType(), 0),
        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40)),
      ),
      child: SafeArea(
        child: Container(
          height: 160,
          width: double.maxFinite,
          child: Stack(
            children: [
              Center(
                child: SvgPicture.asset(
                  getIcon(mngProvider.getData().type),
                  width: 128,
                  height: 128,
                  color: getThemeColor(mngProvider.getDataType(), 2).withOpacity(0.3),
                ),
              ),
              Positioned(
                  top: 30,
                  left: 20,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.55,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "가나다라마사아자차카타파하카나12edasf",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              color: getThemeColor(mngProvider.getDataType(), 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                          ),
                        ),
                        const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
                        Text(
                          "2023-12-12",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              color: getThemeColor(mngProvider.getDataType(), 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                          ),
                        ),
                        const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
                        Text(
                          "C.P 형 비누",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              color: getThemeColor(mngProvider.getDataType(), 2),
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                          ),
                        ),
                      ],
                    ),
                  )
              ),
              Positioned(
                top: 30,
                right: 20,
                child: Container(
                  alignment: Alignment.topRight,
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: double.maxFinite,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "오일",
                              style: TextStyle(
                                  color: getThemeColor(mngProvider.getDataType(), 1),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13
                              ),
                            ),
                            const Padding(padding: EdgeInsets.symmetric(vertical: 2)),

                            Text(
                              "슈퍼펫",
                              style: TextStyle(
                                  color: getThemeColor(mngProvider.getDataType(), 1),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13
                              ),
                            ),
                            const Padding(padding: EdgeInsets.symmetric(vertical: 2)),

                            Text(
                              "첨가물",
                              style: TextStyle(
                                  color: getThemeColor(mngProvider.getDataType(), 1),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13
                              ),
                            ),
                            const Padding(padding: EdgeInsets.symmetric(vertical: 2)),

                            Text(
                              "총량",
                              style: TextStyle(
                                  color: getThemeColor(mngProvider.getDataType(), 1),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "1245667",
                              style: TextStyle(
                                  color: getThemeColor(mngProvider.getDataType(), 1),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13
                              ),
                            ),
                            const Padding(padding: EdgeInsets.symmetric(vertical: 2)),

                            Text(
                              "125125",
                              style: TextStyle(
                                  color: getThemeColor(mngProvider.getDataType(), 1),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13
                              ),
                            ),
                            const Padding(padding: EdgeInsets.symmetric(vertical: 2)),

                            Text(
                              "51234213",
                              style: TextStyle(
                                  color: getThemeColor(mngProvider.getDataType(), 1),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13
                              ),
                            ),
                            const Padding(padding: EdgeInsets.symmetric(vertical: 2)),

                            Text(
                              "124128912",
                              style: TextStyle(
                                  color: getThemeColor(mngProvider.getDataType(), 1),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}