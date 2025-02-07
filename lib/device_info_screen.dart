// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:sprints_device_features_task/device_info_service.dart';

class DeviceInfoScreen extends StatefulWidget {
  const DeviceInfoScreen({super.key});

  @override
  DeviceInfoScreenState createState() => DeviceInfoScreenState();
}

class DeviceInfoScreenState extends State<DeviceInfoScreen> {
  String _deviceModel = 'Loading...';
  String _osVersion = 'Loading...';

  @override
  void initState() {
    super.initState();
    _fetchDeviceInfo();
  }

  Future<void> _fetchDeviceInfo() async {
    final model = await DeviceInfoService.getDeviceModel();
    final osVersion = await DeviceInfoService.getOSVersion();
    setState(() {
      _deviceModel = model;
      _osVersion = osVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[300],
      appBar: AppBar(
        shadowColor: Colors.black.withOpacity(0.3),
        backgroundColor: Colors.deepPurple[600],
        title: const Text('Device Info'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Device Model:',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 10),
              Text(
                _deviceModel,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(
                'OS Version:',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 10),
              Text(
                _osVersion,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
