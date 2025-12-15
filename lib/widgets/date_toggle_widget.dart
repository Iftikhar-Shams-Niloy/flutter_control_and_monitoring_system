import 'package:flutter/material.dart';

/// Date Toggle Widget for switching between Today Data and Custom Date Data
class DateToggleWidget extends StatelessWidget {
  final bool isTodayData;
  final Function(bool) onToggle;

  const DateToggleWidget({
    super.key,
    required this.isTodayData,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => onToggle(true),
          child: Row(
            children: [
              Icon(
                Icons.circle,
                size: 16,
                color: isTodayData ? const Color(0xFF0098FF) : Colors.grey[400],
              ),
              const SizedBox(width: 8),
              Text(
                'Today Data',
                style: TextStyle(
                  color: isTodayData
                      ? const Color(0xFF0098FF)
                      : Colors.grey[600],
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 24),
        GestureDetector(
          onTap: () => onToggle(false),
          child: Row(
            children: [
              Icon(
                Icons.circle,
                size: 16,
                color: !isTodayData
                    ? const Color(0xFF0098FF)
                    : Colors.grey[400],
              ),
              const SizedBox(width: 8),
              Text(
                'Custom Date Data',
                style: TextStyle(
                  color: !isTodayData
                      ? const Color(0xFF0098FF)
                      : Colors.grey[600],
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
