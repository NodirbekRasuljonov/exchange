import 'dart:io';

import 'package:dio/dio.dart';
import 'package:exchange/core/constants/api_cons.dart';
import 'package:exchange/model/currency_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class ApiService {
  static Box<CurrencyModel>? mybox;
  static Future<List<CurrencyModel>> getData() async {
    try {
      Response res = await Dio().get(ApiConst.api);
      debugPrint('data has just come');
      await putData(
        (res.data as List)
            .map(
              (e) => CurrencyModel.fromJson(e),
            )
            .toList(),
      );
      debugPrint('after put');
      return (res.data as List)
          .map(
            (e) => CurrencyModel.fromJson(e),
          )
          .toList();
    } catch (e) {
      debugPrint('Errro occured during the response comming');
      return [];
    }
  }

  static Future openBox() async {
    mybox = await Hive.openBox('mybox');
    Directory directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
  }

  static Future putData(List<CurrencyModel> data) async {
    await mybox!.clear();
    for (var item in data) {
      await mybox!.add(item);
    }
  }
}
