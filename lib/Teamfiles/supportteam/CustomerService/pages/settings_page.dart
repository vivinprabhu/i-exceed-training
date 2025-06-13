import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class YonoSettingsPage extends StatelessWidget {
  const YonoSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_SettingItem> items = [
      _SettingItem(
        icon: Icons.lock,
        title: "Change PIN",
        subtitle: "Update your security PIN",
        route: '/change-pin',
      ),
      _SettingItem(
        icon: Icons.password,
        title: "Update Password",
        subtitle: "Change your login password",
        route: '/update-password',
      ),
      _SettingItem(
        icon: Icons.notifications,
        title: "Notification Preferences",
        subtitle: "Manage your SMS alerts and notifications",
        route: '/sms-alerts',
      ),
      _SettingItem(
        icon: Icons.language,
        title: "Language",
        subtitle: "Choose your preferred language",
        route: '/language-settings',
      ),
      _SettingItem(
        icon: Icons.privacy_tip,
        title: "Privacy & Security",
        subtitle: "Manage your privacy settings",
        route: '/privacy-security',
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.pureWhite,
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: AppColors.navyBlue,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.softBlueGray, AppColors.mutedGrayPeach],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 6,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ListTile(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              leading: Icon(item.icon, color: AppColors.navyBlueDark),
              title: Text(
                item.title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColors.navyBlueDark,
                ),
              ),
              subtitle: Text(
                item.subtitle,
                style: const TextStyle(
                  color: AppColors.navyBlueDark,
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.navyBlueDark),
              onTap: () {
                Navigator.pushNamed(context, item.route);
              },
            ),
          );
        },
      ),
    );
  }
}

class _SettingItem {
  final IconData icon;
  final String title;
  final String subtitle;
  final String route;

  _SettingItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.route,
  });
}