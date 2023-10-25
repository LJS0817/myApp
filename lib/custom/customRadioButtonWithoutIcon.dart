import 'package:flutter/material.dart';
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
    return AnimatedContainer(
      duration: const Duration(milliseconds: 240),
      height: 55 * sizeMng.defaultScale,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15 * sizeMng.defaultScale),
        color: getThemeColor(colorIndex, dataMngProvider.data.skinType == skinType ? 0 : 3),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(15 * sizeMng.defaultScale),
        child: InkWell(
          splashColor: getThemeColor(colorIndex, 0).withOpacity(0.4),
          highlightColor: getThemeColor(colorIndex, 0).withOpacity(0.4),
          borderRadius: BorderRadius.circular(15 * sizeMng.defaultScale),
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
            onSelected();
          },
          child: Center(
            child: FittedBox(
              child: Text(
                language.getText(skinTypeToTitleEnum(skinType)),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: sizeMng.defaultFontSize,
                  color: getThemeColor(colorIndex, dataMngProvider.data.skinType == skinType ? 1 : 0),
                ),
              ),
            )
          ),
        ),
      ),
    );
  }
}