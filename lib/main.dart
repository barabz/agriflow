import 'package:flutter/material.dart';

import 'controllers/app_controller.dart';
import 'views/home_page.dart';

void main() {
  runApp(const AgriFlowApp());
}

class AgriFlowApp extends StatelessWidget {
  const AgriFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AgriFlow',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF4F7FB),
        textTheme: Typography.material2021().white.copyWith(
              bodyLarge: const TextStyle(color: Color(0xFF1D2A3A)),
              bodyMedium: const TextStyle(color: Color(0xFF566272)),
            ),
      ),
      home: AppHomePage(controller: AppController()),
    );
  }
}
