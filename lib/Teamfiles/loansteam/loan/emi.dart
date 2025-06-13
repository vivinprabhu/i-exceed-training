import 'package:flutter/material.dart';
import 'dart:math';

// Colors used in your design
class AppColors {
  static const pureWhite = Color.fromARGB(255, 255, 255, 255);
  static const mutedGrayPeach = Color.fromARGB(253, 205, 213, 214);
  static const navyBlueDark = Color.fromARGB(255, 20, 40, 80);
  static const navyBlue = Color.fromARGB(255, 30, 60, 100);
}

class EMICalculatorPage extends StatefulWidget {
  const EMICalculatorPage({super.key});

  @override
  State<EMICalculatorPage> createState() => _EMICalculatorPageState();
}

class _EMICalculatorPageState extends State<EMICalculatorPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _principalController = TextEditingController();
  final TextEditingController _rateController = TextEditingController();
  final TextEditingController _tenureController = TextEditingController();

  double? _emi;

  void _calculateEMI() {
    if (_formKey.currentState!.validate()) {
      final principal = double.parse(_principalController.text);
      final annualRate = double.parse(_rateController.text);
      final tenureMonths = int.parse(_tenureController.text);

      final monthlyRate = annualRate / (12 * 100);

      final emi = (principal * monthlyRate * pow(1 + monthlyRate, tenureMonths)) /
          (pow(1 + monthlyRate, tenureMonths) - 1);

      setState(() {
        _emi = emi;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EMI Calculator'),
        centerTitle: true,
        backgroundColor: AppColors.navyBlue,
        foregroundColor: Colors.white,
      ),
      backgroundColor: AppColors.pureWhite,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
            child: Form(
              key: _formKey,
              child: Column(

                children: [
                  const Text(
                    'Calculate your monthly EMI based on the loan amount, interest rate, and tenure.',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.navyBlueDark,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),

                  // Principal
                  _buildTextField(
                    controller: _principalController,
                    label: 'Loan Amount (₹)',
                    icon: Icons.account_balance_wallet,
                    keyboardType: TextInputType.number,
                    validator: (String? val) {
                      if (val == null || val.isEmpty) return 'Please enter loan amount';
                      if (double.tryParse(val) == null) return 'Enter a valid number';
                      return null;
                    },
                  ),

                  // Interest Rate
                  _buildTextField(
                    controller: _rateController,
                    label: 'Annual Interest Rate (%)',
                    icon: Icons.percent,
                    keyboardType: TextInputType.number,
                    validator: (String? val) {
                      if (val == null || val.isEmpty) return 'Please enter interest rate';
                      if (double.tryParse(val) == null) return 'Enter a valid number';
                      return null;
                    },
                  ),

                  // Tenure
                  _buildTextField(
                    controller: _tenureController,
                    label: 'Loan Tenure (in months)',
                    icon: Icons.calendar_month,
                    keyboardType: TextInputType.number,
                    validator: (String? val) {
                      if (val == null || val.isEmpty) return 'Please enter loan tenure';
                      if (int.tryParse(val) == null) return 'Enter a valid number';
                      return null;
                    },
                  ),

                  const SizedBox(height: 24),

                  // Button
                  SizedBox(
                    width: 180,
                    child: ElevatedButton.icon(
                      onPressed: _calculateEMI,
                      icon: const Icon(Icons.calculate, size: 18),
                      label: const Text('Calculate EMI'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.navyBlue,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  if (_emi != null)
                    Text(
                      'Your EMI is: ₹${_emi!.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.navyBlueDark,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    required TextInputType keyboardType,
    required String? Function(String?) validator,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        validator: validator,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: AppColors.navyBlue),
          filled: true,
          fillColor: AppColors.mutedGrayPeach,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
