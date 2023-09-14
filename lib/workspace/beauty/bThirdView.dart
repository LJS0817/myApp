import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:isma/mng/PageMng.dart';
import 'package:provider/provider.dart';

import '../dataListView.dart';


class bThirdView extends StatelessWidget {
  const bThirdView({super.key});

  @override
  Widget build(BuildContext context) {
    PageMng pageMngProvider = Provider.of<PageMng>(context);
    return DataListView(pageMngProvider.index);
  }
}