import 'package:flutter/material.dart';
import 'package:machine_task/data/models/device_model.dart';
import 'package:machine_task/utils/constants/colors.dart';

class DeviceListItem extends StatelessWidget {
  final Device device;

  const DeviceListItem({super.key, required this.device});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color:  AppColors.transparent,
          width: 2,
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
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                device.name,
                style: TextStyle(
                  color: AppColors.fontColorBlack,
                  fontSize: 14,
                  fontFamily: 'Geist',
                  fontWeight: FontWeight.w500, // Medium weight
                  height: 1.5, // Line height 18/12 = 1.5
                  letterSpacing: 0.0, // 0% letter spacing
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.circle,
                    color: device.isOnline ? AppColors.online : AppColors.offline,
                    size: 12,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    device.isOnline ? 'Online' : 'Offline',
                    style: TextStyle(
                      color: AppColors.fontColorGrey,
                      fontSize: 12,
                      fontFamily: 'Geist',
                      fontWeight: FontWeight.w500, // Medium weight
                      height: 1.5, // Line height 18/12 = 1.5
                      letterSpacing: 0.0, // 0% letter spacing
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios, color: AppColors.grey,size:16 ,),
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
