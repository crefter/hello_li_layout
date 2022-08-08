import 'package:flutter/cupertino.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
        title: 'Flutter Demo',
        theme: CupertinoThemeData(
        primaryColor: CupertinoColors.activeBlue,
    ),
    home: StartScreen(),
    );
  }
}
