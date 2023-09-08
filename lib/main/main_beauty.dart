import 'package:flutter/material.dart';
import 'package:isma/custom/dataContainer.dart';
import 'package:provider/provider.dart';

import '../mng/FileMng.dart';

class mainBeautyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FileMng fileMng = Provider.of<FileMng>(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
        itemCount: fileMng.data[1].length,
        itemBuilder: (BuildContext context, int index) {
          return DataContainer(fileMng.data[1][fileMng.data[1].keys.elementAt(index)]!, fileMng.data[1].keys.elementAt(index));
        },
      ),
    );
  }
}