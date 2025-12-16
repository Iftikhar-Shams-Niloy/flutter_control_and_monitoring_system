import 'package:flutter/material.dart';
import 'package:flutter_control_and_monitoring_system/core/app_colors.dart';
import 'package:intl/intl.dart';

class DateRangePickerWidget extends StatelessWidget {
  final DateTime? fromDate;
  final DateTime? toDate;
  final String? searchQuery;
  final bool isSearchVisible;
  final Function(DateTime) onFromDateChanged;
  final Function(DateTime) onToDateChanged;
  final Function(String) onSearchQueryChanged;
  final VoidCallback onSearchToggle;
  final VoidCallback onSearch;

  const DateRangePickerWidget({
    super.key,
    this.fromDate,
    this.toDate,
    this.searchQuery,
    this.isSearchVisible = false,
    required this.onFromDateChanged,
    required this.onToDateChanged,
    required this.onSearchQueryChanged,
    required this.onSearchToggle,
    required this.onSearch,
  });

  Future<void> _selectFromDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: fromDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: toDate ?? DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.primaryBlue,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      onFromDateChanged(picked);
    }
  }

  Future<void> _selectToDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: toDate ?? DateTime.now(),
      firstDate: fromDate ?? DateTime(2020),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.primaryBlue,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      onToDateChanged(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd MMM yyyy');

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => _selectFromDate(context),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.borderGrey),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          fromDate != null
                              ? dateFormat.format(fromDate!)
                              : 'From Date',
                          style: TextStyle(
                            color: fromDate != null
                                ? AppColors.textPrimaryBlue
                                : AppColors.textHintGrey,
                            fontSize: 14,
                            fontWeight: fromDate != null
                                ? FontWeight.w500
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                      Image.asset(
                        "assets/icons/date_icon.png",
                        height: 20,
                        width: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: GestureDetector(
                onTap: () => _selectToDate(context),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.borderGrey),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          toDate != null
                              ? dateFormat.format(toDate!)
                              : 'To Date',
                          style: TextStyle(
                            color: toDate != null
                                ? AppColors.textPrimaryBlue
                                : AppColors.textHintGrey,
                            fontSize: 14,
                            fontWeight: toDate != null
                                ? FontWeight.w500
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                      Image.asset(
                        "assets/icons/date_icon.png",
                        height: 20,
                        width: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(width: 12),

            GestureDetector(
              onTap: onSearchToggle,
              child: Image.asset("assets/icons/search_icon.png", height: 36),
            ),
          ],
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: isSearchVisible
              ? Column(
                  children: [
                    const SizedBox(height: 12),
                    TextField(
                      onChanged: onSearchQueryChanged,
                      decoration: InputDecoration(
                        hintText: 'Search by title (e.g., Panel A, Panel B...)',
                        hintStyle: TextStyle(
                          color: AppColors.textHintGrey,
                          fontSize: 14,
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: AppColors.textHintGrey,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: AppColors.borderGrey),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: AppColors.borderGrey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: AppColors.primaryBlue,
                            width: 2,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),
                      ),
                    ),
                  ],
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
