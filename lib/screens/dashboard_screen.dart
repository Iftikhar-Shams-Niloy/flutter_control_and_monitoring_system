import 'package:flutter/material.dart';
import 'package:flutter_control_and_monitoring_system/core/app_colors.dart';
import 'package:flutter_control_and_monitoring_system/widgets/circular_chart.dart';
import 'package:flutter_control_and_monitoring_system/widgets/data_card.dart';
import 'package:flutter_control_and_monitoring_system/widgets/menu_card.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _SCMDashboardScreenState();
}

class _SCMDashboardScreenState extends State<DashboardScreen> {
  int selectedTabIndex = 0;
  bool isSourceSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8EEF2),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
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

                    const Text(
                      'Electricity',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textHintGrey,
                        letterSpacing: 0.5,
                      ),
                    ),

                    const SizedBox(height: 8),
                    Container(
                      height: 2,
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      color: AppColors.borderGrey,
                    ),
                    const SizedBox(height: 32),

                    // Circular Chart
                    const CircularChart(),

                    const SizedBox(height: 32),

                    // Source/Load Toggle (sliding switch)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                          color: AppColors.sliderBackgroudnGrey,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Stack(
                          children: [
                            AnimatedAlign(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeInOut,
                              alignment: isSourceSelected
                                  ? Alignment.centerLeft
                                  : Alignment.centerRight,
                              child: FractionallySizedBox(
                                widthFactor: 0.5,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryBlue,
                                    borderRadius: BorderRadius.circular(28),
                                  ),
                                ),
                              ),
                            ),

                            Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () => setState(() {
                                      isSourceSelected = true;
                                    }),
                                    behavior: HitTestBehavior.translucent,
                                    child: Center(
                                      child: Text(
                                        'Source',
                                        style: TextStyle(
                                          color: isSourceSelected
                                              ? Colors.white
                                              : AppColors.textHintGrey,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () => setState(() {
                                      isSourceSelected = false;
                                    }),
                                    behavior: HitTestBehavior.translucent,
                                    child: Center(
                                      child: Text(
                                        'Load',
                                        style: TextStyle(
                                          color: !isSourceSelected
                                              ? Colors.white
                                              : AppColors.textHintGrey,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    Container(
                      height: 3,
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      color: AppColors.borderGrey,
                    ),

                    const SizedBox(height: 16),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: SizedBox(
                        height: 3 * 102,
                        child: Builder(
                          builder: (context) {
                            final cards = [
                              const DataCard(
                                'Data View',
                                'Active',
                                'solar_panel.png',
                                Color(0xFF5DADE2),
                                true,
                              ),
                              const DataCard(
                                'Data View',
                                'Active',
                                'solar_panel.png',
                                Color(0xFF5DADE2),
                                true,
                              ),
                              const DataCard(
                                'Data Type 2',
                                'Active',
                                'generator.png',
                                Color(0xFFF39C12),
                                true,
                              ),
                              const DataCard(
                                'Data Type 3',
                                'Inactive',
                                'power_line.png',
                                Color(0xFF5DADE2),
                                false,
                              ),
                              const DataCard(
                                'Total Solar',
                                'Active',
                                'power_line.png',
                                Color(0xFF5DADE2),
                                true,
                              ),
                            ];

                            return ListView.separated(
                              padding: EdgeInsets.zero,
                              physics: const AlwaysScrollableScrollPhysics(),
                              itemCount: cards.length,
                              separatorBuilder: (_, _) =>
                                  const SizedBox(height: 12),
                              itemBuilder: (context, index) => cards[index],
                            );
                          },
                        ),
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
                  const MenuCard('Analysis Pro', 'analysis_icon.png'),
                  const MenuCard('G. Generator', 'g_generator_icon.png'),
                  const MenuCard('Plant Summery', 'plant_icon.png'),
                  const MenuCard('Natural Gas', 'gas_icon.png'),
                  const MenuCard('D. Generator', 'd_generator_icon.png'),
                  const MenuCard('Water Process', 'water_icon.png'),
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
}
