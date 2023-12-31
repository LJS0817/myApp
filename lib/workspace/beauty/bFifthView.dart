import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:isma/custom/customTextField.dart';
import 'package:isma/mng/DataMng.dart';
import 'package:isma/mng/PageMng.dart';
import 'package:provider/provider.dart';

import '../dataListView.dart';


class bFifthView extends StatelessWidget {
  const bFifthView({super.key});

  @override
  Widget build(BuildContext context) {
    PageMng pageMngProvider = Provider.of<PageMng>(context);
    return DataListView(pageMngProvider.index);
  }
}