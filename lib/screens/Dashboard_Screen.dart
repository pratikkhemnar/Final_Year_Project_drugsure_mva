import 'package:drugsure/screens/Login_Screen.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DrugSure Dashboard"),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome to DrugSure",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _dashboardCard(Icons.qr_code_scanner, "Scan Medicine", Colors.green, () {
                  // Navigate to scanner
                }),
                _dashboardCard(Icons.search, "Search Medicine", Colors.blue, () {
                  // Navigate to search
                }),
                _dashboardCard(Icons.warning, "Report Counterfeit", Colors.orange, () {
                  // Navigate to report screen
                }),
                _dashboardCard(Icons.info, "Learn", Colors.purple, () {
                  // Navigate to learning section
                }),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              "Latest Alerts",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 10),
            Container(
              height: 120,
              decoration: BoxDecoration(
                color: Colors.teal.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  const Icon(Icons.warning_amber, size: 40, color: Colors.red),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      "Beware: Fake medicine batches found in Mumbai region. Check before purchase.",
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                  )
                ],
              ),
            ),
            ElevatedButton(onPressed:(){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
            }, child: Text("LogOut"))
          ],
        ),
      ),
    );
  }

  Widget _dashboardCard(IconData icon, String label, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: color),
            const SizedBox(height: 10),
            Text(label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: color)),
          ],
        ),
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const DrawerHeader(
            child: Text("Welcome!", style: TextStyle(fontSize: 24)),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
            child: const Text("Logout"),
          ),
        ],
      ),
    );
  }
}
