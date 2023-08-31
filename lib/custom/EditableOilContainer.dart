import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:isma/config/define.dart';
import 'package:isma/mng/DataMng.dart';
import 'package:provider/provider.dart';

import '../mng/PageMng.dart';

class EditableOilContainer extends StatelessWidget {
  int index = 0;

  TextEditingController controller = TextEditingController();
  String data = "";


  EditableOilContainer(int id, {super.key}) {
    index = id;
  }

  @override
  Widget build(BuildContext context) {
    DataMng dataMngProvider = Provider.of<DataMng>(context);
    PageMng pageMngProvider = Provider.of<PageMng>(context);
    controller.text = dataMngProvider.data.data[pageMngProvider.index - 1][index].toString() == "0" ? "" : dataMngProvider.data.data[pageMngProvider.index - 1][index].toString();
    return Container(
      height: 75,
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: getThemeColor(dataMngProvider.getTypeIndex(), 1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 4,
          color: getThemeColor(dataMngProvider.getTypeIndex(), 0),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                onTap: () {
                  dataMngProvider.setWeight(pageMngProvider.index, -dataMngProvider.data.data[pageMngProvider.index - 1][index]!);
                  dataMngProvider.setData(pageMngProvider.getIndexSub1(), index, -1);
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                splashColor: getThemeColor(dataMngProvider.getTypeIndex(), 0).withOpacity(0.4),
                highlightColor: getThemeColor(dataMngProvider.getTypeIndex(), 0).withOpacity(0.4),
                child: Container(
                    height: double.maxFinite,
                    width: 35,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(left: 5),
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: SvgPicture.asset(
                      'assets/icon/close.svg',
                      width: 20,
                      height: 20,
                      color: getThemeColor(dataMngProvider.getTypeIndex(), 0),
                    ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 15,
            top: 5,
            bottom: 0,
            child: Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 150,
                  child: Focus(
                    onFocusChange: (hasFocus) {
                      if(!hasFocus) {
                        log(pageMngProvider.index.toString());
                        log(index.toString());
                        if(data.isNotEmpty) {
                          dataMngProvider.setWeight(pageMngProvider.index, -dataMngProvider.data.data[pageMngProvider.index - 1][index]!);
                          dataMngProvider.setData(pageMngProvider.getIndexSub1(), index, int.parse(data));
                          dataMngProvider.setWeight(pageMngProvider.index, dataMngProvider.data.data[pageMngProvider.index - 1][index]!);
                        }
                      }
                    },
                    child: TextField(
                      controller: controller,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      textDirection: TextDirection.rtl,
                      onChanged: (_) {
                        data = _;
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                      ],
                      style: TextStyle(
                          color: getThemeColor(dataMngProvider.getTypeIndex(), 0),
                          fontWeight: FontWeight.bold,
                          fontSize: 17
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "0",
                        hintTextDirection: TextDirection.rtl,
                        hintStyle: TextStyle(
                          color: getThemeColor(dataMngProvider.getTypeIndex(), 0),
                          fontWeight: FontWeight.bold,
                          fontSize: 17
                        ),
                      ),
                    ),
                  )
                ),
                Text(
                  "G",
                  style: TextStyle(
                      color: getThemeColor(dataMngProvider.getTypeIndex(), 0),
                      fontWeight: FontWeight.bold,
                      fontSize: 17
                  ),
                ),
              ],
            )
          ),
          Positioned(
            left: 40,
            top: 0,
            bottom: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  oilMng.oils[index]!.korean,
                  style: TextStyle(
                    color: getThemeColor(dataMngProvider.getTypeIndex(), 0),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  oilMng.oils[index]!.english,
                  style: TextStyle(
                    color: getThemeColor(dataMngProvider.getTypeIndex(), 0).withOpacity(0.6),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}