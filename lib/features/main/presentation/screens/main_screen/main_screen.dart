import 'package:flutter/material.dart';
import 'package:hello_li_layout/core/core_colors.dart';
import 'package:hello_li_layout/features/home/presentation/screens/home_screen/home_screen.dart';
import 'package:hello_li_layout/features/profile/presentation/screens/profile_screen.dart';
import 'package:hello_li_layout/features/search/presentation/screens/search_screen.dart';
import 'package:hello_li_layout/features/video/presentation/screens/video_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _index,
        children: const [
          HomeScreen(),
          SearchScreen(),
          VideoScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _index,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: CoreColors.marromEscuro,
        unselectedItemColor: CoreColors.marromEscuro,
        onTap: (index) => setState(() {
          _index = index;
        }),
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
      ),
    );
  }
}
