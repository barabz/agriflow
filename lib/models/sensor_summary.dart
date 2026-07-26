import 'package:flutter/material.dart';

class SensorSummary {
  final String title;
  final String value;
  final String status;
  final Color statusColor;

  SensorSummary({
    required this.title,
    required this.value,
    required this.status,
    required this.statusColor,
  });
}
