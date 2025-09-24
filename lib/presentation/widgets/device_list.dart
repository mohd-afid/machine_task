import 'package:flutter/material.dart';
import 'package:machine_task/data/models/device_model.dart';
import 'package:machine_task/presentation/widgets/device_list_item.dart';

class DeviceList extends StatelessWidget {
  final List<Device> devices = [
    Device(name: '16A Socket', icon: 'socket', isOnline: true),
    Device(name: 'Ikea Light', icon: 'light', isOnline: false),
    Device(name: 'Fan Philips', icon: 'fan', isOnline: false),
    Device(name: 'AC Godrej', icon: 'ac', isOnline: false),
  ];

  DeviceList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: devices.length,
        itemBuilder: (context, index) {
          return DeviceListItem(device: devices[index]);
        },
      ),
    );
  }
}
