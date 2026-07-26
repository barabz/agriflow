import 'package:flutter/material.dart';

import '../controllers/app_controller.dart';

class AlertsView extends StatelessWidget {
  final AppController controller;

  const AlertsView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F9FA),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'Alerts',
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.filter_list, color: Colors.black87),
              onPressed: () {},
            ),
          ],
          bottom: TabBar(
            labelColor: Colors.green[700],
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.green[700],
            indicatorWeight: 3,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            tabs: [
              const Tab(text: "All"),
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Unread"),
                    const SizedBox(width: 4),
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: const Text(
                        "2",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ),
                  ],
                ),
              ),
              const Tab(text: "Important"),
            ],
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildMajorAlertCard(),
            const SizedBox(height: 16),
            _buildStandardAlertCard(
              icon: Icons.warning_amber_rounded,
              iconColor: Colors.orange,
              title: "Water Quality Warning",
              subtitle: "TDS level is approaching the limit.",
              meta: "North Canal A • Today, 6:20 AM",
            ),
            const SizedBox(height: 12),
            _buildStandardAlertCard(
              icon: Icons.info_outline,
              iconColor: Colors.blue,
              title: "Water Quality Back to Normal",
              subtitle: "South Canal B water quality is now safe.",
              meta: "May 20, 2024 • 7:15 PM",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMajorAlertCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.red.shade100, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.red.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Red Header
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.red[50],
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(14),
              ),
            ),
            child: Row(
              children: [
                Icon(Icons.report_problem, color: Colors.red[700], size: 28),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Poor Water Quality Detected",
                        style: TextStyle(
                          color: Colors.red[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "Immediate Action Recommended",
                        style: TextStyle(color: Colors.red[600], fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Details Table
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildAlertDetailRow("Canal", "South Canal B"),
                const Divider(),
                _buildAlertDetailRow("Detected At", "Today, 8:35 AM"),
                const Divider(),
                _buildAlertDetailRow(
                  "Parameter Triggered",
                  "High Turbidity (32 NTU)",
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Severity",
                      style: TextStyle(color: Colors.grey[600], fontSize: 14),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        "High",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const Text(
                  "Recommendations",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                const SizedBox(height: 8),
                _buildBulletPoint("Stop irrigation temporarily."),
                _buildBulletPoint("Wait for water quality to normalize."),
                _buildBulletPoint("Contact irrigation authority."),
                const SizedBox(height: 24),
                // Action Buttons
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.red,
                          side: const BorderSide(color: Colors.red),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "View on Map",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Acknowledge",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
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

  Widget _buildAlertDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: Colors.grey[600], fontSize: 14)),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "• ",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 14, color: Colors.grey[800]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStandardAlertCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required String meta,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: iconColor, size: 28),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.grey[700], fontSize: 13),
                ),
                const SizedBox(height: 8),
                Text(
                  meta,
                  style: TextStyle(color: Colors.grey[500], fontSize: 11),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Colors.grey),
        ],
      ),
    );
  }
}
