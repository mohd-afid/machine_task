
import 'package:flutter/material.dart';
import 'package:machine_task/presentation/widgets/room_selector.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('lib/assets/images/home.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          // Background Image will go here
          Positioned(
            top: 50,
            left: 20,
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              child: ClipOval(
                child: Image.asset(
                  'lib/assets/icons/profile.png',
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const Positioned(
            top: 65,
            right: 20,
            child: Row(
              children: [
                Text(
                  'Purva Westend',
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Icon(Icons.arrow_drop_down, color: Colors.white),
              ],
            ),
          ),
          Positioned(
            bottom: 60,
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Image.asset('lib/assets/icons/tv.png', color: Colors.white, width: 24, height: 24),
                      const SizedBox(width: 8),
                      const Text('2', style: TextStyle(color: Colors.white, fontSize: 16)),
                    ],
                  ),
                  const Row(
                    children: [
                      Icon(Icons.person_outline, color: Colors.white),
                      SizedBox(width: 8),
                      Text('1', style: TextStyle(color: Colors.white, fontSize: 16)),
                    ],
                  ),
                  Image.asset('lib/assets/icons/Settings.png', color: Colors.white, width: 24, height: 24),
                ],
              ),
            ),
          ),
          Positioned(

            bottom: 0,
            left: 20,
            right: 20,
            child: RoomSelector(),
          ),
        ],
      ),
    );
  }
}
