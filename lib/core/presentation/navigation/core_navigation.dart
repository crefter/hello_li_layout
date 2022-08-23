import 'package:flutter/material.dart';
import 'package:hello_li_layout/features/main/presentation/screens/main_screen/main_screen.dart';
import 'package:hello_li_layout/features/start/presentation/screens/start_screen/start_screen.dart';

abstract class Screens {
  static const String start = '/';
  static const String main = 'main';
}

class Navigation {
  Map<String, WidgetBuilder> get routes => {
        Screens.start: (_) => const SafeArea(child: StartScreen()),
      };

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    String name = settings.name ?? '';
    switch (name) {
      case Screens.main:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const SafeArea(
            child: MainScreen(),
          ),
        );
    }
  }
}
