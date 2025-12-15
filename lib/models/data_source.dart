import 'package:flutter/material.dart';
import 'package:flutter_control_and_monitoring_system/models/energy_details.dart';

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
