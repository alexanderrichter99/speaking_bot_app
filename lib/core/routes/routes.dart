import 'package:flutter/material.dart';
import 'package:speaking_bot_app/pages/connection.dart';
import 'package:speaking_bot_app/pages/home.dart';
import 'package:speaking_bot_app/pages/tutorial.dart';

class Routes {
  static const tutorial = "/tutorial";
  static const connection = "/connection";
  static const home = "/home";
}

class RouterGenerator {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.tutorial:
        return MaterialPageRoute(
          builder: ((context) => const TutorialPage()),
        );
      case Routes.connection:
        return MaterialPageRoute(
          builder: ((context) => const ConnectionPage()),
        );
      case Routes.home:
        return MaterialPageRoute(
          builder: ((context) => const HomePage()),
      );
      default:
        return MaterialPageRoute(
          builder: ((context) => const HomePage()),
        );
    }
  }
}
