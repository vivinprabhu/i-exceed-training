import 'package:flutter/material.dart';
import 'colors.dart';

class AlertsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.mail_outline, size: 80, color: Colors.grey),
          SizedBox(height: 20),
          Text(
            "All caught up!",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: AppColors.navyBlueDark,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "You don’t have any alerts at the moment.",
            style: TextStyle(color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}
