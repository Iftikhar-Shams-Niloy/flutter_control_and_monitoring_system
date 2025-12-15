import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_control_and_monitoring_system/core/app_colors.dart';

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
          width: 180,
          height: 180,
          child: CustomPaint(
            painter: _ArcProgressPainter(
              percentage: percentage,
              backgroundColor: AppColors.semiCircleIncompleteColor,
              progressColor: AppColors.semiCircleProgressColor,
              strokeWidth: 24,
            ),
          ),
        ),
        Column(
          children: [
            Text(
              value is int
                  ? value.toStringAsFixed(0)
                  : value.toStringAsFixed(2),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimaryBlue,
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

class _ArcProgressPainter extends CustomPainter {
  final double percentage;
  final Color backgroundColor;
  final Color progressColor;
  final double strokeWidth;

  _ArcProgressPainter({
    required this.percentage,
    required this.backgroundColor,
    required this.progressColor,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;
    final rect = Rect.fromCircle(center: center, radius: radius);

    // Background arc (270 degrees = 3/4 circle)
    final backgroundPaint = Paint()
      ..color = backgroundColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      rect,
      math.pi * 0.75, // Start at 135 degrees (bottom-left)
      math.pi * 1.5, // Sweep 270 degrees (3/4 circle)
      false,
      backgroundPaint,
    );

    // Progress arc
    if (percentage > 0) {
      final progressPaint = Paint()
        ..color = progressColor
        ..strokeWidth = strokeWidth
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round;

      canvas.drawArc(
        rect,
        math.pi * 0.75, // Start at 135 degrees (bottom-left)
        math.pi * 1.5 * percentage, // Sweep based on percentage
        false,
        progressPaint,
      );
    }
  }

  @override
  bool shouldRepaint(_ArcProgressPainter oldDelegate) {
    return oldDelegate.percentage != percentage ||
        oldDelegate.backgroundColor != backgroundColor ||
        oldDelegate.progressColor != progressColor ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
