import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'loan_detail_page.dart';

class LoanPage extends StatelessWidget {
  final List<Map<String, dynamic>> loanTypes = [
    {
      'title': 'Personal Loan',
      'description': 'Quick loans for personal needs.',
      'icon': Icons.person,
      'image': 'assets/loans/personal.jpg',
      'eligibility':
          "•  Age: Between 21 to 60 years at the time of loan maturity.\n"
          "•  Income: Minimum ₹15,000/month for salaried or ₹25,000/month for self-employed individuals.\n"
          "•  Employment:\n"
          "        -> Salaried: Minimum 6 months in current job.\n"
          "        -> Self-Employed: Minimum 2 years of business continuity.\n"
          "•  Credit Score: 700+ preferred (CIBIL or equivalent).\n"
          "•  Nationality: Must be a resident Indian citizen.\n"
          "•  Mobile Number: Must be linked to Aadhaar for verification.\n"
          "•  Bank Account: Should have a savings account in your name.\n",

      'terms':
          "•  Interest Rate: Ranges between 10% to 24% per annum, based on eligibility.\n"
          "•  Processing Fee: 1% to 3% of the loan amount may be charged upfront.\n"
          "•  Prepayment Charges: May apply if loan is closed before tenure (0%–4% based on lender).\n"
          "•  Loan Tenure: Minimum 12 months and up to 60 months.\n"
          "•  Disbursal Time: Loan is usually disbursed within 1–2 working days after approval.\n"
          "•  Penalty on Late EMI: 2% per month on the overdue EMI amount.\n"
          "• Document Requirements:\n"
          "        -> PAN Card\n        -> Aadhaar\n"
          "•  Recent Salary Slips or ITR (for self-employed)\n"
          "•  Bank Statements for last 3–6 months\n"
          "•  Loan Usage: The loan should be used for personal use only — not for speculative or illegal activities.\n",
    },
    {
      'title': 'Home Loan',
      'description': 'Affordable loans for your dream home.',
      'icon': Icons.house,
      'image': 'assets/loans/home.png',
      'eligibility':
          "•  Age: Between 21 to 65 years at the time of loan maturity.\n"
          "•  Income: Minimum ₹25,000/month for salaried or ₹3,00,000 annual income for self-employed individuals.\n"
          "•  Employment:\n"
          "        -> Salaried: Minimum 1 year of continuous employment.\n"
          "        -> Self-Employed: Minimum 3 years of business continuity with proper documentation.\n"
          "•  Credit Score: 700+ preferred (CIBIL or equivalent) with a good repayment history.\n"
          "•  Nationality: Must be a resident Indian citizen. NRIs may apply under specific schemes.\n"
          "•  Property Type: Property must be approved and have clear legal titles.\n"
          "•  Co-applicant: Optional, but helps increase loan eligibility if income is low.\n"
          "•  Loan Tenure: Up to 30 years, depending on applicant’s age and repayment capacity.\n"
          "•  Bank Account: Active savings account in applicant's name required.\n"
          "•  Mobile Number: Must be linked to Aadhaar for verification and e-KYC.\n",

      'terms':
          "•  Interest Rate: Typically ranges from 8% to 12% per annum, depending on credit profile.\n"
          "•  Processing Fee: Usually 0.5% to 1% of the loan amount plus applicable taxes.\n"
          "•  Prepayment Charges: Nil for floating rate loans; 2%–4% for fixed-rate loans in some cases.\n"
          "•  Loan Tenure: Up to 30 years based on borrower’s age and repayment capacity.\n"
          "•  Disbursal Time: 5–10 working days post document verification and legal checks.\n"
          "•  Penalty on Late EMI: 2% per month on the overdue EMI amount.\n"
          "•  Document Requirements:\n"
          "        -> PAN Card\n"
          "        -> Aadhaar\n"
          "        -> Income Proof (Salary Slips/ITR)\n"
          "        -> Property Papers with Clear Title\n"
          "        -> Bank Statements (last 6 months)\n"
          "•  Property Insurance: Mandatory throughout the loan tenure.\n"
          "•  Loan Usage: Strictly for purchase, construction, or renovation of a residential property.\n",
    },
    {
      'title': 'Car Loan',
      'description': 'Drive your dream car with easy EMI options.',
      'icon': Icons.directions_car,
      'image': 'assets/loans/car.png',
      'eligibility':
          "•  Age: Between 21 to 65 years at the time of loan maturity.\n"
          "•  Income: Minimum ₹15,000/month for salaried or ₹25,000/month for self-employed individuals.\n"
          "•  Employment:\n"
          "        -> Salaried: Minimum 1 year of total work experience with at least 6 months in current job.\n"
          "        -> Self-Employed: Minimum 2 years of stable business operations.\n"
          "•  Credit Score: 700+ preferred (CIBIL or equivalent) with no recent defaults.\n"
          "•  Nationality: Must be a resident Indian citizen.\n"
          "•  Mobile Number: Must be linked to Aadhaar for e-KYC verification.\n"
          "•  Bank Account: Active savings account in the applicant’s name required.\n"
          "•  Vehicle Type: Applicable for new or used cars up to 5 years old.\n"
          "•  Loan Amount: Up to 90–100% of the car's ex-showroom price (for new cars).\n",

      'terms':
          "•  Interest Rate: Generally ranges from 8.5% to 14% per annum, depending on vehicle type and credit score.\n"
          "•  Processing Fee: 0.5% to 2% of loan amount plus applicable taxes.\n"
          "•  Prepayment Charges: 0%–5% depending on bank policies and loan tenure.\n"
          "•  Loan Tenure: Up to 7 years depending on applicant profile and car type.\n"
          "•  Disbursal Time: Within 1–3 working days post-approval.\n"
          "•  Penalty on Late EMI: 2% per month on the overdue EMI amount.\n"
          "•  Document Requirements:\n"
          "        -> PAN Card\n"
          "        -> Aadhaar\n"
          "        -> Salary Slips or ITR (for self-employed)\n"
          "        -> Bank Statements (last 3–6 months)\n"
          "        -> Quotation/Invoice of the Car\n"
          "•  Vehicle Insurance: Comprehensive insurance is mandatory.\n"
          "•  Loan Usage: Applicable only for purchase of new or pre-approved used cars.\n",
    },
    {
      'title': 'Education Loan',
      'description': 'Support for your higher studies.',
      'icon': Icons.school,
      'image': 'assets/loans/education.jpg',
      'eligibility':
          "•  Age: Applicant must be between 18 to 35 years of age.\n"
          "•  Academic Qualification: Must have secured admission to a recognized institution in India or abroad.\n"
          "•  Course Type: Should be a professional, technical, or graduate/postgraduate course.\n"
          "•  Co-applicant: A parent, guardian, or spouse with a stable income is mandatory.\n"
          "•  Income:\n"
          "        -> No income requirement for the student.\n"
          "        -> Co-applicant should have a regular income source.\n"
          "•  Employment:\n"
          "        -> Co-applicant must be employed (salaried or self-employed) with verifiable income.\n"
          "•  Credit Score: 700+ preferred for co-applicant (CIBIL or equivalent).\n"
          "•  Nationality: Applicant must be an Indian citizen.\n"
          "•  Admission Proof: Confirmed admission letter from the educational institution is required.\n"
          "•  Collateral: May be required for loan amounts above ₹7.5 lakhs (varies by bank).\n"
          "•  Bank Account: Active savings account in the name of the co-applicant.\n",

      'terms':
          "•  The student must have secured confirmed admission to a recognized institution in India or abroad.\n"
          "•  The loan will cover tuition fees, exam fees, books, accommodation, and other related expenses.\n"
          "•  A co-applicant (parent/guardian) is mandatory and jointly responsible for loan repayment.\n"
          "•  Repayment begins after the course completion plus a grace/moratorium period of 6 to 12 months.\n"
          "•  Simple interest may be charged during the moratorium period.\n"
          "•  Loan sanction is subject to creditworthiness of the co-applicant and verification of documents.\n"
          "•  For loans above ₹7.5 lakhs, tangible collateral and margin money may be required.\n"
          "•  Interest rates are subject to change as per bank policies and RBI guidelines.\n"
          "•  The bank reserves the right to reject or approve any application without assigning reasons.\n"
          "•  Prepayment or foreclosure is allowed, and charges may apply as per bank norms.\n"
          "•  Loan disbursement is made directly to the educational institution in installments.\n"
          "•  The student must maintain good academic performance throughout the course.\n",
    },
    {
      'title': 'Gold Loan',
      'description': 'Instant funds by pledging your gold.',
      'icon': Icons.account_balance_wallet,
      'image': 'assets/loans/gold2.png',
      'eligibility':
          "•  Age: 18 to 70 years.\n"
          "•  Nationality: Must be an Indian citizen.\n"
          "•  Gold Purity: 18–24 karat gold only.\n"
          "•  Gold Type: Jewelry (not coins or bars beyond limits).\n"
          "•  No Income Proof Required: Loan is based on gold value.\n",
      'terms':
          "•  Loan Amount: Based on gold weight and market rate (up to 75% of value).\n"
          "•  Interest Rate: 9% to 18% per annum.\n"
          "•  Tenure: 3 to 24 months (can be renewed).\n"
          "•  Disbursal: Instant (within hours).\n"
          "•  Repayment: Bullet or EMI options available.\n"
          "•  Security: Gold is kept safely by the bank.\n"
          "•  Documents:\n        -> PAN or Aadhaar\n        -> Passport-size photo\n",
    },
    {
      'title': 'Agricultural Loan',
      'description': 'Empowering farmers with financial support.',
      'icon': Icons.agriculture,
      'image': 'assets/loans/agri.jpg',
      'eligibility':
          "•  Applicant: Must be a farmer or landowner.\n"
          "•  Age: 18 to 65 years.\n"
          "•  Purpose: For seeds, equipment, irrigation, etc.\n"
          "•  Land Ownership: Proof of farming land is required.\n"
          "•  KYC: Aadhaar, PAN, and land records mandatory.\n"
          "•  Bank Account: Active savings account in farmer’s name.\n",
      'terms':
          "•  Loan Amount: ₹10,000 to ₹10 lakhs (based on land size).\n"
          "•  Interest Rate: Subsidized rates starting from 4% per annum.\n"
          "•  Tenure: 6 months to 7 years depending on crop cycle or asset.\n"
          "•  Repayment: Linked to harvest period or seasonal income.\n"
          "•  Collateral: May be required for higher amounts.\n"
          "•  Documents:\n        -> Aadhaar, PAN, Land ownership papers\n"
          "        -> Proof of cultivation\n "
          "       -> Kisan Credit Card (if applicable)\n",
    },
  ];

