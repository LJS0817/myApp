import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
    return Container(
      height: 120,
      padding: EdgeInsets.only(top: 8),
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
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 60,
                height: 60,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  color: getThemeColor(colorIndex, dataMngProvider.data.type == data ? 1 : 0),
                ),
                child: SvgPicture.asset(
                  getIcon(data),
                  color: getThemeColor(colorIndex, dataMngProvider.data.type == data ? 0 : 1),
                ),
              ),
              Center(
                child: Text(
                  typeToString(data),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
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