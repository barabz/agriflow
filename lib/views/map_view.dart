import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../controllers/app_controller.dart';
import '../models/map_location.dart';

class MapView extends StatefulWidget {
  final AppController controller;

  const MapView({super.key, required this.controller});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  final MapController _mapController = MapController();

  @override
  Widget build(BuildContext context) {
    final selectedLocation =
        widget.controller.locations[widget.controller.selectedMapIndex];

    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FB),
      body: Stack(
        children: [
          Positioned.fill(child: _buildMapStack(context, selectedLocation)),
          Positioned(
            top: 16,
            left: 16,
            right: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Irrigation Map',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Live irrigation sensor locations across the region.',
                  style: TextStyle(fontSize: 14, color: Color(0xFF5E6F7D)),
                ),
                const SizedBox(height: 12),
                _buildStatusChips(),
              ],
            ),
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: 16,
            child: _buildLocationCard(selectedLocation),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusChips() {
    final items = [
      _TrendChip(label: 'All', color: const Color(0xFF107C45)),
      _TrendChip(label: 'Good', color: const Color(0xFF24B470)),
      _TrendChip(label: 'Warning', color: const Color(0xFFF1B40F)),
      _TrendChip(label: 'Unsafe', color: const Color(0xFFE63946)),
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: items
            .map(
              (item) => Padding(
                padding: const EdgeInsets.only(right: 10),
                child: item,
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _buildMapStack(BuildContext context, MapLocation selectedLocation) {
    final markers = widget.controller.locations.asMap().entries.map((entry) {
      final location = entry.value;
      return Marker(
        point: LatLng(location.latitude, location.longitude),
        width: 80,
        height: 80,
        child: GestureDetector(
          onTap: () {
            setState(() {
              widget.controller.selectMapLocation(entry.key);
            });
            _mapController.move(
              LatLng(location.latitude, location.longitude),
              12.5,
            );
          },
          child: Column(
            children: [
              Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  color: location.statusColor,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 3),
                  boxShadow: [
                    BoxShadow(
                      color: location.statusColor.withOpacity(0.35),
                      blurRadius: 12,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Text(
                  location.subtitle,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }).toList();

    final bounds = LatLngBounds(LatLng(8.0, 118.0), LatLng(17.0, 126.0));

    return ClipRRect(
      child: FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          center: LatLng(selectedLocation.latitude, selectedLocation.longitude),
          zoom: 12.5,
          minZoom: 4,
          maxZoom: 18,
          interactiveFlags: InteractiveFlag.all,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.agriflow',
          ),
          MarkerLayer(markers: markers),
        ],
      ),
    );
  }

  Widget _buildLocationCard(MapLocation location) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                location.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: location.statusColor.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Text(
                  location.subtitle,
                  style: TextStyle(
                    color: location.statusColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            location.details,
            style: const TextStyle(fontSize: 14, color: Color(0xFF5E6F7D)),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow() {
    final summaries = [
      _LocationSummary(
        label: 'Active Sensors',
        value: '18',
        color: const Color(0xFF107C45),
      ),
      _LocationSummary(
        label: 'Unsafe Locations',
        value: '2',
        color: const Color(0xFFE63946),
      ),
      _LocationSummary(
        label: 'Good Quality',
        value: '16',
        color: const Color(0xFF24B470),
      ),
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: summaries
          .map(
            (item) => Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: item,
              ),
            ),
          )
          .toList(),
    );
  }
}

class _TrendChip extends StatelessWidget {
  final String label;
  final Color color;

  const _TrendChip({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        label,
        style: TextStyle(color: color, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _LocationSummary extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _LocationSummary({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(color: Color(0xFF7A8F9B), fontSize: 12),
          ),
          const SizedBox(height: 10),
          Text(
            value,
            style: TextStyle(
              color: color,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
