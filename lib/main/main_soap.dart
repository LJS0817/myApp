import 'package:flutter/material.dart';
import 'package:isma/custom/dataContainer.dart';

class mainSoapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListView(
        primary: false,
        shrinkWrap: true,
        children: [
          DataContainer("test?0?2023-9-1?[528, 300, 100, 128]?"
              "{0: 100, 1: 100, 3: 55, 4: 10, 5: 8, 6: 45, 7: 30, 2: 100}?"
              "[{0: 100`녹차씨, 2: 200`달맞이 꽃}@ {6: 100`라놀린}@ {-2: 128`test}@ {}]?"
              "test\ntest"),
         //DataContainer("테스트,1,2023-06-13,2000"),
          // DataContainer("테스트,2,2023-06-13,3000"),
        ],
      ),
    );
  }
}