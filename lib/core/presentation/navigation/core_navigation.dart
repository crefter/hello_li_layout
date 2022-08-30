import 'package:flutter/material.dart';
import 'package:hello_li_layout/features/main/presentation/screens/main_screen/bottom_nav_bar_inherited_widget.dart';
import 'package:hello_li_layout/features/main/presentation/screens/main_screen/main_screen.dart';
import 'package:hello_li_layout/features/start/presentation/screens/start_screen/start_screen.dart';
import 'package:hello_li_layout/features/test/presentation/screens/test_screen.dart';
import 'package:hello_li_layout/features/test/presentation/widgets/test_inherited_widget.dart';

abstract class Screens {
  static const String start = '/';
  static const String main = 'main';
  static const String test = 'main/test';
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
          builder: (context) => SafeArea(
            child: BottomNavBarInheritedWidget(
                index: ValueNotifier<int>(0), child: const MainScreen()),
          ),
        );
      case Screens.test:
        final moduleId = settings.arguments as int;
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => SafeArea(
            child: TestInheritedWidget(
              id: moduleId,
              child: const TestScreen(),
            ),
          ),
        );
    }
    return null;
  }
}
