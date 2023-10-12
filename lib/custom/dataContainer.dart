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
      builder: (context, cons) {
        return Container(
          height: 90,
          margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          decoration: BoxDecoration(
            color: getThemeColor(data.type.index, 0),
            borderRadius: const BorderRadius.all(Radius.circular(30)),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              splashColor: getThemeColor(data.type.index, 2).withOpacity(0.3),
              highlightColor: getThemeColor(data.type.index, 2).withOpacity(0.2),
              onTap: () {
                Provider.of<DataMng>(context, listen: false).setSelectedFileName(_path);
                Provider.of<Mng>(context, listen: false).showResultView(data, context);
              },
              child: Stack(
                children: [
                  Positioned(
                    top: 10,
                    bottom: 10,
                    left: 24,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 2,
                          fit: FlexFit.tight,
                          child: SizedBox(
                              child: FittedBox(
                                child: Text(
                                  data.name,
                                  style: TextStyle(
                                    color: getThemeColor(data.type.index, 1),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                          )
                        ),
                        Flexible(
                            flex: 1,
                            child: SizedBox(
                                child: FittedBox(
                                  child: Text(
                                    data.date,
                                    style: TextStyle(
                                      color: getThemeColor(data.type.index, 1),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                            )
                        ),
                        const Padding(padding: EdgeInsets.only(bottom: 5)),
                        Flexible(
                            flex: 2,
                            fit: FlexFit.loose,
                            child: SizedBox(
                                child: FittedBox(
                                  child: Text(
                                    typeToString(data.type),
                                    style: TextStyle(
                                      color: getThemeColor(data.type.index, 2),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                            )
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
                        width: 64,
                        height: 64,
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
                        fontSize: 22,
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