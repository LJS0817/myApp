import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:isma/config/define.dart';
import 'package:isma/mng/Mng.dart';
import 'package:provider/provider.dart';

import '../mng/DataMng.dart';


class DataContainer extends StatelessWidget {

  late Data data;
  String _path = "";

  DataContainer(String str, String path, {super.key}) {
    data = parseData(str);
    _path = path;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints cons) {
        return Container(
          height: 90 * sizeMng.defaultScale,
          margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          decoration: BoxDecoration(
            color: getThemeColor(data.type.index, 0),
            borderRadius: BorderRadius.all(Radius.circular(30 * sizeMng.defaultScale)),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.all(Radius.circular(30 * sizeMng.defaultScale)),
              splashColor: getThemeColor(data.type.index, 2).withOpacity(0.3),
              highlightColor: getThemeColor(data.type.index, 2).withOpacity(0.2),
              onTap: () {
                Provider.of<DataMng>(context, listen: false).setSelectedFileName(_path);
                Provider.of<Mng>(context, listen: false).showResultView(data, context);
              },
              child: Stack(
                children: [
                  Positioned(
                    top: 5,
                    bottom: 5,
                    left: 24,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 3,
                          child: FittedBox(
                            child: Text(
                              data.name.isEmpty ? " " : data.name,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: getThemeColor(data.type.index, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: sizeMng.defaultFontSize - 2,
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                            flex: 2,
                            child: FittedBox(
                              child: Text(
                                data.date,
                                style: TextStyle(
                                  color: getThemeColor(data.type.index, 1),
                                  fontWeight: FontWeight.bold,
                                  fontSize: sizeMng.defaultFontSize - 2,
                                ),
                              ),
                            ),
                        ),
                        const Padding(padding: EdgeInsets.only(bottom: 5)),
                        Flexible(
                            flex: 4,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "${language.getText(typeToTitleEnum(data.type))} "
                                    "${data.type.index > 2 ? "[ ${language.getText(skinTypeToTitleEnum(data.skinType))} ${language.getText(TITLE.E_SKINTYPE_TITLE)} ]" :
                                        data.isReturn ? "[ ${language.getText(TITLE.E_OIL_SOAPHWA)} ]" : ""}",
                                style: TextStyle(
                                  color: getThemeColor(data.type.index, 2),
                                  fontWeight: FontWeight.bold,
                                  fontSize: sizeMng.defaultFontSize - 2,
                                ),
                              ),
                            ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      right: 25,
                      top: 0,
                      bottom: 0,
                      child: SvgPicture.asset(
                        getIcon(data.type),
                        width: 64 * sizeMng.defaultScale,
                        height: 64 * sizeMng.defaultScale,
                        color: getThemeColor(data.type.index, 2).withOpacity(0.3),
                      )
                  ),
                  Positioned(
                    right: 25,
                    bottom: 8,
                    child: Text(
                      "${data.weight[0]}G",
                      style: TextStyle(
                        color: getThemeColor(data.type.index, 2).withOpacity(0.9),
                        fontSize: sizeMng.defaultFontSize + 6,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}