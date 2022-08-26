import 'package:flutter/material.dart';

class BottomNavBarModel extends InheritedWidget {
  final ValueNotifier<int> index;

  BottomNavBarModel({
    Key? key,
    required Widget child,
    required this.index,
  }) : super(key: key, child: child);

  static BottomNavBarModel watch(BuildContext context) {
    final BottomNavBarModel? result =
    context.dependOnInheritedWidgetOfExactType<BottomNavBarModel>();
    assert(result != null, 'No BottomNavBarModel found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(BottomNavBarModel oldWidget) {
    return oldWidget.index.value != index.value;
  }
}