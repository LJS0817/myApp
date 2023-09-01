import 'package:flutter/material.dart';
import 'package:isma/config/colors.dart';
import 'package:isma/custom/OilDialog.dart';
import 'package:isma/custom/WorkFooter.dart';
import 'package:isma/custom/WorkHeader.dart';
import 'package:isma/mng/MenuMng.dart';
import 'package:isma/mng/PageMng.dart';
import 'package:isma/soap/first.dart';
import 'package:isma/soap/fourth.dart';
import 'package:isma/soap/second.dart';
import 'package:isma/soap/third.dart';
import 'package:provider/provider.dart';

import '../custom/step.dart';
import '../mng/DataMng.dart';

class SoapWorkspace extends StatelessWidget {
  const SoapWorkspace({super.key});

  @override
  Widget build(BuildContext context) {
    MenuMng menuMng = Provider.of<MenuMng>(context);
    PageMng pageMng = Provider.of<PageMng>(context);
    return Scaffold(
      body: Container(
        color: mainTextColor[menuMng.index],
        child: Stack(
          children: [
            Column(
              children: [
                Header(),
                context.watch<PageMng>().getCurPage(),
                StepView(context.watch<DataMng>().getTypeIndex(), context.watch<PageMng>().index + 1),
                Footer(),
              ],
            ),
            OilDialog(),
          ],
        ),
      ),
    );
  }

}