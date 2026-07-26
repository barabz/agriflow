import 'package:flutter/material.dart';

class WaterQualityMetric {
  final String label;
  final String value;
  final String description;
  final String status;
  final Color statusColor;
  final IconData icon;

  WaterQualityMetric({
    required this.label,
    required this.value,
    required this.description,
    required this.status,
    required this.statusColor,
    required this.icon,
  });
}
