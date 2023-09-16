import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:isma/config/colors.dart';
import 'package:isma/custom/circleChart.dart';
import 'package:isma/custom/customTextField.dart';
import 'package:isma/custom/resultOilBox.dart';
import 'package:isma/custom/resultOilDetails.dart';
import 'package:isma/custom/resultValueBox.dart';
import 'package:isma/config/define.dart';
import 'package:isma/mng/MenuMng.dart';
import 'package:isma/mng/Mng.dart';
import 'package:isma/mng/PageMng.dart';
import 'package:provider/provider.dart';
import 'package:isma/custom/graph.dart';

import '../mng/DataMng.dart';

class oResultView extends StatelessWidget {

  double leftPadding = 15;
  int themeIndex = 0;

  oResultView(int idx, double padding, {super.key}) {
    themeIndex = idx;
    leftPadding = padding;
  }

  @override
  Widget build(BuildContext context) {
    Mng data = Provider.of<Mng>(context);
    PageMng pageMng = Provider.of<PageMng>(context);
    DataMng dataMng = Provider.of<DataMng>(context);
    MenuMng menuMng = Provider.of<MenuMng>(context);

    return Visibility(
      visible: data.popUpActive,
      child: Stack(
        children: [
          Positioned(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Material(
                color: Colors.black.withOpacity(0.6),
                child: InkWell(
                  onTap: () {
                    data.hideResultView();
                  },
                ),
              ),
            ),
          ),
          Positioned(
            child: Center(
              child: Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  height: 600,
                  width: MediaQuery.of(context).size.width,
                  child: Text("DASDA"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}