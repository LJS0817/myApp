import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class FileMng with ChangeNotifier {
  String dataPath = 'assets/data.csv';
  // List files = [];

  List<Map<String, String>> data = [
    {}, {}, {}
  ];
  String config = "";

  void setData(int index, String key, String value) {
    data[index][key] = value;
    notifyListeners();
  }


  Future<String> get _localPath async {
    final directory = await getExternalStorageDirectory();
    return directory!.path;
  }

  Future<void> load() async {
    String path = await _localPath;
    // Directory dir = Directory(path);

    // files = dir.listSync();
    Directory('$path/UserData_Recipe').createSync();
    Directory('$path/UserData_Oil').createSync();
    Directory('$path/UserData_Beauty').createSync();
    Directory('$path/UserData_Config').createSync();
    // files = dir.listSync();
    //
    // if(!files.toString().contains("userData")) {
    //
    //   Directory('$path/userData').createSync();
    //
    //   path = "$path/userData";
    //   Directory('$path/soap').createSync();
    //   Directory('$path/beauty').createSync();
    //   Directory('$path/oil').createSync();
    //   Directory('$path/config').createSync();
    //
    //   files = dir.listSync();
    // } else {
    //   path = "$path";
    // }
  }

  int getIndex(String str) {
    if(str == 'UserData_Recipe') {
      return 0;
    } else if(str == "UserData_Beauty") {
      return 1;
    } else {
      return 2;
    }
  }

  String getPath(int index) {
    if(index == 0) {
      return "UserData_Recipe";
    } else if(index == 1) {
      return "UserData_Beauty";
    } else if(index == 2) {
      return "UserData_Oil";
    } else {
      return "UserData_Config";
    }
  }

  Future<String> readDirectory(String str, int idx) async {
    try {
      String path = await _localPath;
      Directory dir = Directory('$path/${getPath(idx)}/');


      List fileList = dir.listSync();
      log(dir.path.toString());

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
      File file = File('$path/$type/$name.txt');


      // Read the file
      final contents = await file.readAsString();

      return contents;
    } catch (e) {
      // If encountering an error, return 0
      return "Can't read";
    }
  }

  Future<int> deleteFile(String name, int index) async {
    try {
      String path = await _localPath;
      path = "$path/${getPath(index)}/$name${name.contains(".txt") ? "" : ".txt"}";
      await File(path).delete();
      data[index].remove(name);
      notifyListeners();
      return 1;
    } catch(e) {
      log(e.toString());
      return 0;
    }
  }

  Future<File> writeFile(String name, String type, String str) async {
    String path = await _localPath;
    final file = File('$path/$type/$name.txt');

    // Write the file
    return file.writeAsString(str);
  }
}