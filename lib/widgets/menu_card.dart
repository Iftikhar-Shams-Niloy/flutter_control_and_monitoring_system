import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  const MenuCard(this.title, this.iconPath, {super.key});

  final String title;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Image.asset(
              iconPath,
              width: 36,
              height: 36,
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.image, size: 36, color: Colors.grey[400]);
              },
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF5A6C7D),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
