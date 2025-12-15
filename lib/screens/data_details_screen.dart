import 'package:flutter/material.dart';
import 'package:flutter_control_and_monitoring_system/models/data_source.dart';
import 'package:flutter_control_and_monitoring_system/widgets/view_toggle_widget.dart';
import 'package:flutter_control_and_monitoring_system/widgets/circular_progress_widget.dart';
import 'package:flutter_control_and_monitoring_system/widgets/date_toggle_widget.dart';
import 'package:flutter_control_and_monitoring_system/widgets/date_range_picker_widget.dart';
import 'package:flutter_control_and_monitoring_system/widgets/energy_chart_widget.dart';
import 'package:flutter_control_and_monitoring_system/widgets/data_cost_info_widget.dart';

// Main Screen
class DataDetailsScreen extends StatefulWidget {
  final DataSource dataSource;

  const DataDetailsScreen({super.key, required this.dataSource});

  @override
  State<DataDetailsScreen> createState() => _DataViewScreenState();
}

class _DataViewScreenState extends State<DataDetailsScreen> {
  bool isDataView = true;
  bool isTodayData = true;
  DateTime? fromDate;
  DateTime? toDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8EEF2),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          widget.dataSource.title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.notifications_outlined,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
              Positioned(
                right: 12,
                top: 12,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Top Toggle (Data View / Revenue View)
              ViewToggleWidget(
                isDataView: isDataView,
                onToggle: (value) {
                  setState(() {
                    isDataView = value;
                  });
                },
              ),

              const SizedBox(height: 24),

              // Circular Progress
              CircularProgressWidget(
                value: isDataView
                    ? widget.dataSource.energyDetails.totalValue
                    : widget.dataSource.energyDetails.revenueValue,
                unit: isDataView
                    ? widget.dataSource.energyDetails.unit
                    : widget.dataSource.energyDetails.revenueUnit,
                percentage: widget.dataSource.energyDetails.percentage,
              ),

              const SizedBox(height: 24),

              // Today Data / Custom Date Data Toggle (only for Data View)
              if (isDataView) ...[
                DateToggleWidget(
                  isTodayData: isTodayData,
                  onToggle: (value) {
                    setState(() {
                      isTodayData = value;
                    });
                  },
                ),

                // Date Pickers (only for Custom Date Data)
                if (!isTodayData) ...[
                  const SizedBox(height: 16),
                  DateRangePickerWidget(
                    fromDate: fromDate,
                    toDate: toDate,
                    onFromDateChanged: (date) {
                      setState(() {
                        fromDate = date;
                      });
                    },
                    onToDateChanged: (date) {
                      setState(() {
                        toDate = date;
                      });
                    },
                    onSearch: () {
                      // Handle search
                    },
                  ),
                ],

                const SizedBox(height: 24),
              ],

              // Energy Chart Section
              if (isDataView && isTodayData)
                EnergyChartWidget(
                  title: widget.dataSource.energyDetails.chartTitle,
                  totalValue: widget.dataSource.energyDetails.chartTotalValue,
                  dataItems: widget.dataSource.energyDetails.dataItems,
                )
              else if (isDataView && !isTodayData)
                Column(
                  children: [
                    EnergyChartWidget(
                      title: widget.dataSource.energyDetails.chartTitle,
                      totalValue:
                          widget.dataSource.energyDetails.chartTotalValue,
                      dataItems: widget.dataSource.energyDetails.dataItems,
                    ),
                    const SizedBox(height: 24),
                    EnergyChartWidget(
                      title:
                          '${widget.dataSource.energyDetails.chartTitle} (History)',
                      totalValue:
                          widget.dataSource.energyDetails.chartTotalValue,
                      dataItems: widget.dataSource.energyDetails.dataItems,
                    ),
                  ],
                )
              else
                DataCostInfoWidget(
                  dataItems: widget.dataSource.energyDetails.costItems,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
