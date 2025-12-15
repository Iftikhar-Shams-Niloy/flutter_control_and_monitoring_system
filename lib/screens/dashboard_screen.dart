import 'package:flutter/material.dart';
import 'package:flutter_control_and_monitoring_system/core/app_colors.dart';
import 'package:flutter_control_and_monitoring_system/dummy_data.dart';
import 'package:flutter_control_and_monitoring_system/screens/data_details_screen.dart';
import 'package:flutter_control_and_monitoring_system/screens/menu_screen.dart';
import 'package:flutter_control_and_monitoring_system/widgets/circular_chart.dart';
import 'package:flutter_control_and_monitoring_system/widgets/data_card.dart';
import 'package:flutter_control_and_monitoring_system/widgets/menu_card.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _SCMDashboardScreenState();
}

class _SCMDashboardScreenState extends State<DashboardScreen> {
  int selectedTabIndex = 0;
  bool isSourceSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundGrey,
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Tab Section
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.borderGrey, width: 1),
                ),
                child: Column(
                  children: [
                    // Tabs
                    Stack(
                      children: [
                        // Animated sliding indicator
                        AnimatedPositioned(
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.easeInOut,
                          left:
                              selectedTabIndex *
                              (MediaQuery.of(context).size.width - 32) /
                              3,
                          right:
                              (2 - selectedTabIndex) *
                              (MediaQuery.of(context).size.width - 32) /
                              3,
                          top: 0,
                          bottom: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.primaryBlue,
                              borderRadius: BorderRadius.only(
                                topLeft: const Radius.circular(16),
                                topRight: const Radius.circular(16),
                              ),
                            ),
                          ),
                        ),
                        // Tab buttons
                        Row(
                          children: [
                            _buildTab('Summery', 0),
                            _buildTab('SLD', 1),
                            _buildTab('Data', 2),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    const Text(
                      'Electricity',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textHintGrey,
                        letterSpacing: 0.5,
                      ),
                    ),

                    const SizedBox(height: 12),

                    Container(
                      height: 2,
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      color: AppColors.borderGrey,
                    ),
                    const SizedBox(height: 32),

                    const CircularChart(),

                    const SizedBox(height: 32),

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
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Stack(
                          children: [
                            SizedBox(
                              height: 3 * 96,
                              child: ListView.separated(
                                padding: EdgeInsets.zero,
                                physics: const AlwaysScrollableScrollPhysics(),
                                itemCount: DummyData.dataSources.length,
                                separatorBuilder: (_, _) =>
                                    const SizedBox(height: 12),
                                itemBuilder: (context, index) {
                                  final dataSource =
                                      DummyData.dataSources[index];
                                  return DataCard(
                                    dataSource: dataSource,
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              DataDetailsScreen(
                                                dataSource: dataSource,
                                              ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),

                            // subtle bottom gradient overlay to suggest negative elevation
                            Positioned(
                              left: 0,
                              right: 0,
                              bottom: 0,
                              height: 48,
                              child: IgnorePointer(
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.transparent,
                                        AppColors.textPrimaryBlue.withValues(
                                          alpha: 0.50,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
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
                mainAxisSpacing: 8,
                crossAxisSpacing: 16,
                childAspectRatio: 4.0,
                children: [
                  MenuCard(
                    'Analysis Pro',
                    'assets/icons/analysis_pro_icon.png',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MenuScreen(),
                        ),
                      );
                    },
                  ),
                  MenuCard(
                    'G. Generator',
                    'assets/icons/generator_icon.png',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MenuScreen(),
                        ),
                      );
                    },
                  ),
                  MenuCard(
                    'Plant Summery',
                    'assets/icons/plant_summery_icon.png',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MenuScreen(),
                        ),
                      );
                    },
                  ),
                  MenuCard(
                    'Natural Gas',
                    'assets/icons/natural_gas_icon.png',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MenuScreen(),
                        ),
                      );
                    },
                  ),
                  MenuCard(
                    'D. Generator',
                    'assets/icons/generator_icon.png',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MenuScreen(),
                        ),
                      );
                    },
                  ),
                  MenuCard(
                    'Water Process',
                    'assets/icons/water_process_icon.png',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MenuScreen(),
                        ),
                      );
                    },
                  ),
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
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(16),
                  topRight: const Radius.circular(16),
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
            Divider(thickness: 2, color: AppColors.borderGrey, height: 2),
          ],
        ),
      ),
    );
  }
}
