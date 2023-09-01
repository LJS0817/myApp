import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../config/define.dart';
import '../mng/DataMng.dart';

class customRadioButtonWithoutIcon extends StatelessWidget {
  customRadioButtonWithoutIcon(Function func, SKINTYPE name, int colorIdx, {super.key}) {
    onSelected = func;
    skinType = name;
    colorIndex = colorIdx;
  }

  late Function onSelected;
  int colorIndex = 0;
  SKINTYPE skinType = SKINTYPE.E_MINGAM;

  @override
  Widget build(BuildContext context) {
    DataMng dataMngProvider = Provider.of<DataMng>(context);
    return Container(
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: getThemeColor(colorIndex, dataMngProvider.data.skinType == skinType ? 0 : 3),
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
          },
          child: Center(
            child: Text(
              skinTypeToString(skinType),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: getThemeColor(colorIndex, dataMngProvider.data.skinType == skinType ? 1 : 0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}