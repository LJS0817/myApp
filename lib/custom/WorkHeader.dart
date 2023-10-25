import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:isma/config/define.dart';
import 'package:isma/mng/PageMng.dart';
import 'package:provider/provider.dart';

import '../mng/DataMng.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {

  @override
  Widget build(BuildContext context) {
    DataMng dataMngProvider = Provider.of<DataMng>(context);
    PageMng pageMng = Provider.of<PageMng>(context);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 240),
      decoration: BoxDecoration(
        color: getThemeColor(dataMngProvider.data.type.index, 0),
        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40)),
      ),
      child: SafeArea(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.18,
            width: double.maxFinite,
            child: Stack(
              children: [
                Container(
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.center,
                    child: FittedBox(
                      child: SvgPicture.asset(
                        getIcon(dataMngProvider.data.type),
                        width: 128,
                        height: 128,
                        color: getThemeColor(dataMngProvider.data.type.index, 2).withOpacity(0.15),
                      ),
                    )
                ),
                Positioned(
                    left: 20,
                    bottom: 0,
                    top: 0,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            dataMngProvider.data.name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              color: getThemeColor(dataMngProvider.data.type.index, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: sizeMng.defaultFontSize,
                            ),
                          ),
                          Text(
                            DateTime.now().toString().split(' ')[0],
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              color: getThemeColor(dataMngProvider.data.type.index, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: sizeMng.defaultFontSize - 3,
                            ),
                          ),
                          const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
                          Text(
                            "${language.getText(typeToTitleEnum(dataMngProvider.data.type))} ${(dataMngProvider.getTypeIndex() < 3 ? dataMngProvider.data.isReturn && dataMngProvider.getTypeIndex() != 1 ? "[ ${language.getText(TITLE.E_OIL_SOAPHWA)} ]" :  "[ ${language.getText(TITLE.E_OIL_NORMAL)} ]" : "")}",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              color: getThemeColor(dataMngProvider.data.type.index, 2),
                              fontWeight: FontWeight.bold,
                              fontSize: sizeMng.defaultFontSize - 2,
                            ),
                          ),
                          Visibility(
                            visible: dataMngProvider.getTypeIndex() > 2,
                            child: Text(
                              "[ ${language.getText(skinTypeToTitleEnum(dataMngProvider.data.skinType))} ${language.getText(TITLE.E_SKINTYPE_TITLE)} ]",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                color: getThemeColor(dataMngProvider.data.type.index, 2),
                                fontWeight: FontWeight.bold,
                                fontSize: sizeMng.defaultFontSize - 2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                ),
                Positioned(
                  top: 20,
                  right: 20,
                  bottom: 20,
                  child: Container(
                      alignment: Alignment.topRight,
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: pageMng.headerText,
                      )
                    // Stack(
                    //   children: [
                    //     Positioned(
                    //       left: 0,
                    //       child: Column(
                    //         crossAxisAlignment: CrossAxisAlignment.end,
                    //         children: [
                    //           Text(
                    //             dataMngProvider.getTypeIndex() > 2 ? "수상층" : "오일",
                    //             style: TextStyle(
                    //                 color: getThemeColor(dataMngProvider.data.type.index, 1),
                    //                 fontWeight: FontWeight.bold,
                    //                 fontSize: 13
                    //             ),
                    //           ),
                    //           const Padding(padding: EdgeInsets.symmetric(vertical: 2)),
                    //
                    //           Text(
                    //             dataMngProvider.getTypeIndex() > 2 ? "유상층" : "슈퍼펫",
                    //             style: TextStyle(
                    //                 color: getThemeColor(dataMngProvider.data.type.index, 1),
                    //                 fontWeight: FontWeight.bold,
                    //                 fontSize: 13
                    //             ),
                    //           ),
                    //           const Padding(padding: EdgeInsets.symmetric(vertical: 2)),
                    //
                    //           Text(
                    //             dataMngProvider.getTypeIndex() > 2 ? "유화제" : "첨가물",
                    //             style: TextStyle(
                    //                 color: getThemeColor(dataMngProvider.data.type.index, 1),
                    //                 fontWeight: FontWeight.bold,
                    //                 fontSize: 13
                    //             ),
                    //           ),
                    //           const Padding(padding: EdgeInsets.symmetric(vertical: 2)),
                    //
                    //           Text(
                    //             "총량",
                    //             style: TextStyle(
                    //                 color: getThemeColor(dataMngProvider.data.type.index, 1),
                    //                 fontWeight: FontWeight.bold,
                    //                 fontSize: 13
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //     // Positioned(
                    //     //   right: 0,
                    //     //   child: Column(
                    //     //     crossAxisAlignment: CrossAxisAlignment.end,
                    //     //     children: [
                    //     //       Text(
                    //     //         dataMngProvider.data.weight[1].toString(),
                    //     //         style: TextStyle(
                    //     //             color: getThemeColor(dataMngProvider.data.type.index, 1),
                    //     //             fontWeight: FontWeight.bold,
                    //     //             fontSize: 13
                    //     //         ),
                    //     //       ),
                    //     //       const Padding(padding: EdgeInsets.symmetric(vertical: 2)),
                    //     //
                    //     //       Text(
                    //     //         dataMngProvider.data.weight[2].toString(),
                    //     //         style: TextStyle(
                    //     //             color: getThemeColor(dataMngProvider.data.type.index, 1),
                    //     //             fontWeight: FontWeight.bold,
                    //     //             fontSize: 13
                    //     //         ),
                    //     //       ),
                    //     //       const Padding(padding: EdgeInsets.symmetric(vertical: 2)),
                    //     //
                    //     //       Text(
                    //     //         dataMngProvider.data.weight[3].toString(),
                    //     //         style: TextStyle(
                    //     //             color: getThemeColor(dataMngProvider.data.type.index, 1),
                    //     //             fontWeight: FontWeight.bold,
                    //     //             fontSize: 13
                    //     //         ),
                    //     //       ),
                    //     //       const Padding(padding: EdgeInsets.symmetric(vertical: 2)),
                    //     //
                    //     //       Text(
                    //     //         dataMngProvider.data.weight[0].toString(),
                    //     //         style: TextStyle(
                    //     //             color: getThemeColor(dataMngProvider.data.type.index, 1),
                    //     //             fontWeight: FontWeight.bold,
                    //     //             fontSize: 13
                    //     //         ),
                    //     //       ),
                    //     //     ],
                    //     //   ),
                    //     // )
                    //   ],
                    // ),
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}


// class Header extends StatelessWidget {
//   const Header({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//
//   }
// }