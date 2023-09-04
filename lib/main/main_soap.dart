import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:isma/config/define.dart';
import 'package:isma/custom/dataContainer.dart';
import 'package:isma/mng/FileMng.dart';
import 'package:provider/provider.dart';

class mainSoapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FileMng fileMng = Provider.of<FileMng>(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
        itemCount: fileMng.data[0].length,
        itemBuilder: (BuildContext context, int index) {
          log(fileMng.data[0].keys.elementAt(index).toString());
          return DataContainer(fileMng.data[0][fileMng.data[0].keys.elementAt(index)]!, fileMng.data[0].keys.elementAt(index));
        },
      ),
    );
  }
}