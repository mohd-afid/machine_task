import 'package:flutter/material.dart';
import 'package:machine_task/presentation/screens/home_screen.dart';
import 'package:machine_task/utils/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
    );
  }
}
