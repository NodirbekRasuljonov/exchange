import 'package:exchange/core/components/theme_comp.dart';
import 'package:exchange/routes/my_routes.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp(),);
  
}


class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeComp.myTheme,
      onGenerateRoute: MyRoutes.onGenerateRoute,
      initialRoute: '/splash',
    );
  }
}