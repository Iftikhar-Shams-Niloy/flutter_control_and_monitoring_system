import 'package:flutter/material.dart';

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
