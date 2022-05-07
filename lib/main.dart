import 'package:exchange/core/components/theme_comp.dart';
import 'package:exchange/model/currency_model.dart';
import 'package:exchange/routes/my_routes.dart';
import 'package:exchange/service/service.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main(List<String> args) async {
  await Hive.initFlutter();
  Hive.registerAdapter(
    CurrencyModelAdapter(),
  );
  await ApiService.openBox();
  
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeComp.myTheme,
      onGenerateRoute: MyRoutes.onGenerateRoute,
      initialRoute: '/splash',
    );
  }
}
