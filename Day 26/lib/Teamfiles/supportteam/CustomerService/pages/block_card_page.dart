import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import '../utils/app_colors.dart';
import '../utils/helpers.dart';
import 'card_blocked_confirmation_page.dart';

class BlockDebitCardPage extends StatefulWidget {
  const BlockDebitCardPage({super.key});

  @override
  State<BlockDebitCardPage> createState() => _BlockDebitCardPageState();
}

class _BlockDebitCardPageState extends State<BlockDebitCardPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController reasonController = TextEditingController();

  String selectedCardType = 'Debit';
  final List<String> cardTypes = ['Debit', 'Credit', 'Prepaid', 'Virtual'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Block Card"),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.navyBlueDark,
        elevation: 1,
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Card Details",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: AppColors.navyBlueDark,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Container(
                          decoration: getCardBoxDecoration(),
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: const [
                                  CircleAvatar(
                                    backgroundColor: AppColors.navyBlue,
                                    radius: 24,
                                    child: Icon(FontAwesomeIcons.solidCreditCard,
                                        color: Colors.white, size: 20),
                                  ),
                                  SizedBox(width: 14),
                                  Expanded(
                                    child: Text(
                                      "Secure Card Blocking",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.navyBlueDark,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 25),
                              buildDropdownField(),
                              const SizedBox(height: 24),
                              buildCardNumberField(),
                              const SizedBox(height: 24),
                              buildReasonField(),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                        Center(
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 14),
                                backgroundColor: AppColors.navyBlueDark,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              onPressed: onBlockPressed,
                              icon: const Icon(Icons.block),
                              label: const Text(
                                "Block Card",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildDropdownField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Card Type",
            style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.navyBlueDark)),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: selectedCardType,
          dropdownColor: Colors.white,
          items: cardTypes.map((String type) {
            return DropdownMenuItem<String>(
              value: type,
              child: Text(type),
            );
          }).toList(),
          onChanged: (value) {
            setState(() => selectedCardType = value!);
          },
          decoration: InputDecoration(
            prefixIcon: const Icon(FontAwesomeIcons.idCard),
            labelText: "Select card type",
            labelStyle: const TextStyle(color: AppColors.navyBlue),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.navyBlue),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildCardNumberField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Card Number",
            style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.navyBlueDark)),
        const SizedBox(height: 8),
        TextFormField(
          controller: cardNumberController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            prefixIcon: const Icon(FontAwesomeIcons.creditCard),
            labelText: "Enter card number",
            labelStyle: const TextStyle(color: AppColors.navyBlue),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.navyBlue),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) return "Card number is required";
            if (value.length != 16) return "Card number must be 16 digits";
            if (!RegExp(r'^[0-9]+$').hasMatch(value)) return "Only digits allowed";
            return null;
          },
        ),
      ],
    );
  }

  Widget buildReasonField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Reason for Blocking",
            style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.navyBlueDark)),
        const SizedBox(height: 8),
        TextFormField(
          controller: reasonController,
          maxLines: 4,
          decoration: InputDecoration(
            prefixIcon: const Icon(FontAwesomeIcons.exclamationTriangle, color: Colors.orange),
            labelText: "Briefly explain your reason",
            labelStyle: const TextStyle(color: AppColors.navyBlue),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.navyBlue),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) return "Reason is required";
            return null;
          },
        ),
      ],
    );
  }

  void onBlockPressed() {
    if (_formKey.currentState!.validate()) {
      final now = DateTime.now();
      final formattedDate = DateFormat('yyyy-MM-dd – HH:mm:ss').format(now);
      final last4 = cardNumberController.text.substring(cardNumberController.text.length - 4);
      final reason = reasonController.text;
      final reference = "REF${now.millisecondsSinceEpoch.toString().substring(7)}";

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Your card has been blocked successfully.")),
      );

      Future.delayed(const Duration(seconds: 1), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => CardBlockedConfirmationPage(
              last4Digits: last4,
              reason: reason,
              dateTime: formattedDate,
              referenceNumber: reference,
              cardType: selectedCardType,
            ),
          ),
        );
      });
    }
  }
}
