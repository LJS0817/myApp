import 'package:flutter/material.dart';
import 'package:isma/config/define.dart';
import 'package:isma/custom/dataContainer.dart';

class mainSoapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
        itemCount: fileMng.data[0].length,
        itemBuilder: (BuildContext context, int index) {
          return DataContainer(fileMng.data[0][index]);
        },
      ),
    );
  }
}