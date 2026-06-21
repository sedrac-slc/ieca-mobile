import 'package:flutter/material.dart';
import 'package:mobile/_import.dart';

class PageViewApp extends StatefulWidget {
  const PageViewApp({super.key});

  @override
  State<PageViewApp> createState() => _PageViewAppState();
}

class _PageViewAppState extends State<PageViewApp> {
  final PageViewModel _pageViewModel = PageViewModel();
  late PageController _pageViewController;
  late int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController(initialPage: _currentPageIndex);
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final items = _pageViewModel.navItems;
    final appBar = items[_currentPageIndex].appBar;
    final screens = items.map((item) => item.screen).toList();
    final destinations = items.map((item) => item.navigation).toList();

    return Scaffold(
      appBar: appBar,
      body: PageView(
        controller: _pageViewController,
        children: screens,
        onPageChanged: (int page) {
          setState(() { _currentPageIndex = page; });
        },
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          iconTheme: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return IconThemeData(color: Colors.pinkAccent, size: 28);
            }
            return IconThemeData(color: Colors.pinkAccent.shade400, size: 24);
          }),
          labelTextStyle: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return TextStyle(color: Colors.pinkAccent, fontSize: 16);
            }
            return TextStyle(color: Colors.pinkAccent.shade400, fontSize: 14);
          }),
        ),
        child: NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          indicatorColor: Colors.pink.withAlpha(50),
          destinations: destinations,
          selectedIndex: _currentPageIndex,
          onDestinationSelected: (value) {
            setState(() {
              _currentPageIndex = value;
              _pageViewController.animateToPage(value, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
            });
          },
        ),
      ),
    );
  }
}
