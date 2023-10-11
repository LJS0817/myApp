import 'package:flutter/material.dart';
import 'package:isma/config/colors.dart';
import 'package:isma/config/define.dart';
import 'package:isma/custom/WorkFooter.dart';
import 'package:isma/custom/oilHeader.dart';
import 'package:isma/custom/step.dart';
import 'package:isma/mng/DataMng.dart';
import 'package:isma/mng/MenuMng.dart';
import 'package:isma/mng/PageMng.dart';
import 'package:isma/workspace/oil/oFirst.dart';
import 'package:provider/provider.dart';

class OilWorkspace extends StatelessWidget {
  const OilWorkspace({super.key});

  @override
  Widget build(BuildContext context) {
    PageMng pageMng = Provider.of<PageMng>(context);
    DataMng dataMng = Provider.of<DataMng>(context);
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Container(
          color: getThemeColor(1, 1),
          child: Stack(
            children: [
              Column(
                children: [
                  OilHeader(),
                  oFirstView(),
                  StepView(dataMng.getTypeIndex(), pageMng.index + 1),
                  Footer(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}