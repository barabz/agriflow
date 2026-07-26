import 'package:flutter/material.dart';

import '../controllers/app_controller.dart';

class ProfileView extends StatelessWidget {
  final AppController controller;

  const ProfileView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Profile',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 12),
          const Text(
            'Manage your account, alerts, and irrigation settings.',
            style: TextStyle(fontSize: 14, color: Color(0xFF5E6F7D)),
          ),
          const SizedBox(height: 24),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: const Color(0xFF107C45),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.userName,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'Irrigation Manager',
                        style: TextStyle(color: Color(0xFF5E6F7D)),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.edit, color: Color(0xFF107C45)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 22),
          _buildSection(
            title: 'Account Settings',
            items: [
              _ProfileMenuItem(icon: Icons.settings, title: 'App Settings'),
              _ProfileMenuItem(
                icon: Icons.notifications_active,
                title: 'Notification Preferences',
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildSection(
            title: 'Irrigation Data',
            items: [
              _ProfileMenuItem(
                icon: Icons.bar_chart,
                title: 'Historical Reports',
              ),
              _ProfileMenuItem(
                icon: Icons.report_problem,
                title: 'Incident Reports',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSection({required String title, required List<Widget> items}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 12),
        ...items,
      ],
    );
  }
}

class _ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const _ProfileMenuItem({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF107C45)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Color(0xFF7A8F9B),
        ),
        onTap: () {},
      ),
    );
  }
}
