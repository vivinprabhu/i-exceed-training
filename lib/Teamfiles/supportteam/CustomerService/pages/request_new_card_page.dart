import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class RequestNewCardPage extends StatefulWidget {
  @override
  _RequestNewCardPageState createState() => _RequestNewCardPageState();
}

class _RequestNewCardPageState extends State<RequestNewCardPage> {
  String _selectedCardType = 'Debit Card';
  bool _internationalUsage = false;
  bool _setLimit = false;
  double _limitAmount = 25000;
  String _deliveryOption = 'Home Delivery';

  final cardTypes = ['Debit Card', 'Credit Card', 'Prepaid Card'];
  final deliveryOptions = ['Home Delivery', 'Branch Pickup'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pureWhite,
      appBar: AppBar(
        title: const Text("Request New Card"),
        backgroundColor: AppColors.navyBlue,
        foregroundColor: AppColors.pureWhite,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          buildGradientCard("Card Type", DropdownButton<String>(
            value: _selectedCardType,
            isExpanded: true,
            items: cardTypes.map((e) => DropdownMenuItem(value: e, child: Text(e, style: const TextStyle(color: AppColors.navyBlueDark)))).toList(),
            onChanged: (val) => setState(() => _selectedCardType = val!),
          )),
          buildGradientCard("Delivery Option", Column(
            children: deliveryOptions.map((e) => RadioListTile(
              title: Text(e, style: const TextStyle(color: AppColors.navyBlueDark)),
              value: e,
              groupValue: _deliveryOption,
              onChanged: (val) => setState(() => _deliveryOption = val!),
            )).toList(),
          )),
          buildGradientCard(null, SwitchListTile(
            title: const Text("Enable International Usage", style: TextStyle(color: AppColors.navyBlueDark)),
            value: _internationalUsage,
            onChanged: (val) => setState(() => _internationalUsage = val),
          )),
          buildGradientCard(null, SwitchListTile(
            title: const Text("Set Card Limit", style: TextStyle(color: AppColors.navyBlueDark)),
            value: _setLimit,
            onChanged: (val) => setState(() => _setLimit = val),
          )),
          if (_setLimit)
            buildGradientCard("Limit: ₹${_limitAmount.toInt()}", Slider(
              value: _limitAmount,
              min: 1000,
              max: 100000,
              divisions: 20,
              label: _limitAmount.toInt().toString(),
              onChanged: (val) => setState(() => _limitAmount = val),
            )),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.navyBlue,
              foregroundColor: AppColors.pureWhite,
            ),
            icon: const Icon(Icons.send),
            label: const Text("Submit Request"),
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text("Request Submitted", style: TextStyle(color: AppColors.navyBlueDark)),
                  content: const Text("Your new card request has been submitted successfully.",
                      style: TextStyle(color: AppColors.navyBlueDark)),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("OK", style: TextStyle(color: AppColors.navyBlue)),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildGradientCard(String? title, Widget child) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.softBlueGray, AppColors.mutedGrayPeach],
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Card(
        color: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (title != null)
                Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.navyBlueDark)),
              if (title != null) const SizedBox(height: 8),
              child,
            ],
          ),
        ),
      ),
    );
  }
}