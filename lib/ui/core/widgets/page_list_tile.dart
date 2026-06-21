import 'package:flutter/material.dart';
import 'package:mobile/_import.dart';

class PageListTile extends StatelessWidget {
  final int number;
  final String title;
  final String? subtitle;

  final Function()? onPressed;

  const PageListTile({
    super.key,
    required this.number,
    required this.title,
    this.subtitle,
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFFE61E62);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        leading: Container(
          width: 46,
          height: 46,
          decoration: BoxDecoration(
            color: primaryColor,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: primaryColor.withAlpha(5),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          alignment: Alignment.center,
          child: Text(
            "$number",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),

        title: Text(
          title,
          style: const TextStyle(
            color: Color(0xFF1A1A1A),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),

        subtitle: subtitle == null ? null : Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Text(
            subtitle!,
            style: TextStyle(
              color: Colors.grey[500],
              fontWeight: FontWeight.w500,
              letterSpacing: 0.8,
              fontSize: 11,
            ),
          ),
        ),

        trailing: InkWell(
          onTap: onPressed,
          child: AppIcon.arrowRight,
        ),
      ),
    );
  }
}