import 'package:flutter/material.dart';

import '../models/alert_item.dart';
import '../models/map_location.dart';
import '../models/sensor_summary.dart';
import '../models/water_quality_metric.dart';

class AppController {
  int selectedIndex = 0;
  int selectedMapIndex = 0;

  String get userName => 'Juan';
  String get activeCanal => 'North Canal A';
  int get qualityScore => 92;
  String get qualityStatus => 'GOOD';
  String get qualityLabel => 'Safe for Irrigation';
  DateTime get lastUpdated =>
      DateTime.now().subtract(const Duration(minutes: 2));

  final List<SensorSummary> summaries = [
    SensorSummary(
      title: 'pH Level',
      value: '6.8',
      status: 'Good',
      statusColor: Color(0xFF24B470),
    ),
    SensorSummary(
      title: 'Turbidity',
      value: '4 NTU',
      status: 'Good',
      statusColor: Color(0xFF24B470),
    ),
    SensorSummary(
      title: 'Temperature',
      value: '27°C',
      status: 'Good',
      statusColor: Color(0xFF24B470),
    ),
    SensorSummary(
      title: 'TDS',
      value: '240 ppm',
      status: 'Good',
      statusColor: Color(0xFF24B470),
    ),
    SensorSummary(
      title: 'Water Level',
      value: 'Normal',
      status: 'Good',
      statusColor: Color(0xFF24B470),
    ),
  ];

  final List<WaterQualityMetric> metrics = [
    WaterQualityMetric(
      label: 'pH Level',
      value: '6.8',
      description: '(6.0 - 7.5)',
      status: 'Good',
      statusColor: Color(0xFF24B470),
      icon: Icons.science,
    ),
    WaterQualityMetric(
      label: 'Turbidity',
      value: '4 NTU',
      description: '< 10 NTU',
      status: 'Good',
      statusColor: Color(0xFF24B470),
      icon: Icons.water_drop,
    ),
    WaterQualityMetric(
      label: 'Temperature',
      value: '27°C',
      description: '< 35°C',
      status: 'Good',
      statusColor: Color(0xFF24B470),
      icon: Icons.thermostat,
    ),
    WaterQualityMetric(
      label: 'TDS',
      value: '240 ppm',
      description: '< 500 ppm',
      status: 'Good',
      statusColor: Color(0xFF24B470),
      icon: Icons.scatter_plot,
    ),
    WaterQualityMetric(
      label: 'Water Level',
      value: 'Normal',
      description: '(Optimal)',
      status: 'Good',
      statusColor: Color(0xFF24B470),
      icon: Icons.opacity,
    ),
  ];

  final List<AlertItem> alerts = [
    AlertItem(
      title: 'Poor Water Quality Detected',
      subtitle: 'South Canal B • Today, 8:35 AM',
      severity: 'High',
      parameter: 'High Turbidity (32 NTU)',
      details: [
        'Stop irrigation temporarily.',
        'Wait for water quality to normalize.',
        'Contact irrigation authority.',
      ],
      alertType: AlertType.critical,
    ),
    AlertItem(
      title: 'Water Quality Warning',
      subtitle: 'North Canal A • Today, 6:20 AM',
      severity: 'Medium',
      parameter: 'TDS approaching limit',
      alertType: AlertType.warning,
    ),
    AlertItem(
      title: 'Water Quality Back to Normal',
      subtitle: 'South Canal B • May 20, 2024 • 7:15 PM',
      severity: 'Info',
      parameter: 'All sensors stabilized',
      alertType: AlertType.info,
    ),
    AlertItem(
      title: 'Scheduled Maintenance',
      subtitle: 'Sensor maintenance on East Canal C • May 20, 2024 • 9:00 AM',
      severity: 'Info',
      parameter: 'Maintenance reminder',
      alertType: AlertType.info,
    ),
  ];

  final List<MapLocation> locations = [
    MapLocation(
      name: 'North Canal A',
      status: LocationStatus.good,
      subtitle: 'Safe',
      details: 'pH: 6.8 • TDS: 240 ppm • Updated 2 mins ago',
      top: 0.18,
      left: 0.30,
      latitude: 14.5995,
      longitude: 120.9842,
    ),
    MapLocation(
      name: 'South Canal B',
      status: LocationStatus.unsafe,
      subtitle: 'Unsafe',
      details: 'Turbidity: 32 NTU • pH: 5.2 • Updated 2 mins ago',
      top: 0.44,
      left: 0.58,
      latitude: 10.3157,
      longitude: 123.8854,
    ),
    MapLocation(
      name: 'East Canal C',
      status: LocationStatus.warning,
      subtitle: 'Warning',
      details: 'TDS: 680 ppm • Updated 5 mins ago',
      top: 0.32,
      left: 0.80,
      latitude: 8.4542,
      longitude: 124.6319,
    ),
    MapLocation(
      name: 'West Canal D',
      status: LocationStatus.good,
      subtitle: 'Good',
      details: 'pH: 7.0 • Updated 3 mins ago',
      top: 0.62,
      left: 0.18,
      latitude: 16.8409,
      longitude: 121.7712,
    ),
  ];

  void updateSelectedIndex(int index) {
    selectedIndex = index;
  }

  void selectMapLocation(int index) {
    selectedMapIndex = index;
  }

  String get updatedText {
    final minutes = DateTime.now().difference(lastUpdated).inMinutes;
    return minutes == 0 ? 'Just now' : '$minutes mins ago';
  }
}
