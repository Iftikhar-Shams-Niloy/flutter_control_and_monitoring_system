import 'package:flutter/material.dart';

class ViewToggleWidget extends StatelessWidget {
  final bool isDataView;
  final Function(bool) onToggle;

  const ViewToggleWidget({
    super.key,
    required this.isDataView,
    required this.onToggle,
  });

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
                      color: isDataView
                          ? const Color(0xFF0098FF)
                          : Colors.grey[400],
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Data View',
                      style: TextStyle(
                        color: isDataView
                            ? const Color(0xFF0098FF)
                            : Colors.grey[600],
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
                      color: !isDataView
                          ? const Color(0xFF0098FF)
                          : Colors.grey[400],
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Revenue View',
                      style: TextStyle(
                        color: !isDataView
                            ? const Color(0xFF0098FF)
                            : Colors.grey[600],
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
