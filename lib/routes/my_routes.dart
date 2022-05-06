import 'package:exchange/screens/home_page.dart';
import 'package:exchange/screens/splashscreen.dart';
import 'package:flutter/material.dart';

class MyRoutes {
  static Route? onGenerateRoute(RouteSettings s) {
    var args = s.arguments;
    switch (s.name) {
      case '/splash':
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
        case '/home':
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
    }
  }
}
