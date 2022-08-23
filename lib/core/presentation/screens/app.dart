import 'package:flutter/material.dart';
import 'package:hello_li_layout/core/presentation/navigation/core_navigation.dart';

class App extends StatelessWidget {
  final Navigation navigation = Navigation();

  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: navigation.routes,
      onGenerateRoute: (settings) => navigation.onGenerateRoute(settings),
    );
  }
}
