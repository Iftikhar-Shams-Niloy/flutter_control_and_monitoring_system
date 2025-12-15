import 'package:flutter/material.dart';

class SCMDashboardScreen extends StatefulWidget {
  const SCMDashboardScreen({Key? key}) : super(key: key);

  @override
  State<SCMDashboardScreen> createState() => _SCMDashboardScreenState();
}

class _SCMDashboardScreenState extends State<SCMDashboardScreen> {
  int selectedTabIndex = 0;
  bool isSourceSelected = true;

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
              // Tab Section
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    // Tabs
                    Row(
                      children: [
                        _buildTab('Summery', 0),
                        _buildTab('SLD', 1),
                        _buildTab('Data', 2),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Electricity Title
                    const Text(
                      'Electricity',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                        letterSpacing: 0.5,
                      ),
                    ),

                    const SizedBox(height: 8),
                    Container(
                      height: 1,
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      color: Colors.grey[300],
                    ),
                    const SizedBox(height: 32),

                    // Circular Chart
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 220,
                          height: 220,
                          child: CircularProgressIndicator(
                            value: 0.75,
                            strokeWidth: 28,
                            backgroundColor: Colors.grey[300],
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              Color(0xFF3D8FC6),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              'Total Power',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey[700],
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              '5.53 kw',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 32),

                    // Source/Load Toggle
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSourceSelected = true;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 14,
                                ),
                                decoration: BoxDecoration(
                                  color: isSourceSelected
                                      ? const Color(0xFF0098FF)
                                      : Colors.grey[200],
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Center(
                                  child: Text(
                                    'Source',
                                    style: TextStyle(
                                      color: isSourceSelected
                                          ? Colors.white
                                          : Colors.grey[600],
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSourceSelected = false;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 14,
                                ),
                                decoration: BoxDecoration(
                                  color: !isSourceSelected
                                      ? const Color(0xFF0098FF)
                                      : Colors.grey[200],
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Center(
                                  child: Text(
                                    'Load',
                                    style: TextStyle(
                                      color: !isSourceSelected
                                          ? Colors.white
                                          : Colors.grey[600],
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    Container(
                      height: 3,
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      color: Colors.grey[300],
                    ),

                    const SizedBox(height: 16),

                    // Data View Cards
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          _buildDataCard(
                            'Data View',
                            'Active',
                            'solar_panel.png',
                            const Color(0xFF5DADE2),
                            true,
                          ),
                          const SizedBox(height: 12),
                          _buildDataCard(
                            'Data Type 2',
                            'Active',
                            'generator.png',
                            const Color(0xFFF39C12),
                            true,
                          ),
                          const SizedBox(height: 12),
                          _buildDataCard(
                            'Data Type 3',
                            'Inactive',
                            'power_line.png',
                            const Color(0xFF5DADE2),
                            false,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Bottom Grid Menu
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 2.5,
                children: [
                  _buildMenuCard('Analysis Pro', 'analysis_icon.png'),
                  _buildMenuCard('G. Generator', 'g_generator_icon.png'),
                  _buildMenuCard('Plant Summery', 'plant_icon.png'),
                  _buildMenuCard('Natural Gas', 'gas_icon.png'),
                  _buildMenuCard('D. Generator', 'd_generator_icon.png'),
                  _buildMenuCard('Water Process', 'water_icon.png'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTab(String title, int index) {
    bool isSelected = selectedTabIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedTabIndex = index;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF0098FF) : Colors.transparent,
            borderRadius: BorderRadius.only(
              topLeft: index == 0 ? const Radius.circular(16) : Radius.zero,
              topRight: index == 2 ? const Radius.circular(16) : Radius.zero,
            ),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey[600],
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDataCard(
    String title,
    String status,
    String iconPath,
    Color indicatorColor,
    bool isActive,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFFE8F4F8) : Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!, width: 1),
      ),
      child: Row(
        children: [
          // Icon
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Image.asset(
                iconPath,
                width: 35,
                height: 35,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.image, size: 35, color: Colors.grey[400]);
                },
              ),
            ),
          ),
          const SizedBox(width: 12),

          // Title and Status
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: indicatorColor,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '($status)',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: isActive ? const Color(0xFF0098FF) : Colors.red,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'Data 1    : 55505.63',
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
                const SizedBox(height: 4),
                Text(
                  'Data 2    : 58805.63',
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
              ],
            ),
          ),

          // Arrow
          Icon(Icons.chevron_right, color: Colors.grey[600], size: 28),
        ],
      ),
    );
  }

  Widget _buildMenuCard(String title, String iconPath) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Image.asset(
              iconPath,
              width: 36,
              height: 36,
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.image, size: 36, color: Colors.grey[400]);
              },
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF5A6C7D),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
