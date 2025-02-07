import 'package:flutter/material.dart';
import 'package:sprints_device_features_task/device_info_screen.dart';

void main() {
  runApp(const DeviceInfoApp());
}

class DeviceInfoApp extends StatelessWidget {
  const DeviceInfoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Device Info',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.teal,
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          titleMedium: TextStyle(
            color: Colors.tealAccent,
          ),
        ),
      ),
      home: const DeviceInfoScreen(),
    );
  }
}
