import 'package:flutter/material.dart';
import 'package:machine_task/data/models/device_model.dart';
import 'package:machine_task/utils/constants/colors.dart';

class DeviceListItem extends StatelessWidget {
  final Device device;

  const DeviceListItem({super.key, required this.device});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 365, // Fixed width from Figma
      height: 86, // Fixed height from Figma
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white, // Fill color white
        borderRadius: BorderRadius.circular(20), // Corner radius 20
        border: Border.all(
          color: AppColors.transparent,
          width: 0,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 63,
            height: 63,
            decoration: BoxDecoration(
              color: const Color(0xFFE6E6E6), // Fill color from Figma
              borderRadius: BorderRadius.circular(30), // Corner radius 0 from Figma
              border: Border.all(
                color: Colors.white.withOpacity(0.92), // Stroke color with 92% opacity
                width: 0.25, // Stroke weight 0.25 from Figma
              ),
            ),
            child: Center(
              child: _getDeviceIcon(device.icon),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  device.name,
                  style: TextStyle(
                    color: AppColors.fontColorBlack,
                    fontSize: 14,
                    fontFamily: 'Geist',
                    fontWeight: FontWeight.w500, // Semi-bold weight
                    height: 1.5, // Line height
                    letterSpacing: 0.0, // 0% letter spacing
                  ),
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: device.isOnline ? AppColors.online : AppColors.offline,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      device.isOnline ? 'Online' : 'Offline',
                      style: TextStyle(
                        color: AppColors.fontColorGrey,
                        fontSize: 12,
                        fontFamily: 'Geist',
                        fontWeight: FontWeight.w500, // Regular weight
                        height: 1.2, // Line height
                        letterSpacing: 0.0, // 0% letter spacing
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          Icon(
            Icons.arrow_forward_ios,
            color: AppColors.grey,
            size: 16,
          ),
        ],
      ),
    );
  }

  Widget _getDeviceIcon(String iconName) {
    String imagePath;
    switch (iconName) {
      case 'socket':
        imagePath = 'lib/assets/icons/socket.png';
        break;
      case 'light':
        imagePath = 'lib/assets/icons/light.png';
        break;
      case 'fan':
        imagePath = 'lib/assets/images/fan.png';
        break;
      default:
        return Icon(Icons.power, color: AppColors.darkGrey);
    }
    return Image.asset(imagePath, width: 50, height: 50);
  }
}
