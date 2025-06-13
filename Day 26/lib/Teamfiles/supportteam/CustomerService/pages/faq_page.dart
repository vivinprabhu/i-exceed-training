import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class FAQPage extends StatelessWidget {
  const FAQPage({super.key});

  final List<Map<String, String>> faqData = const [
    {
      'question': 'How do I log in to the banking app?',
      'answer': 'Use registered mobile number and OTP or your username/password. Biometric login is also supported.'
    },
    {
      'question': 'What should I do if I forget my password?',
      'answer': 'Click "Forgot Password" on login screen and follow the reset steps.'
    },
    {
      'question': 'Can I use the app on multiple devices?',
      'answer': 'Yes. Authenticate each device with OTP for security.'
    },
    {
      'question': 'How can I view my account balance?',
      'answer': 'Go to "Accounts" tab for balance and transaction history.'
    },
    {
      'question': 'How do I transfer money?',
      'answer': 'Go to "Transfers", select beneficiary, enter amount and confirm with OTP.'
    },
    {
      'question': 'How do I block my card if it\'s lost or stolen?',
      'answer': 'Go to Card Services > Block Debit Card, select your card type, enter details and submit the request.'
    },
    {
      'question': 'Can I set spending limits on my card?',
      'answer': 'Yes, go to Card Services > Set Card Limits to customize your daily spending and withdrawal limits.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.navyBlue,
      appBar: AppBar(
        title: const Text("Frequently Asked Questions"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: faqData.length,
              itemBuilder: (context, index) {
                return Card(
                  color: AppColors.softBlueGray,
                  margin: const EdgeInsets.all(8),
                  child: ExpansionTile(
                    iconColor: Colors.black,
                    collapsedIconColor: Colors.black,
                    title: Text(
                      faqData[index]['question']!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'serif',
                      ),
                    ),
                    children: [
                      Container(
                        color: AppColors.mutedGrayPeach,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        child: Text(
                          faqData[index]['answer']!,
                          style: const TextStyle(fontSize: 16, color: Colors.black87),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton.icon(
              icon: const Icon(Icons.arrow_back),
              label: const Text("Back"),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }
}