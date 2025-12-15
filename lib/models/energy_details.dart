import 'package:flutter_control_and_monitoring_system/models/energy_data_item.dart';
import 'package:flutter_control_and_monitoring_system/models/cost_data_item.dart';

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
