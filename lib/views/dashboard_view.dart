import 'package:flutter/material.dart';

import '../controllers/app_controller.dart';
import 'details_view.dart';

class DashboardView extends StatelessWidget {
  final AppController controller;

  const DashboardView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black87),
          onPressed: () {},
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.water_drop, color: Colors.blueAccent),
            const SizedBox(width: 8),
            Text(
              'AgriFlow',
              style: TextStyle(
                color: Colors.green[800],
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Badge(
              label: Text('3'),
              child: Icon(Icons.notifications_outlined, color: Colors.black87),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Good morning, Juan!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Here's your irrigation overview today.",
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
              const SizedBox(height: 24),
              _buildStatusCard(context), // Passed context here
              const SizedBox(height: 28),
              _buildSectionHeader("Live Sensor Summary", "View All"),
              const SizedBox(height: 16),
              _buildSensorScroll(context), // Passed context here
              const SizedBox(height: 28),
              const Text(
                "Quick Actions",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 16),
              _buildQuickActions(),
            ],
          ),
        ),
      ),
    );
  }

  // Added BuildContext parameter to handle navigation
  Widget _buildStatusCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Top Green Section
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.green[700],
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Current Irrigation Status",
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "GOOD",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Icon(
                        Icons.check_circle,
                        color: Colors.white,
                        size: 20,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Water quality is suitable\nfor irrigation.",
                        style: TextStyle(
                          color: Colors.green[100],
                          fontSize: 13,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.green[600],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.landscape,
                    color: Colors.white54,
                    size: 40,
                  ),
                ),
              ],
            ),
          ),
          // Bottom White Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Wrapped the Canal section in an InkWell for navigation
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DetailsView(),
                      ),
                    );
                  },
                  borderRadius: BorderRadius.circular(8),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Canal",
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Row(
                          children: [
                            Text(
                              "North Canal A",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                            Icon(
                              Icons.chevron_right,
                              size: 16,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Last Updated",
                      style: TextStyle(color: Colors.grey[500], fontSize: 12),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.schedule, size: 14, color: Colors.grey[600]),
                        const SizedBox(width: 4),
                        const Text(
                          "2 mins ago",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, String action) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        Text(
          action,
          style: TextStyle(
            color: Colors.green[700],
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  // Added BuildContext parameter to pass it down to individual items
  Widget _buildSensorScroll(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      clipBehavior: Clip.none,
      child: Row(
        children: [
          _buildSensorItem(
            context,
            Icons.water_drop,
            Colors.blue,
            "pH Level",
            "6.8",
            "Good",
            "",
          ),
          const SizedBox(width: 12),
          _buildSensorItem(
            context,
            Icons.waves,
            Colors.cyan,
            "Turbidity",
            "4",
            "Good",
            "NTU",
          ),
          const SizedBox(width: 12),
          _buildSensorItem(
            context,
            Icons.thermostat,
            Colors.redAccent,
            "Temperature",
            "27",
            "Good",
            "°C",
          ),
        ],
      ),
    );
  }

  // Added BuildContext and GestureDetector to handle taps
  Widget _buildSensorItem(
    BuildContext context,
    IconData icon,
    Color iconColor,
    String title,
    String value,
    String status,
    String unit,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DetailsView()),
        );
      },
      child: Container(
        width: 120,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: iconColor, size: 24),
            const SizedBox(height: 12),
            Text(
              title,
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
            ),
            const SizedBox(height: 4),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                if (unit.isNotEmpty) ...[
                  const SizedBox(width: 2),
                  Text(
                    unit,
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 4),
            Text(
              status,
              style: TextStyle(
                color: Colors.green[700],
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildActionItem(Icons.location_on_outlined, "View Map", Colors.green),
        _buildActionItem(Icons.show_chart, "Sensor History", Colors.purple),
        _buildActionItem(
          Icons.notifications_none,
          "Notifications",
          Colors.orange,
        ),
        _buildActionItem(
          Icons.warning_amber_rounded,
          "Report Problem",
          Colors.black54,
        ),
      ],
    );
  }

  Widget _buildActionItem(IconData icon, String label, Color color) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Icon(icon, color: color, size: 28),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(fontSize: 11, color: Colors.grey[700]),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
