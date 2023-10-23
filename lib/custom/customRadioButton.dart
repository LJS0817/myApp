import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:isma/mng/PageMng.dart';
import 'package:provider/provider.dart';

import '../config/define.dart';
import '../mng/DataMng.dart';

class customRadioButton extends StatelessWidget {
  customRadioButton(Function func, TYPE name, int colorIdx, {super.key}) {
    onSelected = func;
    data = name;
    colorIndex = colorIdx;
  }

  late Function onSelected;
  int colorIndex = 0;
  TYPE data = TYPE.E_COLD;

  @override
  Widget build(BuildContext context) {
    DataMng dataMngProvider = Provider.of<DataMng>(context);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 240),
      height: 120 * sizeMng.defaultScale,
      padding: const EdgeInsets.only(top: 8, left: 10, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: getThemeColor(colorIndex, dataMngProvider.data.type == data ? 0 : 3),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
          splashColor: getThemeColor(colorIndex, 0).withOpacity(0.4),
          highlightColor: getThemeColor(colorIndex, 0).withOpacity(0.4),
          borderRadius: BorderRadius.circular(15),
          onTap: () {
            onSelected();
            Provider.of<PageMng>(context, listen: false).UpdateText(dataMngProvider.data);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 55 * sizeMng.defaultScale,
                height: 55 * sizeMng.defaultScale,
                padding: EdgeInsets.all(12 * sizeMng.defaultScale),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                  color: getThemeColor(colorIndex, dataMngProvider.data.type == data ? 1 : 0),
                ),
                child: SvgPicture.asset(
                  getIcon(data),
                  color: getThemeColor(colorIndex, dataMngProvider.data.type == data ? 0 : 1),
                ),
              ),
              FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  typeToString(data),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: sizeMng.defaultFontSize,
                    color: getThemeColor(colorIndex, dataMngProvider.data.type == data ? 1 : 0),
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