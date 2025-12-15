import 'package:flutter/material.dart';
import 'package:flutter_control_and_monitoring_system/core/app_colors.dart';
import 'package:flutter_control_and_monitoring_system/models/data_source.dart';

class DataCard extends StatelessWidget {
  final DataSource dataSource;
  final VoidCallback? onTap;

  const DataCard({super.key, required this.dataSource, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: dataSource.isActive ? AppColors.cardActive : Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey[300]!, width: 1),
        ),
        child: Row(
          children: [
            // Icon
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Image.asset(
                  dataSource.iconPath,
                  width: 35,
                  height: 35,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.image, size: 35, color: Colors.grey[400]);
                  },
                ),
              ),
            ),
            const SizedBox(width: 12),

            // Title, Status and Data
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: dataSource.indicatorColor,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Flexible(
                        child: Text(
                          dataSource.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '(${dataSource.status})',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: dataSource.isActive
                              ? const Color(0xFF0098FF)
                              : Colors.red,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Dynamic data from summaryData map
                  ...dataSource.summaryData.entries.map(
                    (entry) => Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Text(
                        '${entry.key}    : ${entry.value}',
                        style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Arrow
            Icon(Icons.chevron_right, color: Colors.grey[600], size: 28),
          ],
        ),
      ),
    );
  }
}
