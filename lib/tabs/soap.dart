import 'package:flutter/material.dart';
import 'package:isma/config/colors.dart';
import 'package:isma/config/define.dart';
import 'package:isma/custom/OilDialog.dart';
import 'package:isma/custom/WorkFooter.dart';
import 'package:isma/custom/WorkHeader.dart';
import 'package:isma/mng/MenuMng.dart';
import 'package:isma/mng/PageMng.dart';
import 'package:provider/provider.dart';

class SoapWorkspace extends StatelessWidget {
  const SoapWorkspace({super.key});

  @override
  Widget build(BuildContext context) {
    MenuMng menuMng = Provider.of<MenuMng>(context);
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
            OilDialog(),
          ],
        ),
      ),
    );
  }

}