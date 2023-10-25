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
    data = list[0] == "0" || list[0] == 'null' ? "" : list[0];
    name = index > -1 ? oilMng.oils(index)!.title : (list.length > 1 ? list[1] : "");

    return Container(
      height: 75 * sizeMng.defaultScale,
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: getThemeColor(dataMngProvider.getTypeIndex(), 1),
        borderRadius: BorderRadius.circular(20 * sizeMng.defaultScale),
        border: Border.all(
          width: 3 * sizeMng.defaultScale,
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
                  dataMngProvider.setWeight(_page, -weight!, needCal: _page < 3 && dataMngProvider.getTypeIndex() < 3);
                  dataMngProvider.setData(getIndexSub1(), index, '-1', needRefresh: true);
                  pageMngProvider.UpdateText(dataMngProvider.data);
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
                      width: 20 * sizeMng.defaultScale,
                      height: 20 * sizeMng.defaultScale,
                      color: getThemeColor(dataMngProvider.getTypeIndex(), 0),
                    ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 15,
            bottom: 0,
            child: Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 150 * sizeMng.defaultScale,
                  child: Focus(
                    onFocusChange: (hasFocus) {
                      if(!hasFocus) {
                        if(data.isNotEmpty) {
                          int weight = dataMngProvider.data.data[_page - 1][index].toString().split('`')[0] == "null" ? 0 : int.parse(dataMngProvider.data.data[_page - 1][index].toString().split('`')[0]);

                          dataMngProvider.setWeight(_page, -weight!, needCal: _page < 3 && dataMngProvider.getTypeIndex() < 3);

                          dataMngProvider.setData(getIndexSub1(), index, '$data`$name');

                          weight = int.parse(dataMngProvider.data.data[_page - 1][index].toString().split('`')[0]);

                          dataMngProvider.setWeight(_page, weight!, needCal: _page < 3 && dataMngProvider.getTypeIndex() < 3);

                          pageMngProvider.UpdateText(dataMngProvider.data);
                        }
                      } else {
                        if(pageMngProvider.index >= pageMngProvider.MAX_INDEX(dataMngProvider.getTypeIndex())) {
                          pageMngProvider.setBeforeSaveEvent(() {
                            if(data.isNotEmpty) {
                              int weight = dataMngProvider.data.data[_page - 1][index].toString().split('`')[0] == "null" ? 0 : int.parse(dataMngProvider.data.data[_page - 1][index].toString().split('`')[0]);

                              dataMngProvider.setWeight(_page, -weight!, needCal: _page < 3 && dataMngProvider.getTypeIndex() < 3);

                              dataMngProvider.setData(getIndexSub1(), index, '$data`$name');

                              weight = int.parse(dataMngProvider.data.data[_page - 1][index].toString().split('`')[0]);

                              dataMngProvider.setWeight(_page, weight!, needCal: _page < 3 && dataMngProvider.getTypeIndex() < 3);

                              pageMngProvider.UpdateText(dataMngProvider.data);
                            }
                          });
                        }
                      }
                    },
                    child: TextFormField(
                      initialValue: data,
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
                        fontSize: sizeMng.defaultFontSize + 1,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "0",
                        hintTextDirection: TextDirection.rtl,
                        hintStyle: TextStyle(
                          color: getThemeColor(dataMngProvider.getTypeIndex(), 0),
                          fontWeight: FontWeight.bold,
                          fontSize: sizeMng.defaultFontSize + 1,
                        ),
                      ),
                    ),
                  )
                ),
                Text(
                  _page == 5 ? "dr" : "G",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: getThemeColor(dataMngProvider.getTypeIndex(), 0),
                      fontWeight: FontWeight.bold,
                    fontSize: sizeMng.defaultFontSize + 1,
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
                  width: 150 * sizeMng.defaultScale,
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
                      }
                    },
                    child: TextFormField(
                      key: UniqueKey(),
                      initialValue: name,
                      readOnly: index > -1,
                      textAlignVertical: TextAlignVertical.top,
                      onChanged: (_) {
                        name = _;
                      },
                      decoration: InputDecoration(
                        isDense: true,
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                        hintText: "${pageMngProvider.addButtonText(dataMngProvider.getTypeIndex(), _page)}${language.isEng ? " Name" : "명"}",
                        hintStyle: TextStyle(
                          color: getThemeColor(dataMngProvider.getTypeIndex(), 0),
                          fontWeight: FontWeight.bold,
                          fontSize: sizeMng.defaultFontSize + 1,
                        ),
                      ),
                      style: TextStyle(
                        color: getThemeColor(dataMngProvider.getTypeIndex(), 0),
                        fontWeight: FontWeight.bold,
                        fontSize: sizeMng.defaultFontSize + 1,
                      ),
                    ),
                  )
                ),
                Text(
                  index < -1 ? pageMngProvider.addButtonText(dataMngProvider.getTypeIndex(), _page) : language.isEng ? pageMngProvider.addButtonText(dataMngProvider.getTypeIndex(), _page) : oilMng.oils(index)!.english,
                  style: TextStyle(
                    color: getThemeColor(dataMngProvider.getTypeIndex(), 0).withOpacity(0.6),
                    fontSize: sizeMng.defaultFontSize - 2,
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