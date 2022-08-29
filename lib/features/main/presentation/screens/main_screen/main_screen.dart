import 'package:flutter/material.dart';
import 'package:hello_li_layout/core/core_colors.dart';
import 'package:hello_li_layout/features/home/presentation/screens/home_screen/home_screen.dart';
import 'package:hello_li_layout/features/main/presentation/screens/main_screen/bottom_nav_bar_inherited_widget.dart';
import 'package:hello_li_layout/features/profile/presentation/screens/profile_screen.dart';
import 'package:hello_li_layout/features/search/presentation/screens/search_screen.dart';
import 'package:hello_li_layout/features/video/presentation/screens/video_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  late ValueNotifier<int> _index;
  late final AnimationController animationController;
  late final Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeIn);
  }

  @override
  void didChangeDependencies() {
    _index = BottomNavBarInheritedWidget.watch(context).index;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<int>(
        builder: (BuildContext context, int value, Widget? child) {
          animationController
            ..reset()
            ..forward(from: 0.3);
          return FadeTransition(
            opacity: animation,
            child: IndexedStack(
              index: value,
              children: const [
                HomeScreen(),
                SearchScreen(),
                VideoScreen(),
                ProfileScreen(),
              ],
            ),
          );
        },
        valueListenable: _index,
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: _index,
        builder: (_, int value, __) {
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _index.value,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedItemColor: CoreColors.marromEscuro,
            unselectedItemColor: CoreColors.marromEscuro,
            onTap: (index) => _index.value = index,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  activeIcon: Icon(Icons.home_sharp),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search_outlined),
                  activeIcon: Icon(Icons.search),
                  label: 'Search'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.videocam_outlined),
                  activeIcon: Icon(Icons.videocam),
                  label: 'Video'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline_outlined),
                  activeIcon: Icon(Icons.person),
                  label: 'Profile'),
            ],
          );
        },
      ),
    );
  }
}
