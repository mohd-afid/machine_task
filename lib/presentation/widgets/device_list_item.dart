import 'package:flutter/material.dart';
import 'package:machine_task/data/models/device_model.dart';

class DeviceListItem extends StatelessWidget {
  final Device device;

  const DeviceListItem({super.key, required this.device});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: device.isOnline ? Colors.blue : Colors.transparent,
          width: 2,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[200],
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
                    color: device.isOnline ? Colors.green : Colors.red,
                    size: 12,
                  ),
                  const SizedBox(width: 5),
                  Text(device.isOnline ? 'Online' : 'Offline'),
                ],
              ),
            ],
          ),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _getDeviceIcon(String iconName) {
    switch (iconName) {
      case 'socket':
        return Image.asset('lib/assets/icons/socket.png', width: 30, height: 30);
      case 'light':
        return Image.asset('lib/assets/icons/light.png', width: 30, height: 30);
      default:
        return Icon(Icons.power, color: Colors.grey[800]);
    }
  }
}
