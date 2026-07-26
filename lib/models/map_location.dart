import 'package:flutter/material.dart';

enum LocationStatus { good, warning, unsafe }

class MapLocation {
  final String name;
  final LocationStatus status;
  final String subtitle;
  final String details;
  final double top;
  final double left;
  final double latitude;
  final double longitude;

  MapLocation({
    required this.name,
    required this.status,
    required this.subtitle,
    required this.details,
    required this.top,
    required this.left,
    this.latitude = 12.8797,
    this.longitude = 121.7740,
  });

  Color get statusColor {
    switch (status) {
      case LocationStatus.good:
        return const Color(0xFF24B470);
      case LocationStatus.warning:
        return const Color(0xFFF1B40F);
      case LocationStatus.unsafe:
        return const Color(0xFFE63946);
    }
  }
}
