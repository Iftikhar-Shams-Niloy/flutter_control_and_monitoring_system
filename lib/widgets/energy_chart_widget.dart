import 'package:flutter/material.dart';
import 'package:flutter_control_and_monitoring_system/models/energy_data_item.dart';
import 'package:flutter_control_and_monitoring_system/widgets/data_item_card.dart';

/// Energy Chart Widget displaying title, total value, and list of data items
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
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              Text(
                totalValue,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ...dataItems
              .map(
                (item) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: DataItemCard(item: item),
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
