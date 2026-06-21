import 'package:flutter/material.dart';
import 'package:mobile/_import.dart';
class PageAppBar extends StatelessWidget implements PreferredSizeWidget {

  final String title;
  final String subtitle;
  final Widget? leading;

  const PageAppBar({
    super.key,
    required this.title,
    required this.subtitle,
    this.leading,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: leading ?? const PageSetting(),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            subtitle,
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
      actions: [
        const SectionSelector(),
      ],
    );
  }
}
