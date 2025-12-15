import 'package:flutter/material.dart';

/// Represents a data source (e.g., Solar Panel, Generator, Power Line)
/// displayed on the dashboard and detailed in data_details_screen
class DataSource {
  final String id;
  final String title;
  final String status; // 'Active' or 'Inactive'
  final String iconPath;
  final Color indicatorColor;
  final bool isActive;
  final Map<String, String> summaryData; // Key-value pairs shown on DataCard
  final EnergyDetails energyDetails; // Detailed data for data_details_screen

  const DataSource({
    required this.id,
    required this.title,
    required this.status,
    required this.iconPath,
    required this.indicatorColor,
    required this.isActive,
    required this.summaryData,
    required this.energyDetails,
  });
}

/// Energy details shown on the data_details_screen
class EnergyDetails {
  final double totalValue; // e.g., 55.00
  final String unit; // e.g., 'kWh/Sqft'
  final double percentage; // Progress percentage (0.0 - 1.0)
  final double revenueValue; // Revenue in currency
  final String revenueUnit; // e.g., 'tk'
  final String chartTitle; // e.g., 'Energy Chart'
  final String chartTotalValue; // e.g., '5.53 kw'
  final List<EnergyDataItem> dataItems; // Breakdown items
  final List<CostDataItem> costItems; // Cost breakdown for revenue view

  const EnergyDetails({
    required this.totalValue,
    required this.unit,
    required this.percentage,
    required this.revenueValue,
    required this.revenueUnit,
    required this.chartTitle,
    required this.chartTotalValue,
    required this.dataItems,
    required this.costItems,
  });
}

/// Individual data item in energy chart
class EnergyDataItem {
  final String label;
  final Color color;
  final String data;
  final String cost;

  const EnergyDataItem({
    required this.label,
    required this.color,
    required this.data,
    required this.cost,
  });
}

/// Cost data item for revenue view
class CostDataItem {
  final String dataLabel;
  final String dataValue;
  final String costLabel;
  final String costValue;

  const CostDataItem({
    required this.dataLabel,
    required this.dataValue,
    required this.costLabel,
    required this.costValue,
  });
}
