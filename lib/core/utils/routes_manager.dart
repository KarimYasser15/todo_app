import 'package:flutter/material.dart';
import 'package:todo/screens/home_screen.dart';

class RoutesManager {
  static const home = "/home";

  static Route? router(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
        );
    }
  }
}
