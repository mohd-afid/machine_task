import 'package:flutter/material.dart';
import 'package:machine_task/utils/constants/colors.dart';

class RoomSelector extends StatefulWidget {
  const RoomSelector({super.key});

  @override
  State<RoomSelector> createState() => _RoomSelectorState();
}

class _RoomSelectorState extends State<RoomSelector> {
  int _selectedIndex = 1;
  final List<String> _rooms = ['Kitchen', 'Living Room', 'Bedroom'];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white.withOpacity(.16),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(_rooms.length, (index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
              child: Text(
                _rooms[index],
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: _selectedIndex == index ? FontWeight.bold : FontWeight.normal,
                  color: _selectedIndex == index ? AppColors.black : AppColors.grey,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
