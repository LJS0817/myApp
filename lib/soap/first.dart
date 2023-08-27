import 'package:flutter/material.dart';
import 'package:isma/config/define.dart';
import 'package:isma/custom/customTextField.dart';
import 'package:isma/mng/Mng.dart';
import 'package:provider/provider.dart';

class FirstView extends StatelessWidget {
  const FirstView({super.key});

  @override
  Widget build(BuildContext context) {
    Mng mngProvider = Provider.of<Mng>(context);
    return Expanded(
      child: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: ListView(
          shrinkWrap: true,
          children: [
            Text(
              "레시피 이름",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: getThemeColor(mngProvider.getDataType(), 0),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 3)),
            CustomTextField(active: true, index: mngProvider.getDataType(),),
          ],
        )
      ),
    );
  }
}