import 'package:flutter/material.dart';
import 'loan_application_form.dart';
// Define your color palette
class AppColors {
  static const pureWhite = Color.fromARGB(255, 255, 255, 255);
  static const softBlueGray = Color.fromARGB(255, 241, 246, 248);
  static const mutedGrayPeach = Color.fromARGB(253, 205, 213, 214);
  static const navyBlueDark = Color.fromARGB(255, 20, 40, 80);
  static const navyBlue = Color.fromARGB(255, 30, 60, 100);
}
class LoanDetailPage extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final String eligibility;
  final String terms;

  const LoanDetailPage({
    Key? key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.eligibility,
    required this.terms,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: AppColors.navyBlue, // Use navyBlue for AppBar
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Centered image with rounded corners and shadow
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 4),

                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    imagePath,
                    height: 400,
                    width: 900,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),

            // Eligibility Criteria heading
            Text(
              'Eligibility Criteria',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.navyBlueDark, // Use navyBlueDark for text color
              ),
            ),
            const SizedBox(height: 20),

            // Eligibility box
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.softBlueGray, // Use softBlueGray for box color
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppColors.softBlueGray),
              ),
              child: Text(
                eligibility,
                style: const TextStyle(fontSize: 16, height: 1.6, color: AppColors.navyBlueDark), // Use navyBlueDark for text color
              ),
            ),
            const SizedBox(height: 20),

            // Terms & Conditions heading
            Text(
              'Terms and Conditions',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.navyBlueDark, // Use navyBlueDark for text color
              ),
            ),
            const SizedBox(height: 20),

            // Terms & Conditions box
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.softBlueGray, // Use softBlueGray for box color
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppColors.softBlueGray),
              ),
              child: Text(
                terms,
                style: const TextStyle(fontSize: 16, height: 1.6, color: AppColors.navyBlueDark), // Use navyBlueDark for text color
              ),
            ),
            const SizedBox(height: 40),

            // Apply Now button
            Center(
              child: SizedBox(
                width: 200,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => LoanApplicationForm(loanType: title),
                      ),
                    );
                  },
                  icon: const Icon(Icons.arrow_forward_rounded),
                  label: const Text(
                    "Apply Now",
                    style: TextStyle(fontSize: 16),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.navyBlue, // Use navyBlue for button background
                    foregroundColor: AppColors.pureWhite, // Use pureWhite for button text
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
