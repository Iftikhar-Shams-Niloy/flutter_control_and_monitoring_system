import 'package:flutter/material.dart';
import 'package:flutter_control_and_monitoring_system/core/app_colors.dart';
import 'package:flutter_control_and_monitoring_system/models/energy_data_item.dart';

class DataItemCard extends StatelessWidget {
  final EnergyDataItem item;

  const DataItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderGrey),
      ),
      child: Row(
        children: [
          Column(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: item.color,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                item.label,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(width: 8),

          Container(width: 1, height: 40, color: AppColors.borderGrey),

          const SizedBox(width: 8),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Data',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.textHintGrey,
                      ),
                    ),
                    const SizedBox(width: 18),
                    Text(
                      ': ${item.data}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimaryBlue,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      'Cost',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.textHintGrey,
                      ),
                    ),
                    const SizedBox(width: 18),
                    Text(
                      ': ${item.cost}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimaryBlue,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
