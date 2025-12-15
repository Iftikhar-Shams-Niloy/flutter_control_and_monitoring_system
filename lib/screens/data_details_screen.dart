import 'package:flutter/material.dart';

// Main Screen
class DataViewScreen extends StatefulWidget {
  const DataViewScreen({Key? key}) : super(key: key);

  @override
  State<DataViewScreen> createState() => _DataViewScreenState();
}

class _DataViewScreenState extends State<DataViewScreen> {
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
          onPressed: () {},
        ),
        title: const Text(
          'SCM',
          style: TextStyle(
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
                icon: const Icon(Icons.notifications_outlined, color: Colors.black),
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
                value: isDataView ? 55.00 : 8897455,
                unit: isDataView ? 'kWh/Sqft' : 'tk',
                percentage: 0.7,
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
                  title: 'Energy Chart',
                  totalValue: '5.53 kw',
                  dataItems: const [
                    DataItem(
                      label: 'Data A',
                      color: Color(0xFF2196F3),
                      data: '2798.50 (29.53%)',
                      cost: '35689 ৳',
                    ),
                    DataItem(
                      label: 'Data B',
                      color: Color(0xFF4DD0E1),
                      data: '72598.50 (35.39%)',
                      cost: '5259689 ৳',
                    ),
                    DataItem(
                      label: 'Data C',
                      color: Color(0xFF9C27B0),
                      data: '6598.36 (83.90%)',
                      cost: '5698756 ৳',
                    ),
                    DataItem(
                      label: 'Data D',
                      color: Color(0xFFFF9800),
                      data: '6598.26 (36.59%)',
                      cost: '356987 ৳',
                    ),
                  ],
                )
              else if (isDataView && !isTodayData)
                Column(
                  children: [
                    EnergyChartWidget(
                      title: 'Energy Chart',
                      totalValue: '20.05 kw',
                      dataItems: const [
                        DataItem(
                          label: 'Data A',
                          color: Color(0xFF2196F3),
                          data: '2798.50 (29.53%)',
                          cost: '35689 ৳',
                        ),
                        DataItem(
                          label: 'Data B',
                          color: Color(0xFF4DD0E1),
                          data: '72598.50 (35.39%)',
                          cost: '5259689 ৳',
                        ),
                        DataItem(
                          label: 'Data C',
                          color: Color(0xFF9C27B0),
                          data: '6598.36 (83.90%)',
                          cost: '5698756 ৳',
                        ),
                        DataItem(
                          label: 'Data D',
                          color: Color(0xFFFF9800),
                          data: '6598.26 (36.59%)',
                          cost: '356987 ৳',
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    EnergyChartWidget(
                      title: 'Energy Chart',
                      totalValue: '5.53 kw',
                      dataItems: const [
                        DataItem(
                          label: 'Data A',
                          color: Color(0xFF2196F3),
                          data: '2798.50 (29.53%)',
                          cost: '35689 ৳',
                        ),
                        DataItem(
                          label: 'Data B',
                          color: Color(0xFF4DD0E1),
                          data: '72598.50 (35.39%)',
                          cost: '5259689 ৳',
                        ),
                        DataItem(
                          label: 'Data C',
                          color: Color(0xFF9C27B0),
                          data: '6598.36 (83.90%)',
                          cost: '5698756 ৳',
                        ),
                        DataItem(
                          label: 'Data D',
                          color: Color(0xFFFF9800),
                          data: '6598.26 (36.59%)',
                          cost: '356987 ৳',
                        ),
                      ],
                    ),
                  ],
                )
              else
                DataCostInfoWidget(
                  dataItems: const [
                    CostDataItem(
                      dataLabel: 'Data 1',
                      dataValue: '2798.50 (29.53%)',
                      costLabel: 'Cost 1',
                      costValue: '35689 ৳',
                    ),
                    CostDataItem(
                      dataLabel: 'Data 2',
                      dataValue: '2798.50 (29.53%)',
                      costLabel: 'Cost 2',
                      costValue: '35689 ৳',
                    ),
                    CostDataItem(
                      dataLabel: 'Data 3',
                      dataValue: '2798.50 (29.53%)',
                      costLabel: 'Cost 3',
                      costValue: '35689 ৳',
                    ),
                    CostDataItem(
                      dataLabel: 'Data 4',
                      dataValue: '2798.50 (29.53%)',
                      costLabel: 'Cost 4',
                      costValue: '35689 ৳',
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

// View Toggle Widget (Data View / Revenue View)
class ViewToggleWidget extends StatelessWidget {
  final bool isDataView;
  final Function(bool) onToggle;

  const ViewToggleWidget({
    Key? key,
    required this.isDataView,
    required this.onToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => onToggle(true),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: isDataView ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.circle,
                      size: 20,
                      color: isDataView ? const Color(0xFF0098FF) : Colors.grey[400],
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Data View',
                      style: TextStyle(
                        color: isDataView ? const Color(0xFF0098FF) : Colors.grey[600],
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => onToggle(false),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: !isDataView ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.circle,
                      size: 20,
                      color: !isDataView ? const Color(0xFF0098FF) : Colors.grey[400],
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Revenue View',
                      style: TextStyle(
                        color: !isDataView ? const Color(0xFF0098FF) : Colors.grey[600],
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Circular Progress Widget
class CircularProgressWidget extends StatelessWidget {
  final double value;
  final String unit;
  final double percentage;

  const CircularProgressWidget({
    Key? key,
    required this.value,
    required this.unit,
    required this.percentage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 240,
          height: 240,
          child: CircularProgressIndicator(
            value: percentage,
            strokeWidth: 32,
            backgroundColor: const Color(0xFFD6E9F5),
            valueColor: const AlwaysStoppedAnimation<Color>(
              Color(0xFF4A9FDB),
            ),
            strokeCap: StrokeCap.round,
          ),
        ),
        Column(
          children: [
            Text(
              value is int ? value.toStringAsFixed(0) : value.toStringAsFixed(2),
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              unit,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// Date Toggle Widget (Today Data / Custom Date Data)
class DateToggleWidget extends StatelessWidget {
  final bool isTodayData;
  final Function(bool) onToggle;

  const DateToggleWidget({
    Key? key,
    required this.isTodayData,
    required this.onToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => onToggle(true),
          child: Row(
            children: [
              Icon(
                Icons.circle,
                size: 16,
                color: isTodayData ? const Color(0xFF0098FF) : Colors.grey[400],
              ),
              const SizedBox(width: 8),
              Text(
                'Today Data',
                style: TextStyle(
                  color: isTodayData ? const Color(0xFF0098FF) : Colors.grey[600],
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 24),
        GestureDetector(
          onTap: () => onToggle(false),
          child: Row(
            children: [
              Icon(
                Icons.circle,
                size: 16,
                color: !isTodayData ? const Color(0xFF0098FF) : Colors.grey[400],
              ),
              const SizedBox(width: 8),
              Text(
                'Custom Date Data',
                style: TextStyle(
                  color: !isTodayData ? const Color(0xFF0098FF) : Colors.grey[600],
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// Date Range Picker Widget
class DateRangePickerWidget extends StatelessWidget {
  final DateTime? fromDate;
  final DateTime? toDate;
  final Function(DateTime) onFromDateChanged;
  final Function(DateTime) onToDateChanged;
  final VoidCallback onSearch;

  const DateRangePickerWidget({
    Key? key,
    this.fromDate,
    this.toDate,
    required this.onFromDateChanged,
    required this.onToDateChanged,
    required this.onSearch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: Row(
              children: [
                Text(
                  'From Date',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
                const Spacer(),
                Icon(Icons.calendar_today, size: 20, color: Colors.grey[600]),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: Row(
              children: [
                Text(
                  'To Date',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
                const Spacer(),
                Icon(Icons.calendar_today, size: 20, color: Colors.grey[600]),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFF0098FF),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(
            Icons.search,
            color: Colors.white,
            size: 24,
          ),
        ),
      ],
    );
  }
}

// Energy Chart Widget
class EnergyChartWidget extends StatelessWidget {
  final String title;
  final String totalValue;
  final List<DataItem> dataItems;

  const EnergyChartWidget({
    Key? key,
    required this.title,
    required this.totalValue,
    required this.dataItems,
  }) : super(key: key);

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
          ...dataItems.map((item) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: DataItemCard(item: item),
          )).toList(),
        ],
      ),
    );
  }
}

// Data Item Card
class DataItemCard extends StatelessWidget {
  final DataItem item;

  const DataItemCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Row(
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: item.color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            item.label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(width: 8),
          Container(
            width: 1,
            height: 40,
            color: Colors.grey[300],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Data',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      ': ${item.data}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      'Cost',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      ': ${item.cost}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Data & Cost Info Widget
class DataCostInfoWidget extends StatefulWidget {
  final List<CostDataItem> dataItems;

  const DataCostInfoWidget({
    Key? key,
    required this.dataItems,
  }) : super(key: key);

  @override
  State<DataCostInfoWidget> createState() => _DataCostInfoWidgetState();
}

class _DataCostInfoWidgetState extends State<DataCostInfoWidget> {
  bool isExpanded = true;

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
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Row(
              children: [
                const Icon(Icons.bar_chart, color: Colors.grey, size: 28),
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
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Color(0xFF0098FF),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
          if (isExpanded) ...[
            const SizedBox(height: 20),
            ...widget.dataItems.map((item) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        item.dataLabel,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        ': ${item.dataValue}',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
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
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        ': ${item.costValue}',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )).toList(),
          ],
        ],
      ),
    );
  }
}

// Data Models
class DataItem {
  final String label;
  final Color color;
  final String data;
  final String cost;

  const DataItem({
    required this.label,
    required this.color,
    required this.data,
    required this.cost,
  });
}

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