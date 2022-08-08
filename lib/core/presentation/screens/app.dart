import 'package:flutter/cupertino.dart';

import '../../../features/start/presentation/screens/start_screen/start_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Flutter Demo',
      theme: CupertinoThemeData(
        primaryColor: CupertinoColors.activeBlue,
        scaffoldBackgroundColor: null,
      ),
      home: StartScreen(),
    );
  }
}
