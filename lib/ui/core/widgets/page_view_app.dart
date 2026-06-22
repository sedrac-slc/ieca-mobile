import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:mobile/_import.dart';

class PageViewApp extends StatefulWidget {
  const PageViewApp({super.key});

  @override
  State<PageViewApp> createState() => _PageViewAppState();
}

class _PageViewAppState extends State<PageViewApp> {
  final PageViewModel _pageViewModel = PageViewModel();
  final PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return _pageViewModel.navItems.map((item) => Scaffold(
      appBar: item.appBar,
      body: item.screen,
    )).toList();
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return List.generate(_pageViewModel.navItems.length, (index) {
      final item = _pageViewModel.navItems[index];
      return PersistentBottomNavBarItem(
        icon: item.navigation.icon,
        title: item.navigation.label,
        activeColorPrimary: Colors.pinkAccent,
        inactiveColorPrimary: Colors.grey,
        activeColorSecondary: Colors.pinkAccent,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      navBarStyle: NavBarStyle.style15,
      backgroundColor: Colors.white,
      decoration: const NavBarDecoration(
        colorBehindNavBar: Colors.grey,
      ),
    );
  }
}