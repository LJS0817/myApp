import 'package:flutter/material.dart';

class EditableOilContainer extends StatelessWidget {
  int index = 0;

  EditableOilContainer(int id, {super.key}) {
    index = id;
  }

  @override
  Widget build(BuildContext context) {
    DataMng dataMngProvider = Provider.of<DataMng>(context);
    return Container(

    );
  }

}