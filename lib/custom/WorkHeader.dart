import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:isma/config/define.dart';
import 'package:provider/provider.dart';

import '../mng/DataMng.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    DataMng dataMngProvider = Provider.of<DataMng>(context);
    return Container(
      decoration: BoxDecoration(
        color: getThemeColor(dataMngProvider.data.type.index, 0),
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
                  getIcon(dataMngProvider.data.type),
                  width: 128,
                  height: 128,
                  color: getThemeColor(dataMngProvider.data.type.index, 2).withOpacity(0.15),
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
                          dataMngProvider.data.name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              color: getThemeColor(dataMngProvider.data.type.index, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                          ),
                        ),
                        const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
                        Text(
                          DateTime.now().toString().split(' ')[0],
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              color: getThemeColor(dataMngProvider.data.type.index, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                          ),
                        ),
                        const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
                        Text(
                          "${typeToString(dataMngProvider.data.type)} ${dataMngProvider.data.isReturn ? "[ 비누화수 ]" : (dataMngProvider.getTypeIndex() < 3 ? "[ 일반비누 ]" : "")}",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              color: getThemeColor(dataMngProvider.data.type.index, 2),
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                          ),
                        ),
                        Visibility(
                          visible: dataMngProvider.getTypeIndex() > 2,
                          child: Text(
                            "[ ${skinTypeToString(dataMngProvider.data.skinType)} 피부 ]",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                color: getThemeColor(dataMngProvider.data.type.index, 2),
                                fontWeight: FontWeight.bold,
                                fontSize: 16
                            ),
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
                              dataMngProvider.getTypeIndex() > 2 ? "수상층" : "오일",
                              style: TextStyle(
                                  color: getThemeColor(dataMngProvider.data.type.index, 1),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13
                              ),
                            ),
                            const Padding(padding: EdgeInsets.symmetric(vertical: 2)),

                            Text(
                              dataMngProvider.getTypeIndex() > 2 ? "유상층" : "슈퍼펫",
                              style: TextStyle(
                                  color: getThemeColor(dataMngProvider.data.type.index, 1),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13
                              ),
                            ),
                            const Padding(padding: EdgeInsets.symmetric(vertical: 2)),

                            Text(
                              dataMngProvider.getTypeIndex() > 2 ? "유화제" : "첨가물",
                              style: TextStyle(
                                  color: getThemeColor(dataMngProvider.data.type.index, 1),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13
                              ),
                            ),
                            const Padding(padding: EdgeInsets.symmetric(vertical: 2)),

                            Text(
                              "총량",
                              style: TextStyle(
                                  color: getThemeColor(dataMngProvider.data.type.index, 1),
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
                              dataMngProvider.data.weight[1].toString(),
                              style: TextStyle(
                                  color: getThemeColor(dataMngProvider.data.type.index, 1),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13
                              ),
                            ),
                            const Padding(padding: EdgeInsets.symmetric(vertical: 2)),

                            Text(
                              dataMngProvider.data.weight[2].toString(),
                              style: TextStyle(
                                  color: getThemeColor(dataMngProvider.data.type.index, 1),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13
                              ),
                            ),
                            const Padding(padding: EdgeInsets.symmetric(vertical: 2)),

                            Text(
                              dataMngProvider.data.weight[3].toString(),
                              style: TextStyle(
                                  color: getThemeColor(dataMngProvider.data.type.index, 1),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13
                              ),
                            ),
                            const Padding(padding: EdgeInsets.symmetric(vertical: 2)),

                            Text(
                              dataMngProvider.data.weight[0].toString(),
                              style: TextStyle(
                                  color: getThemeColor(dataMngProvider.data.type.index, 1),
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