import 'package:flutter/material.dart';
import 'package:isma/config/colors.dart';
import 'package:isma/config/define.dart';
import 'package:isma/custom/WorkFooter.dart';
import 'package:isma/custom/WorkHeader.dart';
import 'package:isma/mng/Mng.dart';
import 'package:isma/mng/PageMng.dart';
import 'package:provider/provider.dart';
import 'package:isma/mng/DataMng.dart';

class SoapWorkspace extends StatelessWidget {
  SoapWorkspace({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: mainTextColor[menuMng.index],
        child: Stack(
          children: [
            Column(
              children: [
                Header(),
                context.watch<PageMng>().getCurPage(),
                Footer(),
              ],
            ),
            //oilPopup(),
          ],
        ),
      ),
    );
  }

}