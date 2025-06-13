// account_page.dart
import 'package:flutter/material.dart';
import './transactions_history.dart';
import 'transaction_analysis.dart';

void main() {
  runApp(AccountOverviewApp());
}

class AccountOverviewApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AccountPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.pureWhite,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.navyBlue,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
        ),
      ),
    );
  }
}

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final String accountNumber = "123456789012";
  final String branchName = "MG Road Branch";
  final String accountHolder = "Dharshini V";
  final double balance = 54239.75;

  bool isBalanceVisible = false; // initial state - hidden

  String getMaskedAccount() {
    return "XXXXXX" + accountNumber.substring(accountNumber.length - 4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Account",style: TextStyle(color: AppColors.pureWhite)), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Column(
          children: [
            // Account Card
            Container(
              margin: const EdgeInsets.only(bottom: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 230, 235, 245),
                    AppColors.mutedGrayPeach,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 15,
                    offset: Offset(4, 8),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Holder Name + Icon
                    Row(
                      children: [
                        const Icon(
                          Icons.account_circle,
                          color: AppColors.navyBlueDark,
                          size: 32,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          accountHolder,
                          style: const TextStyle(
                            color: AppColors.navyBlueDark,
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),

                    // Available Balance Label + Eye Icon
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Available Balance",
                          style: TextStyle(
                            color: AppColors.navyBlueDark,
                            fontSize: 16,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            isBalanceVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: AppColors.navyBlueDark,
                          ),
                          onPressed: () {
                            setState(() {
                              isBalanceVisible = !isBalanceVisible;
                            });
                          },
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    // Balance Value or Hidden Text
                    Text(
                      isBalanceVisible
                          ? "₹ ${balance.toStringAsFixed(2)}"
                          : "********",
                      style: const TextStyle(
                        color: AppColors.navyBlueDark,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),

                    const SizedBox(height: 35),

                    // Account Number & Branch
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "A/C Number",
                              style: TextStyle(
                                color: AppColors.navyBlueDark,
                                fontSize: 14,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              getMaskedAccount(),
                              style: const TextStyle(
                                color: AppColors.navyBlueDark,
                                fontSize: 16,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              "Branch",
                              style: TextStyle(
                                color: AppColors.navyBlueDark,
                                fontSize: 14,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              branchName,
                              style: const TextStyle(
                                color: AppColors.navyBlueDark,
                                fontSize: 16,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Buttons
            buildStylishButton(
              context,
              label: "View Transaction History",
              icon: Icons.receipt_long,
              color: AppColors.navyBlue,
              targetPage: const TransactionPage(),
            ),
            const SizedBox(height: 20),
            buildStylishButton(
              context,
              label: "Expenses Analysis",
              icon: Icons.bar_chart,
              color: AppColors.navyBlueDark,
              targetPage: const TransactionAnalysisPage(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildStylishButton(
    BuildContext context, {
    required String label,
    required IconData icon,
    required Color color,
    required Widget targetPage,
  }) {
    return ElevatedButton.icon(
      icon: Icon(icon, size: 24),
      label: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => targetPage));
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: color,
        minimumSize: const Size(double.infinity, 55),
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        shadowColor: Colors.black45,
      ),
    );
  }
}

class AppColors {
  static const pureWhite = Color.fromARGB(255, 255, 255, 255);
  static const softBlueGray = Color.fromARGB(255, 241, 246, 248);
  static const mutedGrayPeach = Color.fromARGB(253, 205, 213, 214);
  static const navyBlueDark = Color.fromARGB(255, 20, 40, 80);
  static const navyBlue = Color.fromARGB(255, 30, 60, 100);
}
