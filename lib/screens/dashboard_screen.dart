import 'package:flutter/material.dart';
import 'profile_screen.dart'; // Ensure this exists in your project

class DashboardScreen extends StatelessWidget {
  /// Login API se User ID receive hogi
  final int userId;

  const DashboardScreen({
    super.key,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // A light, modern background color to contrast the header
      backgroundColor: const Color(0xFFF5F7FA),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // 1. Beautiful Gradient Header Background
            Container(
              height: 320,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF4A00E0), // Vibrant purple
                    Color(0xFF8E2DE2), // Lighter purple
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
            ),

            // 2. Main Content
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    const SizedBox(height: 20),

                    // --- Header Title ---
                    const Text(
                      "Employee Dashboard",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                    ),

                    const SizedBox(height: 30),

                    // --- Profile Information ---
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: const CircleAvatar(
                        radius: 45,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.person,
                          size: 50,
                          color: Color(0xFF4A00E0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      "Welcome, Employee",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "User ID : $userId",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),

                    // --- Floating Action Card (All items consolidated) ---
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          _buildActionTile(
                            context: context,
                            icon: Icons.person_outline,
                            title: "View Profile",
                            subtitle: "Manage your personal details",
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => ProfileScreen(userId: userId),
                                ),
                              );
                            },
                          ),
                          Divider(height: 1, color: Colors.grey[200]),
                          _buildActionTile(
                            context: context,
                            icon: Icons.people_outline,
                            title: "Employee Directory",
                            subtitle: "Find your colleagues",
                            onTap: () => _showComingSoon(context),
                          ),
                          Divider(height: 1, color: Colors.grey[200]),
                          _buildActionTile(
                            context: context,
                            icon: Icons.settings_outlined,
                            title: "Settings",
                            subtitle: "App preferences & security",
                            onTap: () => _showComingSoon(context),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30), // Bottom padding
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Helper method to create clean, modern list tiles for actions
  Widget _buildActionTile({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F7FA),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          icon,
          color: const Color(0xFF4A00E0),
          size: 26,
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
          color: Color(0xFF2D3142),
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          color: Colors.grey[600],
          fontSize: 13,
        ),
      ),
      trailing: const Icon(
        Icons.chevron_right,
        color: Colors.grey,
      ),
      onTap: onTap,
    );
  }

  /// Helper method for SnackBar
  void _showComingSoon(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        content: const Text("Feature Coming Soon!"),
      ),
    );
  }
}