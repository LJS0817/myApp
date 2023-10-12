import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:isma/config/colors.dart';
import 'package:isma/config/define.dart';
import 'package:isma/custom/OilDialog.dart';
import 'package:isma/custom/WorkFooter.dart';
import 'package:isma/custom/WorkHeader.dart';
import 'package:isma/custom/uOilDialog.dart';
import 'package:isma/mng/MenuMng.dart';
import 'package:isma/mng/Mng.dart';
import 'package:isma/mng/PageMng.dart';
import 'package:provider/provider.dart';

import '../custom/step.dart';
import '../mng/DataMng.dart';

class BeautyWorkspace extends StatelessWidget {
  const BeautyWorkspace({super.key});

  @override
  Widget build(BuildContext context) {
    DataMng dataMng = Provider.of<DataMng>(context);
    PageMng pageMng = Provider.of<PageMng>(context);
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        onHorizontalDragEnd: (DragEndDetails _) {
          if(_.primaryVelocity! > 0) {
            pageMng.prevPage(dataMng.getTypeIndex(), dataMng.data);
          } else if(_.primaryVelocity! < 0) {
            pageMng.nextPage(dataMng.getTypeIndex(), dataMng.data);
          }
        },
        child: Container(
          color: themeBackgrounds[Mng.curThemeColorIndex],
          child: Stack(
            children: [
              Column(
                children: [
                  Header(),
                  pageMng.getCurPage(false),
                  StepView(dataMng.getTypeIndex(), pageMng.index + 1),
                  Footer(),
                ],
              ),
              OilDialog(),
              uOilDialog(),
            ],
          ),
        ),
      ),
    );
  }

}