  final List<String> carouselImages = [
    'assets/loans/c10.jpeg',
    'assets/loans/personal.jpg',
    'assets/loans/c5.png',
  ];

  @override
  Widget build(BuildContext context) {
    final isWideScreen = MediaQuery.of(context).size.width > 1000;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Loan Services'),
        backgroundColor: AppColors.navyBlue, // AppBar Color
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      backgroundColor: AppColors.pureWhite, // Background Color

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // 🔄 Carousel Section
            CarouselSlider(
              options: CarouselOptions(
                height: 300,

                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 0.9,
              ),
              items: carouselImages.map((imagePath) {
                return Builder(
                  builder: (context) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 40),

            // 🧾 Loan Cards Grid
            Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: isWideScreen ? 1400 : double.infinity,
                ),
                child: Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  alignment: WrapAlignment.center,
                  children: loanTypes.map((loan) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => LoanDetailPage(
                              title: loan['title'],
                              description: loan['description'],
                              imagePath: loan['image'],
                              eligibility: loan['eligibility'],
                              terms: loan['terms'],
                            ),
                          ),
                        );
                      },
                      child: SizedBox(
                        width: isWideScreen
                            ? 180
                            : MediaQuery.of(context).size.width / 2 - 24,
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          // Gradient Color for Cards
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  AppColors.softBlueGray,
                                  AppColors.mutedGrayPeach,
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: AppColors.navyBlue,
                                    // Icon Background Color
                                    child: Icon(
                                      loan['icon'],
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    loan['title'],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color:
                                          AppColors.navyBlueDark, // Text Color
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    loan['description'],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color:
                                          AppColors.navyBlueDark, // Text Color
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
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
