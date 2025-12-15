import 'package:flutter/material.dart';
import 'package:flutter_control_and_monitoring_system/core/app_colors.dart';

class CircularChart extends StatelessWidget {
  final double value;
  final double size;
  final String title;
  final String valueText;

  const CircularChart({
    super.key,
    this.value = 1,
    this.size = 150,
    this.title = 'Total Power',
    this.valueText = '5.53 kw',
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: size,
          height: size,
          child: CircularProgressIndicator(
            value: value,
            strokeWidth: 24,
            backgroundColor: Colors.grey[300],
            valueColor: const AlwaysStoppedAnimation<Color>(
              AppColors.circleBlue,
            ),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: AppColors.textPrimaryBlue,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              valueText,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimaryBlue,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
