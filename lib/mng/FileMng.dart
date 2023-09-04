import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class FileMng with ChangeNotifier {
  String dataPath = 'assets/data.csv';
  List files = [];

  List<Map<String, String>> data = [
    {}, {}, {}
  ];
  String config = "";

  void setData(int index, String key, String value) {
    data[index][key] = value;
    notifyListeners();
  }


  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<void> load() async {
    String path = await _localPath;
    Directory dir = Directory(path);

    files = dir.listSync();
    if(!files.toString().contains("userData")) {

      Directory('$path/userData').createSync();

      path = "$path/userData";
      Directory('$path/soap').createSync();
      Directory('$path/beauty').createSync();
      Directory('$path/oil').createSync();
      Directory('$path/config').createSync();

      files = dir.listSync();
    } else {
      path = "$path/userData";
    }
  }

  int getIndex(String str) {
    if(str == 'soap') {
      return 0;
    } else if(str == "beauty") {
      return 1;
    } else {
      return 2;
    }
  }

  Future<String> readDirectory(String str, int idx) async {
    try {
      String path = await _localPath;
      path = "$path/userData";
      Directory dir = Directory('$path/$str/');


      List fileList = dir.listSync();
      for(int i = 0; i < fileList.length; i++) {
        File file = fileList[i];


        final contents = await file.readAsString();
        setData(idx, basename(file.path), contents);
      }
      // Read the file
      //final contents = await file.readAsString();

      return 'Done';
    } catch (e) {
      // If encountering an error, return 0
      log(e.toString());
      return "Can't read";
    }
  }

  Future<String> readFile(String name, String type) async {
    try {
      String path = await _localPath;
      path = "$path/userData";
      File file = File('$path/$type/$name.txt');


      // Read the file
      final contents = await file.readAsString();

      return contents;
    } catch (e) {
      // If encountering an error, return 0
      return "Can't read";
    }
  }

  Future<File> writeFile(String name, String type, String str) async {
    String path = await _localPath;
    path = "$path/userData";
    final file = File('$path/$type/$name.txt');

    // Write the file
    return file.writeAsString(str);
  }
}