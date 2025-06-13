import 'package:flutter/material.dart';
import 'app_colors.dart';

// Helper function for card decoration
BoxDecoration getCardBoxDecoration() {
  return BoxDecoration(
    gradient: const LinearGradient(
      colors: [AppColors.softBlueGray, AppColors.mutedGrayPeach],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    borderRadius: BorderRadius.circular(20),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        blurRadius: 12,
        offset: const Offset(0, 6),
      ),
    ],
  );
}

// Service Item Model
class ServiceItem {
  final String section;
  final String label;
  final IconData icon;
  final String? route;
  final VoidCallback? onTap;

  const ServiceItem({
    required this.section,
    required this.label,
    required this.icon,
    this.route,
    this.onTap,
  });
}