import 'package:flutter/material.dart';
import 'colors.dart';

class QrScannerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Scanning QR Code...",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.navyBlueDark,
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 250,
            width: 250,
            decoration: BoxDecoration(
              color: AppColors.softBlueGray,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.navyBlueDark),
            ),
            child: Image.asset(
              'assets/qrcode/qrcode.png',
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Align the QR inside the box",
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}
