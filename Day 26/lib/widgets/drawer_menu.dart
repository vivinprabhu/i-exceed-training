// import 'package:bank_ui/Teamfiles/supportteam/CustomerService/mainCustomerService.dart';
// import 'package:bank_ui/Teamfiles/supportteam/CustomerService/pages/customer_services_page.dart';
import 'package:bank_ui/main.dart';
import 'package:flutter/material.dart';
import '../screens/catcardspages.dart';

class DrawerMenu extends StatelessWidget {
  final VoidCallback toggleTheme;

  const DrawerMenu({super.key, required this.toggleTheme});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Drawer(
      backgroundColor: theme.scaffoldBackgroundColor,
      child: ListView(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(
                  255,
                  30,
                  60,
                  100,
                ), // use theme primary color
              ),
              accountName: const Text("Profile"),
              accountEmail: const Text("Welcome name"),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage('assets/avatar.jpg'),
              ),
            ),
          ),

          // Quick Actions (QR + History)
          Container(
            color: theme.cardColor,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildActionButton(
                  context,
                  icon: Icons.qr_code_scanner,
                  label: "QR codes and\nUPI IDs",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const UpiPaymentsScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(width: 12),
                _buildActionButton(
                  context,
                  icon: Icons.history,
                  label: "Manage\n payments",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const SendMoneyScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),

          const Divider(),

          _buildDrawerTile(
            icon: Icons.autorenew_rounded,
            label: "Autopay",
            context: context,
            onTap: () => Navigator.pushNamed(context, '/support'),
          ),
          _buildDrawerTile(
            icon: Icons.payment,
            label: "Bill Notifications",
            context: context,
            onTap: () => Navigator.pushNamed(context, '/support'),
          ),
          _buildDrawerTile(
            icon: Icons.language,
            label: "Languages",
            context: context,
            onTap: () => Navigator.pushNamed(context, '/support'),
          ),
          _buildDrawerTile(
            icon: Icons.support_agent,
            label: "Support",
            context: context,
            onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MyBankingApp(),
                      ),
                    ),
          ),
          _buildDrawerTile(
            icon: Icons.phone,
            label: "Customer Care",
            context: context,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Call: 1800-123-456')),
              );
            },
          ),
          const Divider(),
          _buildDrawerTile(
            icon: Icons.brightness_6,
            label: "Toggle Theme",
            context: context,
            onTap: toggleTheme,
          ),
          _buildDrawerTile(
            icon: Icons.logout,
            label: "Logout",
            context: context,
            onTap: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onPressed, // <-- added
  }) {
    final theme = Theme.of(context);
    final textColor = theme.textTheme.bodyLarge?.color ?? Colors.black;

    return ElevatedButton(
      onPressed: onPressed, // <-- updated this line
      style: ElevatedButton.styleFrom(
        backgroundColor: theme.cardColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: textColor, size: 30),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerTile({
    required IconData icon,
    required String label,
    required BuildContext context,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);
    final textColor = theme.textTheme.bodyLarge?.color ?? Colors.black;

    return ListTile(
      leading: Icon(icon, color: textColor),
      title: Text(
        label,
        style: TextStyle(color: textColor, fontWeight: FontWeight.w600),
      ),
      onTap: onTap,
    );
  }
}
