import 'package:flutter/material.dart';
import 'package:isma/custom/dataContainer.dart';
import 'package:provider/provider.dart';

class mainBeautyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListView(
        primary: false,
        shrinkWrap: true,
        children: [
          DataContainer("테스트,3,2023-06-13,1000"),
          DataContainer("테스트,4,2023-06-13,2000"),
          DataContainer("테스트,5,2023-06-13,3000"),
          DataContainer("테스트,6,2023-06-13,3000"),
        ],
      ),
    );
  }
}