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
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFFE61E62);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        leading: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: primaryColor.withAlpha(30),
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Text(
            "$number",
            style: const TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),

        title: Text(
          title,
          style: const TextStyle(
            color: Color(0xFF1A1A1A),
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),

        subtitle: subtitle == null
            ? null
            : Padding(
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

        trailing: InkWell(onTap: onPressed, child: AppIcon.arrowRight),
      ),
    );
  }
}
