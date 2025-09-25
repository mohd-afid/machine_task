import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // The package has 5 items, with index 2 being the center button.
    // Our logical index has 4 items (0, 1, 2, 3).
    // We need to map our logical index to the package's index for correct highlighting.
    int packageIndex = currentIndex >= 2 ? currentIndex + 1 : currentIndex;

    return CurvedNavigationBar(
      index: packageIndex,
      height: 75.0,
      items: <Widget>[
        _buildNavItem(Icons.home, 'Home', 0 == currentIndex),
        _buildNavItem(Icons.tablet_mac_outlined, 'Devices', 1 == currentIndex),
        const Icon(Icons.add, size: 30, color: Colors.white),
        _buildNavItem(Icons.play_circle_outline, 'Automation', 2 == currentIndex),
        _buildNavItem(Icons.notifications_outlined, 'Notifications', 3 == currentIndex),
      ],
      color: Colors.white,
      buttonBackgroundColor: Colors.black,
      backgroundColor: Colors.transparent,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      onTap: (index) {
        if (index == 2) {
          // This is the FAB tap, we can show a snackbar or perform another action.

        } else {
          // Map the package index back to our logical index before calling the callback.
          int logicalIndex = index > 2 ? index - 1 : index;
          onTap(logicalIndex);
        }
      },
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isSelected) {
    final Color color = isSelected ? Colors.black : Colors.grey[500]!;
    final FontWeight fontWeight = isSelected ? FontWeight.w600 : FontWeight.w400;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 26,
          color: color,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: color,
            fontSize: 12,
            fontWeight: fontWeight,
          ),
        ),
      ],
    );
  }
}
