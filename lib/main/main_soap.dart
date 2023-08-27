import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
          DataContainer("테스트,0,2023-06-13,1000"),
          DataContainer("테스트,1,2023-06-13,2000"),
          DataContainer("테스트,2,2023-06-13,3000"),
        ],
      ),
    );
  }
}