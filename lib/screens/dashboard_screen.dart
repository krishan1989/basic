import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  final int userId;

  const DashboardScreen({
    super.key,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    // Exact colors from the reference image
    const Color primaryNavy = Color(0xFF001C44);
    const Color primaryGold = Color(0xFFF2B035);
    const Color bgWhite = Color(0xFFF8F9FA);

    return Scaffold(
      backgroundColor: bgWhite,

      // ==========================================
      // SIDEBAR (DRAWER) WITH USER DETAILS
      // ==========================================
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: primaryNavy,
              ),
              currentAccountPicture: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, color: primaryNavy, size: 36),
              ),
              accountName: const Text(
                "Krishan Kumar",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Jr. Assistant, ASD Lab"),
                  Text(
                    "ID: $userId",
                    style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 12),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person_outline),
              title: const Text('My Profile'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.article_outlined),
              title: const Text('My Applications'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.settings_outlined),
              title: const Text('Settings'),
              onTap: () => Navigator.pop(context),
            ),
            const Spacer(),
            const Divider(),
            // RED LOGOUT BUTTON
            ListTile(
              leading: const Icon(Icons.power_settings_new, color: Colors.red),
              title: const Text(
                'Logout',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              onTap: () {
                // Logout logic here
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),

      // ==========================================
      // CUSTOM NAVY BLUE HEADER
      // ==========================================
      appBar: AppBar(
        backgroundColor: primaryNavy,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
        toolbarHeight: 90, // Taller to fit the complex logo/text
        title: Row(
          children: [
            // Placeholder for the balance scale logo
            Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Icon(Icons.balance, color: primaryGold, size: 28),
              ),
            ),
            const SizedBox(width: 12),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "High Court Employees\nWelfare Association",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Punjab & Haryana High Court",
                    style: TextStyle(
                      color: primaryGold,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),

      // ==========================================
      // BODY CONTENT
      // ==========================================
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- TOP OFFICIAL CARDS ---
            Container(
              color: primaryNavy,
              padding: const EdgeInsets.only(bottom: 20, left: 16, right: 16),
              child: Row(
                children: [
                  Expanded(
                    child: _buildOfficialCard(
                      imageUrl: "https://via.placeholder.com/150", // Replace with real asset
                      name: "Hon'ble Chief Justice",
                      title: "Justice Sheel Nagu",
                      subtitle: "Punjab & Haryana High Court",
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildOfficialCard(
                      imageUrl: "https://via.placeholder.com/150", // Replace with real asset
                      name: "Sh. Rajeev Tyagi",
                      title: "Registrar General",
                      subtitle: "Punjab & Haryana High Court",
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --- LATEST NOTICE BAR ---
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE53935), // Red badge
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            "Latest Notice",
                            style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Text(
                            "Cricket Tournament 2024 - Registration Open",
                            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const Icon(Icons.chevron_right, color: Colors.grey),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // --- QUICK LINKS GRID ---
                  const Text(
                    "Quick Links",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildQuickLink(
                        icon: Icons.account_balance,
                        iconColor: Colors.blue,
                        bgColor: Colors.blue.shade50,
                        label: "High Court\nDirectory",
                      ),
                      _buildQuickLink(
                        icon: Icons.card_giftcard,
                        iconColor: Colors.green,
                        bgColor: Colors.green.shade50,
                        label: "Welfare\nSchemes",
                      ),
                      _buildQuickLink(
                        icon: Icons.campaign,
                        iconColor: Colors.deepPurpleAccent,
                        bgColor: Colors.deepPurple.shade50,
                        label: "Latest\nNotifications",
                      ),
                      _buildQuickLink(
                        icon: Icons.photo_library,
                        iconColor: Colors.orange,
                        bgColor: Colors.orange.shade50,
                        label: "Photo\nGallery",
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // --- ABOUT US SECTION ---
                  const Text(
                    "About Us",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade200),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade100,
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Text(
                            "High Court Employees Welfare Association is committed to the welfare and well-being of all employees working in the Punjab & Haryana High Court.",
                            style: TextStyle(fontSize: 13, color: Colors.black87, height: 1.4),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Icon(Icons.gavel, size: 40, color: Colors.brown.shade700),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // ==========================================
      // BOTTOM NAVIGATION BAR
      // ==========================================
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primaryNavy,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Directory"),
          BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: "Welfare"),
          BottomNavigationBarItem(icon: Icon(Icons.image_outlined), label: "Gallery"),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: "More"),
        ],
      ),
    );
  }

  // --- HELPER WIDGETS ---

  /// Helper to build the Official Portrait Cards at the top
  Widget _buildOfficialCard({
    required String imageUrl,
    required String name,
    required String title,
    required String subtitle,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          // Photo area
          Container(
            height: 120,
            width: double.infinity,
            color: Colors.grey.shade200,
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.person, size: 50, color: Colors.grey),
            ),
          ),
          // Deep blue text area below photo
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            color: const Color(0xFF001C44),
            child: Column(
              children: [
                Text(
                  name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
                ),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white70, fontSize: 10),
                ),
                Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white70, fontSize: 9),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Helper to build the Quick Link items with pastel background icons
  Widget _buildQuickLink({
    required IconData icon,
    required Color iconColor,
    required Color bgColor,
    required String label,
  }) {
    return Expanded(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: iconColor, size: 28),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}