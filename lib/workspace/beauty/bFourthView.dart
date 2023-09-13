import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:isma/mng/PageMng.dart';
import 'package:isma/workspace/dataListView.dart';
import 'package:provider/provider.dart';


class bFourthView extends StatelessWidget {
  const bFourthView({super.key});

  @override
  Widget build(BuildContext context) {
    PageMng pageMngProvider = Provider.of<PageMng>(context);
    return DataListView(pageMngProvider.index);
  }
}