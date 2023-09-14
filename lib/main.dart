import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:isma/custom/OilMng.dart';
import 'package:isma/mng/DataMng.dart';
import 'package:isma/mng/FileMng.dart';
import 'package:isma/mng/MenuMng.dart';
import 'package:isma/mng/Mng.dart';
import 'package:isma/mng/PageMng.dart';
import 'package:isma/tabs/beauty.dart';
import 'package:provider/provider.dart';

import 'package:isma/main/main_IndexScreen.dart';
import 'package:isma/tabs/soap.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MenuMng()),
        ChangeNotifierProvider(create: (_) => PageMng()),
        ChangeNotifierProvider(create: (_) => Mng()),
        ChangeNotifierProvider(create: (_) => DataMng()),
        ChangeNotifierProvider(create: (_) => OilMng()),
        ChangeNotifierProvider(create: (_) => FileMng()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(fontFamily: 'text'),
        routes: {
          '/index': (context) => IndexScreen(),
          '/tabs/soap': (context) => SoapWorkspace(),
          '/tabs/beauty': (context) => BeautyWorkspace(),
        },
        initialRoute: '/index',
      ),
    );
  }
}