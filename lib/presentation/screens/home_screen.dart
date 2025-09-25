import 'package:flutter/material.dart';
import 'package:machine_task/utils/constants/colors.dart';
import 'package:machine_task/presentation/widgets/custom_bottom_nav_bar.dart';
import 'package:machine_task/presentation/widgets/device_list.dart';
import 'package:machine_task/presentation/widgets/header_section.dart';
import 'package:machine_task/presentation/widgets/room_selector.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  void _onNavItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeaderSection(),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Devices',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
           DeviceList(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onNavItemTapped,
      ),
      floatingActionButton: Transform.translate(
        offset: const Offset(0, 30), // Moves the button down by 10 pixels
        child: SizedBox(
          width: 68,
          height: 68,
          child: FloatingActionButton(
            onPressed: () {
              // Handle FAB tap

            },
            backgroundColor: AppColors.transparent,
            shape: const CircleBorder(),
            child: Image.asset(
              'lib/assets/icons/center_plus_button.png',
              width: 70,
              height: 70,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
