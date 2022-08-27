import 'package:flutter/material.dart';

class BottomNavBarInheritedWidget extends InheritedWidget {
  final ValueNotifier<int> index;

  const BottomNavBarInheritedWidget({
    Key? key,
    required Widget child,
    required this.index,
  }) : super(key: key, child: child);

  static BottomNavBarInheritedWidget watch(BuildContext context) {
    final BottomNavBarInheritedWidget? result =
    context.dependOnInheritedWidgetOfExactType<BottomNavBarInheritedWidget>();
    assert(result != null, 'No BottomNavBarModel found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(BottomNavBarInheritedWidget oldWidget) {
    return oldWidget.index.value != index.value;
  }
}