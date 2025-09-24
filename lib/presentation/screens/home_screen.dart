import 'package:flutter/material.dart';
import 'package:machine_task/presentation/widgets/custom_bottom_nav_bar.dart';
import 'package:machine_task/presentation/widgets/device_list.dart';
import 'package:machine_task/presentation/widgets/header_section.dart';
import 'package:machine_task/presentation/widgets/room_selector.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeaderSection(),
       //   const RoomSelector(),
          SizedBox(height: 16,),
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
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}
