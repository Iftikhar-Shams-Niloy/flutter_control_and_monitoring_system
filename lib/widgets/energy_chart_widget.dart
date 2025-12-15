import 'package:flutter/material.dart';
import 'package:flutter_control_and_monitoring_system/core/app_colors.dart';
import 'package:flutter_control_and_monitoring_system/models/energy_data_item.dart';
import 'package:flutter_control_and_monitoring_system/widgets/data_item_card.dart';

class EnergyChartWidget extends StatelessWidget {
  final String title;
  final String totalValue;
  final List<EnergyDataItem> dataItems;

  const EnergyChartWidget({
    super.key,
    required this.title,
    required this.totalValue,
    required this.dataItems,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderGrey),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimaryBlue,
                  ),
                ),

                SizedBox(width: 24),

                Text(
                  totalValue,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimaryBlue,
                  ),
                ),
              ],
            ),
          ),

          ...dataItems
              .map(
                (item) => Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: DataItemCard(item: item),
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
