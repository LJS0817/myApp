import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:isma/config/define.dart';
import 'package:isma/mng/DataMng.dart';
import 'package:isma/mng/OilMng.dart';
import 'package:provider/provider.dart';

import '../mng/PageMng.dart';

class EditableOilContainer extends StatelessWidget {
  int index = 0;
  int _page = 0;

  TextEditingController controller = TextEditingController();
  TextEditingController nameController = TextEditingController();
  String data = "";
  String name = "";


  EditableOilContainer(int id, int page, {super.key}) {
    index = id;
    _page = page;
  }

  int getIndexSub1() {
    if(_page - 1 >= 0) {
      return _page - 1;
    } else {
      return _page;
    }
  }

  @override
  Widget build(BuildContext context) {
    DataMng dataMngProvider = Provider.of<DataMng>(context);
    PageMng pageMngProvider = Provider.of<PageMng>(context);
    OilMng oilMng = Provider.of<OilMng>(context);

    List<String> list = dataMngProvider.data.data[_page - 1][index].toString().split('`');
    controller.text = list[0] == "0" || list[0] == 'null' ? "" : list[0];
    nameController.text = index > -1 ? oilMng.oils(index)!.korean : (list.length > 1 ? list[1] : "");

    return Container(
      height: 75,
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: getThemeColor(dataMngProvider.getTypeIndex(), 1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 3,
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
                  String str = dataMngProvider.data.data[_page - 1][index].toString().split('`')[0];
                  int weight = str == 'null' ? 0 : int.parse(dataMngProvider.data.data[_page - 1][index].toString().split('`')[0]);
                  log(_page.toString());
                  if(dataMngProvider.getTypeIndex() < 3) {
                    dataMngProvider.setWeight(_page, -weight!, needCal: _page < 3);
                  }
                  dataMngProvider.setData(getIndexSub1(), index, '-1');

                  FocusManager.instance.primaryFocus?.unfocus();
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
                        if(data.isNotEmpty) {
                          int weight = dataMngProvider.data.data[_page - 1][index].toString().split('`')[0] == "null" ? 0 : int.parse(dataMngProvider.data.data[_page - 1][index].toString().split('`')[0]);
                          if(dataMngProvider.getTypeIndex() < 3) {
                            dataMngProvider.setWeight(_page, -weight!, needCal: _page < 3);
                          }
                          dataMngProvider.setData(getIndexSub1(), index, '$data`${nameController.text}');
                          if(dataMngProvider.getTypeIndex() < 3) {
                            weight = int.parse(dataMngProvider.data.data[_page - 1][index].toString().split('`')[0]);
                            dataMngProvider.setWeight(_page, weight!, needCal: _page < 3);
                          }
                        }
                        FocusManager.instance.primaryFocus?.unfocus();
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
                  _page == 4 ? "dr" : "G",
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
                Container(
                  width: 150,
                  height: 20,
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.zero,
                  child: Focus(
                    onFocusChange: (hasFocus) {
                      if(!hasFocus) {
                        String str = dataMngProvider.data.data[_page - 1][index].toString();
                        if(!str.contains('`')) {
                          str += '`0';
                        }
                        str = str.replaceRange(str.indexOf('`') + 1, null, name);
                        dataMngProvider.setData(getIndexSub1(), index, str);

                        FocusManager.instance.primaryFocus?.unfocus();
                      }
                    },
                    child: TextField(
                      controller: nameController,
                      readOnly: index > -1,
                      textAlignVertical: TextAlignVertical.top,
                      onChanged: (_) {
                        name = _;
                      },
                      decoration: InputDecoration(
                        isDense: true,
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                        hintText: "${pageMngProvider.addButtonText(dataMngProvider.getTypeIndex(), _page)}명",
                        hintStyle: TextStyle(
                            color: getThemeColor(dataMngProvider.getTypeIndex(), 0),
                            fontWeight: FontWeight.bold,
                            fontSize: 17
                        ),
                      ),
                      style: TextStyle(
                        color: getThemeColor(dataMngProvider.getTypeIndex(), 0),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  )
                ),
                Text(
                  index < -1 ? pageMngProvider.addButtonText(dataMngProvider.getTypeIndex(), _page) : oilMng.oils(index)!.english,
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