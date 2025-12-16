import 'package:flutter/material.dart';
import 'package:flutter_control_and_monitoring_system/core/app_colors.dart';
import 'package:flutter_control_and_monitoring_system/models/data_source.dart';
import 'package:flutter_control_and_monitoring_system/models/energy_data_item.dart';
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
  String searchQuery = '';
  bool isSearchVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundGrey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
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
          IconButton(
            icon: Image.asset(
              "assets/icons/notification_on_icon.png",
              height: 20,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height - 32,
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: 30,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: AppColors.borderGrey),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                        ),
                        padding: const EdgeInsets.fromLTRB(16, 46, 16, 16),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(
                        top: 0.0,
                        bottom: 24,
                        left: 24,
                        right: 25,
                      ),
                      child: Column(
                        children: [
                          // ViewToggleWidget
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 24,
                            ),
                            child: ViewToggleWidget(
                              isDataView: isDataView,
                              onToggle: (value) {
                                setState(() {
                                  isDataView = value;
                                });
                              },
                            ),
                          ),
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 400),
                            transitionBuilder: (child, animation) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                            child: CircularProgressWidget(
                              key: ValueKey(isDataView),
                              value: isDataView
                                  ? widget.dataSource.energyDetails.totalValue
                                  : widget
                                        .dataSource
                                        .energyDetails
                                        .revenueValue,
                              unit: isDataView
                                  ? widget.dataSource.energyDetails.unit
                                  : widget.dataSource.energyDetails.revenueUnit,
                              percentage:
                                  widget.dataSource.energyDetails.percentage,
                            ),
                          ),

                          const SizedBox(height: 24),

                          if (isDataView) ...[
                            DateToggleWidget(
                              isTodayData: isTodayData,
                              onToggle: (value) {
                                setState(() {
                                  isTodayData = value;
                                });
                              },
                            ),

                            // Date Pickers
                            if (!isTodayData) ...[
                              const SizedBox(height: 16),
                              DateRangePickerWidget(
                                fromDate: fromDate,
                                toDate: toDate,
                                searchQuery: searchQuery,
                                isSearchVisible: isSearchVisible,
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
                                onSearchQueryChanged: (query) {
                                  setState(() {
                                    searchQuery = query;
                                  });
                                },
                                onSearchToggle: () {
                                  setState(() {
                                    isSearchVisible = !isSearchVisible;
                                    if (!isSearchVisible) {
                                      searchQuery =
                                          ''; // Clear search when hiding
                                    }
                                  });
                                },
                                onSearch: () {
                                  // Search button pressed (already live filtering via onSearchQueryChanged)
                                  setState(() {});
                                },
                              ),
                            ],

                            const SizedBox(height: 12),
                          ],

                          // Energy Chart Section
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 400),
                            transitionBuilder: (child, animation) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                            child: isDataView && isTodayData
                                ? EnergyChartWidget(
                                    key: const ValueKey('today_data'),
                                    title: widget
                                        .dataSource
                                        .energyDetails
                                        .chartTitle,
                                    totalValue: widget
                                        .dataSource
                                        .energyDetails
                                        .chartTotalValue,
                                    dataItems: widget
                                        .dataSource
                                        .energyDetails
                                        .dataItems,
                                  )
                                : isDataView && !isTodayData
                                ? Column(
                                    key: const ValueKey('custom_data'),
                                    children: [
                                      EnergyChartWidget(
                                        title: widget
                                            .dataSource
                                            .energyDetails
                                            .chartTitle,
                                        totalValue: widget
                                            .dataSource
                                            .energyDetails
                                            .chartTotalValue,
                                        dataItems: _getFilteredDataItems(),
                                      ),
                                      const SizedBox(height: 12),
                                      EnergyChartWidget(
                                        title:
                                            '${widget.dataSource.energyDetails.chartTitle} (History)',
                                        totalValue: widget
                                            .dataSource
                                            .energyDetails
                                            .chartTotalValue,
                                        dataItems: _getFilteredDataItems(),
                                      ),
                                    ],
                                  )
                                : DataCostInfoWidget(
                                    key: const ValueKey('revenue_view'),
                                    dataItems: widget
                                        .dataSource
                                        .energyDetails
                                        .costItems,
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  List<EnergyDataItem> _getFilteredDataItems() {
    if (searchQuery.isEmpty) {
      return widget.dataSource.energyDetails.dataItems;
    }
    return widget.dataSource.energyDetails.dataItems
        .where(
          (item) =>
              item.label.toLowerCase().contains(searchQuery.toLowerCase()),
        )
        .toList();
  }
}
