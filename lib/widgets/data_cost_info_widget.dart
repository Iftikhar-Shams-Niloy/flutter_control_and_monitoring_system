import 'package:flutter/material.dart';
import 'package:flutter_control_and_monitoring_system/core/app_colors.dart';
import 'package:flutter_control_and_monitoring_system/models/cost_data_item.dart';

class DataCostInfoWidget extends StatefulWidget {
  final List<CostDataItem> dataItems;

  const DataCostInfoWidget({super.key, required this.dataItems});

  @override
  State<DataCostInfoWidget> createState() => _DataCostInfoWidgetState();
}

class _DataCostInfoWidgetState extends State<DataCostInfoWidget> {
  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderGrey),
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.borderGrey),
              ),
              child: Row(
                children: [
                  Image.asset(
                    "assets/icons/statistics_icon.png",
                    height: 24,
                    width: 24,
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'Data & Cost Info',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),

                  const Spacer(),

                  Image.asset(
                    isExpanded
                        ? "assets/icons/dropdown_up.png"
                        : "assets/icons/dropdown_down.png",
                    height: 24,
                    width: 24,
                  ),
                ],
              ),
            ),
          ),
          if (isExpanded) ...[
            const SizedBox(height: 14),
            ...widget.dataItems
                .map(
                  (item) => Padding(
                    padding: const EdgeInsets.only(
                      bottom: 12,
                      left: 12,
                      right: 12,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              item.dataLabel,
                              style: TextStyle(
                                fontSize: 15,
                                color: AppColors.textHintGrey,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              ': ${item.dataValue}',
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textPrimaryBlue,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Text(
                              item.costLabel,
                              style: TextStyle(
                                fontSize: 15,
                                color: AppColors.textHintGrey,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              ': ${item.costValue}',
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textPrimaryBlue,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ],
        ],
      ),
    );
  }
}
