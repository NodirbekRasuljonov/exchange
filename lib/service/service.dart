import 'package:dio/dio.dart';
import 'package:exchange/core/constants/api_cons.dart';
import 'package:exchange/model/currency_model.dart';
import 'package:flutter/material.dart';

class ApiService{
   static Future<List<CurrencyModel>> getData() async {
    try {
      Response res = await Dio().get(ApiConst.api);
      debugPrint('data has just come');
      debugPrint('after put');
      return (res.data as List).map((e) => CurrencyModel.fromJson(e),).toList();
    } catch (e) {
      debugPrint('Errro occured during the response comming');
      return [];
    }
  }


}