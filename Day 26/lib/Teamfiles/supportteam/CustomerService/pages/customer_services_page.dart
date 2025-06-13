import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/helpers.dart';

class CustomerServicesPage extends StatelessWidget {
  const CustomerServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ServiceItem> services = [
      // Profile and Settings
      const ServiceItem(section: "Profile and Settings", label: "Update Personal Details", icon: Icons.person, route: '/update-profile'),
      const ServiceItem(section: "Profile and Settings", label: "Settings", icon: Icons.settings, route: '/settings'),

      // Card Services
      const ServiceItem(section: "Card Services", label: "Block Card", icon: Icons.block, route: '/block-card'),
      const ServiceItem(section: "Card Services", label: "Request New Card", icon: Icons.credit_card, route: '/request-card'),
      const ServiceItem(section: "Card Services", label: "Set Card Limits", icon: Icons.tune, route: '/set-limits'),

      // Support
      const ServiceItem(section: "Support", label: "Contact Us", icon: Icons.support_agent, route: '/contact-us'),
      const ServiceItem(section: "Support", label: "Raise a Complaint", icon: Icons.report_problem, route: '/raise-complaint'),
    ];

    final grouped = <String, List<ServiceItem>>{};
    for (var item in services) {
      grouped.putIfAbsent(item.section, () => []).add(item);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Customer Services"),
        centerTitle: true,
        backgroundColor: AppColors.navyBlue,
        foregroundColor: Colors.white,
      ),
      backgroundColor: AppColors.pureWhite,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: grouped.entries.map((entry) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Plain sector title (no box)
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 16),
                child: Text(
                  entry.key,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.navyBlueDark,
                  ),
                ),
              ),

              // Cards with gradient background
              ...entry.value.map((item) => Container(
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
                  leading: CircleAvatar(
                    backgroundColor: AppColors.navyBlue,
                    child: Icon(item.icon, color: Colors.white, size: 20),
                  ),
                  title: Text(
                    item.label,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColors.navyBlueDark,
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.navyBlueDark),
                  onTap: () {
                    if (item.route != null) {
                      Navigator.pushNamed(context, item.route!);
                    } else if (item.onTap != null) {
                      item.onTap!();
                    }
                  },
                ),
              )),
              const SizedBox(height: 16),
            ],
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/faq');
        },
        backgroundColor: AppColors.navyBlue,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.help_outline),
        label: const Text("FAQ"),
        heroTag: "faq_button",
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}