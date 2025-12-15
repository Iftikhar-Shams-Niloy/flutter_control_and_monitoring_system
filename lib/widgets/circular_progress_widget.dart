import 'package:flutter/material.dart';

/// Circular Progress Widget showing value, unit, and progress percentage
class CircularProgressWidget extends StatelessWidget {
  final double value;
  final String unit;
  final double percentage;

  const CircularProgressWidget({
    super.key,
    required this.value,
    required this.unit,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 240,
          height: 240,
          child: CircularProgressIndicator(
            value: percentage,
            strokeWidth: 32,
            backgroundColor: const Color(0xFFD6E9F5),
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF4A9FDB)),
            strokeCap: StrokeCap.round,
          ),
        ),
        Column(
          children: [
            Text(
              value is int
                  ? value.toStringAsFixed(0)
                  : value.toStringAsFixed(2),
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              unit,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
