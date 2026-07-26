import 'package:flutter/material.dart';

import '../controllers/app_controller.dart';
import 'alerts_view.dart';
import 'dashboard_view.dart';
import 'map_view.dart';
import 'profile_view.dart';

class AppHomePage extends StatefulWidget {
  final AppController controller;

  const AppHomePage({super.key, required this.controller});

  @override
  State<AppHomePage> createState() => _AppHomePageState();
}

class _AppHomePageState extends State<AppHomePage> {
  static const bottomItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.map_outlined), label: 'Map'),
    BottomNavigationBarItem(
      icon: Icon(Icons.notifications_outlined),
      label: 'Alerts',
    ),
    BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
  ];

  void onTabSelected(int index) {
    setState(() {
      widget.controller.updateSelectedIndex(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: widget.controller.selectedIndex,
          children: [
            DashboardView(controller: widget.controller),
            MapView(controller: widget.controller),
            AlertsView(controller: widget.controller),
            ProfileView(controller: widget.controller),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.controller.selectedIndex,
        onTap: onTabSelected,
        selectedItemColor: const Color(0xFF107C45),
        unselectedItemColor: const Color(0xFF7A8F9B),
        showUnselectedLabels: true,
        items: bottomItems,
      ),
    );
  }
}
