import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:mobile/_import.dart';

class NavItem {
  final Widget screen;
  final PreferredSizeWidget appBar;
  final NavigationDestination navigation;

  NavItem({
    required this.screen,
    required this.appBar,
    required this.navigation,
  });
}

class PageViewModel {
  List<NavItem> get navItems => [
    NavItem(
      screen: const HomeScreen(),
      appBar: const PageAppBar(
        title: "Hinário",
        subtitle: "Encontre o seu louvor favorito",
      ),
      navigation: const NavigationDestination(
        icon: AppIcon.home,
        label: "Início",
      ),
    ),

    NavItem(
      screen: const InvocationScreen(),
      appBar: const PageAppBar(
        title: "Invocações",
        subtitle: "Encontre o seu invocação",
      ),
      navigation: const NavigationDestination(
        icon: AppIcon.invocation,
        label: "Invocatório",
      ),
    ),

    NavItem(
      screen: const HymnScreen(),
      appBar: const PageAppBar(
        title: "Hinos",
        subtitle: "Encontre o seu louvor",
      ),
      navigation: const NavigationDestination(
        icon: HugeIcon(
          icon: HugeIcons.strokeRoundedMusic3,
          color: Colors.white,
          size: 16.0,
          strokeWidth: 1,
        ),
        label: "Hino",
      ),
    ),

    NavItem(
      screen: const LitanyScreen(),
      appBar: const PageAppBar(
        title: "Litania",
        subtitle: "Encontre o seu litania",
      ),
      navigation: const NavigationDestination(
        icon: AppIcon.litany,
        label: "Litania",
      ),
    ),

    NavItem(
      screen: const PsalmsScreen(),
      appBar: const PageAppBar(
        title: "Salmos",
        subtitle: "Encontre o seu salmo",
      ),
      navigation: const NavigationDestination(
        icon: AppIcon.psalms,
        label: "Salmos",
      ),
    ),
  ];
}
