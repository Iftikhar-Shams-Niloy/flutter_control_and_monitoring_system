import 'package:flutter/material.dart';
import 'package:flutter_control_and_monitoring_system/models/data_source.dart';

/// Dummy data for the application
class DummyData {
  // Prevent instantiation
  DummyData._();

  /// List of data sources displayed on dashboard
  static final List<DataSource> dataSources = [
    DataSource(
      id: 'solar_1',
      title: 'Solar Panel',
      status: 'Active',
      iconPath: 'assets/icons/solar_panel.png',
      indicatorColor: const Color(0xFF5DADE2),
      isActive: true,
      summaryData: {
        'Energy': '55505.63 kWh',
        'Power': '58805.63 W',
      },
      energyDetails: const EnergyDetails(
        totalValue: 55.00,
        unit: 'kWh/Sqft',
        percentage: 0.7,
        revenueValue: 8897455,
        revenueUnit: 'tk',
        chartTitle: 'Energy Chart',
        chartTotalValue: '5.53 kw',
        dataItems: [
          EnergyDataItem(
            label: 'Panel A',
            color: Color(0xFF2196F3),
            data: '2798.50 (29.53%)',
            cost: '35689 ৳',
          ),
          EnergyDataItem(
            label: 'Panel B',
            color: Color(0xFF4DD0E1),
            data: '72598.50 (35.39%)',
            cost: '5259689 ৳',
          ),
          EnergyDataItem(
            label: 'Panel C',
            color: Color(0xFF9C27B0),
            data: '6598.36 (83.90%)',
            cost: '5698756 ৳',
          ),
          EnergyDataItem(
            label: 'Panel D',
            color: Color(0xFFFF9800),
            data: '6598.26 (36.59%)',
            cost: '356987 ৳',
          ),
        ],
        costItems: [
          CostDataItem(
            dataLabel: 'Solar Gen',
            dataValue: '2798.50 (29.53%)',
            costLabel: 'Solar Cost',
            costValue: '35689 ৳',
          ),
          CostDataItem(
            dataLabel: 'Grid Export',
            dataValue: '1500.00 (15.00%)',
            costLabel: 'Export Revenue',
            costValue: '15000 ৳',
          ),
        ],
      ),
    ),
    DataSource(
      id: 'solar_2',
      title: 'Solar Array 2',
      status: 'Active',
      iconPath: 'assets/icons/solar_panel.png',
      indicatorColor: const Color(0xFF5DADE2),
      isActive: true,
      summaryData: {
        'Energy': '42350.25 kWh',
        'Power': '45200.80 W',
      },
      energyDetails: const EnergyDetails(
        totalValue: 42.35,
        unit: 'kWh/Sqft',
        percentage: 0.65,
        revenueValue: 6500000,
        revenueUnit: 'tk',
        chartTitle: 'Energy Chart',
        chartTotalValue: '4.20 kw',
        dataItems: [
          EnergyDataItem(
            label: 'Array A',
            color: Color(0xFF2196F3),
            data: '1850.00 (25.00%)',
            cost: '28500 ৳',
          ),
          EnergyDataItem(
            label: 'Array B',
            color: Color(0xFF4DD0E1),
            data: '55000.50 (40.39%)',
            cost: '4200000 ৳',
          ),
          EnergyDataItem(
            label: 'Array C',
            color: Color(0xFF9C27B0),
            data: '5200.36 (75.90%)',
            cost: '4500000 ৳',
          ),
        ],
        costItems: [
          CostDataItem(
            dataLabel: 'Generation',
            dataValue: '2100.50 (30.53%)',
            costLabel: 'Gen Cost',
            costValue: '32000 ৳',
          ),
        ],
      ),
    ),
    DataSource(
      id: 'generator_1',
      title: 'Generator',
      status: 'Active',
      iconPath: 'assets/icons/generator_icon.png',
      indicatorColor: const Color(0xFFF39C12),
      isActive: true,
      summaryData: {
        'Fuel Used': '1250.00 L',
        'Output': '32500.75 kWh',
      },
      energyDetails: const EnergyDetails(
        totalValue: 32.50,
        unit: 'kWh/L',
        percentage: 0.55,
        revenueValue: 4250000,
        revenueUnit: 'tk',
        chartTitle: 'Generator Output',
        chartTotalValue: '3.25 kw',
        dataItems: [
          EnergyDataItem(
            label: 'Gen Unit 1',
            color: Color(0xFFF39C12),
            data: '15000.00 (46.15%)',
            cost: '1950000 ৳',
          ),
          EnergyDataItem(
            label: 'Gen Unit 2',
            color: Color(0xFFE74C3C),
            data: '17500.75 (53.85%)',
            cost: '2300000 ৳',
          ),
        ],
        costItems: [
          CostDataItem(
            dataLabel: 'Diesel Cost',
            dataValue: '1250.00 L',
            costLabel: 'Fuel Expense',
            costValue: '125000 ৳',
          ),
          CostDataItem(
            dataLabel: 'Maintenance',
            dataValue: 'Monthly',
            costLabel: 'Service Cost',
            costValue: '15000 ৳',
          ),
        ],
      ),
    ),
    DataSource(
      id: 'grid_1',
      title: 'Power Grid',
      status: 'Inactive',
      iconPath: 'assets/icons/power_line.png',
      indicatorColor: const Color(0xFF5DADE2),
      isActive: false,
      summaryData: {
        'Import': '0.00 kWh',
        'Export': '0.00 kWh',
      },
      energyDetails: const EnergyDetails(
        totalValue: 0.00,
        unit: 'kWh',
        percentage: 0.0,
        revenueValue: 0,
        revenueUnit: 'tk',
        chartTitle: 'Grid Usage',
        chartTotalValue: '0.00 kw',
        dataItems: [
          EnergyDataItem(
            label: 'Import',
            color: Color(0xFF2196F3),
            data: '0.00 (0.00%)',
            cost: '0 ৳',
          ),
          EnergyDataItem(
            label: 'Export',
            color: Color(0xFF4CAF50),
            data: '0.00 (0.00%)',
            cost: '0 ৳',
          ),
        ],
        costItems: [
          CostDataItem(
            dataLabel: 'Grid Import',
            dataValue: '0.00 kWh',
            costLabel: 'Import Cost',
            costValue: '0 ৳',
          ),
        ],
      ),
    ),
    DataSource(
      id: 'total_solar',
      title: 'Total Solar',
      status: 'Active',
      iconPath: 'assets/icons/solar_panel.png',
      indicatorColor: const Color(0xFF5DADE2),
      isActive: true,
      summaryData: {
        'Total Energy': '97855.88 kWh',
        'Total Power': '104006.43 W',
      },
      energyDetails: const EnergyDetails(
        totalValue: 97.86,
        unit: 'kWh/Sqft',
        percentage: 0.85,
        revenueValue: 15397455,
        revenueUnit: 'tk',
        chartTitle: 'Total Solar Output',
        chartTotalValue: '9.73 kw',
        dataItems: [
          EnergyDataItem(
            label: 'Solar Panel',
            color: Color(0xFF2196F3),
            data: '55505.63 (56.72%)',
            cost: '8897455 ৳',
          ),
          EnergyDataItem(
            label: 'Solar Array 2',
            color: Color(0xFF4DD0E1),
            data: '42350.25 (43.28%)',
            cost: '6500000 ৳',
          ),
        ],
        costItems: [
          CostDataItem(
            dataLabel: 'Total Generation',
            dataValue: '97855.88 kWh',
            costLabel: 'Total Revenue',
            costValue: '15397455 ৳',
          ),
        ],
      ),
    ),
  ];
}
