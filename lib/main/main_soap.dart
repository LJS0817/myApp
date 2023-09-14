import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:isma/custom/dataContainer.dart';
import 'package:isma/mng/FileMng.dart';
import 'package:provider/provider.dart';

class mainSoapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FileMng fileMng = Provider.of<FileMng>(context);
    return ScrollConfiguration(
      behavior: const ScrollBehavior().copyWith(overscroll: false),
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 10),
        itemCount: fileMng.data[0].length,
        itemBuilder: (BuildContext context, int index) {
          return DataContainer(fileMng.data[0][fileMng.data[0].keys.elementAt(index)]!, fileMng.data[0].keys.elementAt(index));
        },
      ),
    );
  }
}