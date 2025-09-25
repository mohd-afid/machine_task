import 'package:flutter/material.dart';
import 'package:machine_task/utils/constants/colors.dart';

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
    return SizedBox(
      height: 85,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomPaint(
              size: Size(MediaQuery.of(context).size.width, 85),
              painter: NavBarPainter(),
              child: Container(
                height: 85,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildNavItem('lib/assets/icons/home-trend-down.png', 'Home', 0),
                    _buildNavItem('lib/assets/icons/monitor-mobbile.png', 'Devices', 1),
                    const SizedBox(width: 60), // Space for FAB
                    _buildNavItem('lib/assets/icons/video-octagon.png', 'Automation', 2),
                    _buildNavItem('lib/assets/icons/notification-bing.png', 'Notifications', 3),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(String iconPath, String label, int index) {
    final isSelected = currentIndex == index;
    final Color color = isSelected ? AppColors.black : AppColors.mediumGrey;
    final FontWeight fontWeight = isSelected ? FontWeight.w600 : FontWeight.w400;

    return Expanded(
      child: InkWell(
        onTap: () => onTap(index),
        borderRadius: BorderRadius.circular(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              iconPath,
              height: 26,
              width: 26,
              color: color,
            ),
            const SizedBox(height: 6),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 12,
                fontWeight: fontWeight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NavBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Create shadow paint
    final shadowPaint = Paint()
      ..color = Colors.black.withOpacity(0.1)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8)
      ..style = PaintingStyle.fill;

    // Create main paint
    final paint = Paint()
      ..color = AppColors.white
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 20) // Start top-left after corner
      ..quadraticBezierTo(0, 0, 20, 0) // Top-left corner
      ..lineTo(size.width * 0.35, 0)
      // The curve for the FAB
      ..cubicTo(
        size.width * 0.4, 0, // Control point 1
        size.width * 0.4, 70, // Control point 2
        size.width * 0.5, 70, // End point
      )
      ..cubicTo(
        size.width * 0.6, 70, // Control point 1
        size.width * 0.6, 0, // Control point 2
        size.width * 0.65, 0, // End point
      )
      ..lineTo(size.width - 20, 0) // Line to top-right corner
      ..quadraticBezierTo(size.width, 0, size.width, 20) // Top-right corner
      ..lineTo(size.width, size.height) // Right side
      ..lineTo(0, size.height) // Bottom side
      ..close(); // Close path

    // Draw shadow first (offset slightly down)
    canvas.save();
    canvas.translate(0, 2);
    canvas.drawPath(path, shadowPaint);
    canvas.restore();

    // Draw main shape
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
