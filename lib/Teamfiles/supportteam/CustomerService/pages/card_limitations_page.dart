import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class CardLimitationsPage extends StatefulWidget {
  @override
  _CardLimitationsPageState createState() => _CardLimitationsPageState();
}

class _CardLimitationsPageState extends State<CardLimitationsPage> {
  bool atmUsage = true;
  bool onlineUsage = true;
  double dailyLimit = 20000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pureWhite,
      appBar: AppBar(
        title: const Text("Set Card Limitations"),
        backgroundColor: AppColors.navyBlue,
        foregroundColor: AppColors.pureWhite,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            buildGradientCard(
              Column(
                children: [
                  SwitchListTile(
                    title: const Text("ATM Usage", style: TextStyle(color: AppColors.navyBlueDark)),
                    subtitle: const Text("Enable/disable ATM withdrawals", style: TextStyle(color: AppColors.navyBlueDark)),
                    value: atmUsage,
                    onChanged: (val) => setState(() => atmUsage = val),
                  ),
                  SwitchListTile(
                    title: const Text("Online Payments", style: TextStyle(color: AppColors.navyBlueDark)),
                    subtitle: const Text("Enable/disable online transactions", style: TextStyle(color: AppColors.navyBlueDark)),
                    value: onlineUsage,
                    onChanged: (val) => setState(() => onlineUsage = val),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            buildGradientCard(
              Column(
                children: [
                  Text("Daily Limit: ₹${dailyLimit.toInt()}",
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.navyBlueDark)),
                  const SizedBox(height: 10),
                  Slider(
                    value: dailyLimit,
                    min: 1000,
                    max: 100000,
                    divisions: 20,
                    label: dailyLimit.toInt().toString(),
                    onChanged: (val) => setState(() => dailyLimit = val),
                  ),
                  const Text("₹1,000 - ₹1,00,000", style: TextStyle(color: AppColors.navyBlueDark)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.navyBlue,
                foregroundColor: AppColors.pureWhite,
              ),
              icon: const Icon(Icons.save),
              label: const Text("Save Changes"),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Card limits updated successfully.")),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Widget buildGradientCard(Widget child) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.softBlueGray, AppColors.mutedGrayPeach],
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Card(
        color: Colors.transparent,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: child,
        ),
      ),
    );
  }
}