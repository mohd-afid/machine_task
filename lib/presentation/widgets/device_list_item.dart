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
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.softGrey,
              borderRadius: BorderRadius.circular(50),
            ),
            child: _getDeviceIcon(device.icon),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                device.name,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Icon(
                    Icons.circle,
                    color: device.isOnline ? AppColors.online : AppColors.offline,
                    size: 12,
                  ),
                  const SizedBox(width: 5),
                  Text(device.isOnline ? 'Online' : 'Offline'),
                ],
              ),
            ],
          ),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios, color: AppColors.grey),
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
    return Image.asset(imagePath, width: 36, height: 36);
  }
}
