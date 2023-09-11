import 'package:flutter/material.dart';
import 'package:isma/custom/dataContainer.dart';
import 'package:provider/provider.dart';

import '../mng/FileMng.dart';

class mainBeautyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FileMng fileMng = Provider.of<FileMng>(context);
    return ScrollConfiguration(
      behavior: const ScrollBehavior().copyWith(overscroll: false),
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 10),
        itemCount: fileMng.data[1].length,
        itemBuilder: (BuildContext context, int index) {
          return DataContainer(fileMng.data[1][fileMng.data[1].keys.elementAt(index)]!, fileMng.data[1].keys.elementAt(index));
        },
      ),
    );
  }
}