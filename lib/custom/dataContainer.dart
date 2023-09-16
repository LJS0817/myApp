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
    return Container(
        height: 98,
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
                    left: 30,
                    top: 15,
                    child: Text(
                      data.name,
                      style: TextStyle(
                        color: getThemeColor(data.type.index, 1),
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 30,
                    top: 43,
                    child: Text(
                      data.date,
                      style: TextStyle(
                        color: getThemeColor(data.type.index, 1),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 30,
                    top: 64,
                    child: Text(
                      typeToString(data.type),
                      style: TextStyle(
                        color: getThemeColor(data.type.index, 2),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 25,
                    top: 17,
                    child: SvgPicture.asset(
                      getIcon(data.type),
                      width: 64,
                      height: 64,
                      color: getThemeColor(data.type.index, 2).withOpacity(0.3),
                    ),
                  ),
                  Positioned(
                    right: 25,
                    bottom: 14,
                    child: Text(
                      "${data.weight[0]}G",
                      style: TextStyle(
                        color: getThemeColor(data.type.index, 2).withOpacity(0.8),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
          ),
        ),
    );
  }
}