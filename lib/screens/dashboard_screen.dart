import 'package:ball_park/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dashboard_tabs/events_tab.dart';
import 'dashboard_tabs/facilities_tab.dart';
import 'dashboard_tabs/groups_tab.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>(); // Define a global key

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Assign the key to the Scaffold
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Container(
            width: 36, // Width of the circle
            height: 36, // Height of the circle
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white, // Border color
                width: 2.0, // Border thickness
              ),
            ),
            child: const Icon(
              Icons.person_2_outlined,
              color: Colors.white,
            ),
          ),
          onPressed: () {
            _scaffoldKey.currentState
                ?.openDrawer(); // Use the key to open the drawer
          },
        ),
        title: Text(
          'Ballpark_logo',
          style: GoogleFonts.lato(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.chat_bubble_rounded,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.amber,
          labelColor: Colors.amber,
          unselectedLabelColor: Colors.grey.shade400,
          dividerColor: Colors.grey.shade800,
          tabs: const [
            Tab(icon: Icon(Icons.event), text: "Events"),
            Tab(icon: Icon(Icons.group), text: "Groups"),
            Tab(icon: Icon(Icons.place), text: "Facilities"),
          ],
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: customBlack, // Set the background color of the drawer
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  color: customBlack,
                  child: SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 8),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey,
                                width: 2.0,
                              ),
                            ),
                          ),
                          child: ElevatedButton.icon(
                            onPressed: () {
                              // Handle login/signup
                            },
                            icon: const Icon(Icons.person),
                            label: const Text(
                              'Log in / Sign up',
                              style: TextStyle(
                                color: customBlack,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.amber,
                              textStyle: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color:
                        customBlack, // Set the background color of the drawer
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ListView(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          children: [
                            _buildDrawerItem(
                              icon: Icons.qr_code_scanner,
                              title: 'Scan',
                              onTap: () {
                                // Handle Scan
                              },
                            ),
                            _buildDrawerItem(
                              icon: Icons.card_giftcard,
                              title: 'Promo',
                              onTap: () {
                                // Handle Promo
                              },
                            ),
                            _buildDrawerItem(
                              icon: Icons.history,
                              title: 'History',
                              onTap: () {
                                // Handle History
                              },
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const Divider(color: Colors.white), // Divider color
                            _buildDrawerItem(
                              icon: Icons.info,
                              title: 'Terms and conditions',
                              onTap: () {
                                // Handle Terms and conditions
                              },
                            ),
                            _buildDrawerItem(
                              icon: Icons.info,
                              title: 'About',
                              onTap: () {
                                // Handle About
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          EventsTab(),
          GroupsTab(),
          FacilitiesTab(),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.white70),
      title: Text(
        title,
        style: GoogleFonts.lato(
            fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white70),
      ),
      onTap: onTap,
      dense: true,
      tileColor: const Color.fromARGB(255, 240, 240, 240),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}
