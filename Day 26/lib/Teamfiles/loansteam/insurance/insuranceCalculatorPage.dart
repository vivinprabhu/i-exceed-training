import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InsuranceCalculatorPage(),
    ),
  );
}

class InsuranceCalculatorPage extends StatefulWidget {
  const InsuranceCalculatorPage({super.key});

  @override
  State<InsuranceCalculatorPage> createState() =>
      _InsuranceCalculatorPageState();
}

class _InsuranceCalculatorPageState extends State<InsuranceCalculatorPage> {
  final _formKey = GlobalKey<FormState>();
  final _dateController = TextEditingController();
  final _adultDobController = TextEditingController();
  final _vehicleYearController = TextEditingController();

  double _sumAssured = 50;
  double _healthSumAssured = 5;
  String selectedInsuranceType = "Term Insurance";

  String selectedGender = "Male";
  final List<String> genderOptions = ["Male", "Female", "Other"];
  int selectedAge = 65;
  final List<int> ageOptions = [65, 75, 85];

  int adultCount = 1;
  int childCount = 0;

  String registrationNumber = "";
  String vehicleType = "2 Wheeler";
  String ownerName = "";

  bool _agreedToTerms = false;

  final List<String> insuranceTypes = [
    "Term Insurance",
    "Health Insurance",
    "Home Insurance",
    "Vehicle Insurance",
  ];

  final List<String> vehicleTypes = ["2 Wheeler", "3 Wheeler", "4 Wheeler"];

  @override
  void dispose() {
    _dateController.dispose();
    _adultDobController.dispose();
    _vehicleYearController.dispose();
    super.dispose();
  }

  void clearInputs() {
    _dateController.clear();
    _adultDobController.clear();
    _vehicleYearController.clear();
    _sumAssured = 50;
    _healthSumAssured = 5;
    selectedGender = "Male";
    selectedAge = 65;
    adultCount = 1;
    childCount = 0;
    registrationNumber = "";
    vehicleType = "2 Wheeler";
    ownerName = "";
    _agreedToTerms = false;
  }

  double calculatePremium() {
    switch (selectedInsuranceType) {
      case "Term Insurance":
        return (_sumAssured * 1000) / selectedAge;
      case "Health Insurance":
        return (_healthSumAssured * 500) +
            (adultCount * 100) +
            (childCount * 50);
      case "Vehicle Insurance":
        return 1000 + (vehicleType == "4 Wheeler" ? 5000 : 3000);
      default:
        return 0;
    }
  }

  List<String> insuranceDescription() {
    switch (selectedInsuranceType) {
      case "Term Insurance":
        return [
          "Provides financial security to your family in case of unforeseen events.",
          "Covers life risks with flexible sum assured options.",
          "Affordable monthly premiums based on your age and sum assured.",
        ];
      case "Health Insurance":
        return [
          "Covers medical expenses for you and your family.",
          "Includes coverage for hospitalization, surgeries, and medications.",
          "Flexible sum assured and family coverage options.",
        ];
      case "Home Insurance":
        return [
          "Protects your home from natural and man-made calamities.",
          "Includes coverage for fire, theft, and other damages.",
          "Offers peace of mind for your most valuable asset.",
        ];
      case "Vehicle Insurance":
        return [
          "Covers damages to your vehicle from accidents and theft.",
          "Includes personal accident and third-party liability coverage.",
          "Choose coverage based on vehicle type and model year.",
        ];
      default:
        return [];
    }
  }

  bool _isAgeValid(String dobText) {
    try {
      final dob = DateFormat('dd/MM/yyyy').parseStrict(dobText);
      final today = DateTime.now();
      final age =
          today.year -
          dob.year -
          ((today.month < dob.month ||
                  (today.month == dob.month && today.day < dob.day))
              ? 1
              : 0);
      return age >= 18;
    } catch (e) {
      return false;
    }
  }

  Widget getInsuranceForm() {
    switch (selectedInsuranceType) {
      case "Term Insurance":
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Sum assured ₹${_sumAssured.toInt()}L"),
            Slider(
              value: _sumAssured,
              min: 50,
              max: 200,
              divisions: 6,
              label: '₹${_sumAssured.toInt()}L',
              onChanged: (value) {
                setState(() {
                  _sumAssured = value;
                });
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              readOnly: true,
              controller: _dateController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your Date of Birth';
                }
                if (!_isAgeValid(value)) {
                  return 'Age must be at least 18 years';
                }
                return null;
              },
              onTap: () async {
                final DateTime? picker = await showDatePicker(
                  context: context,
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );
                if (picker != null) {
                  setState(() {
                    _dateController.text = DateFormat(
                      'dd/MM/yyyy',
                    ).format(picker);
                  });
                }
              },
              decoration: const InputDecoration(
                labelText: "Enter your Date of birth",
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.calendar_month_outlined),
              ),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: selectedGender,
              decoration: const InputDecoration(
                labelText: "Gender",
                border: OutlineInputBorder(),
              ),
              items:
                  genderOptions.map((String gender) {
                    return DropdownMenuItem<String>(
                      value: gender,
                      child: Text(gender),
                    );
                  }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedGender = newValue!;
                });
              },
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<int>(
              value: selectedAge,
              decoration: const InputDecoration(
                labelText: "Cover till age",
                border: OutlineInputBorder(),
              ),
              items:
                  ageOptions.map((int age) {
                    return DropdownMenuItem<int>(
                      value: age,
                      child: Text("$age years"),
                    );
                  }).toList(),
              onChanged: (int? newValue) {
                setState(() {
                  selectedAge = newValue!;
                });
              },
            ),
          ],
        );

      case "Health Insurance":
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Sum assured ₹${_healthSumAssured.toInt()}L"),
            Slider(
              value: _healthSumAssured,
              min: 5,
              max: 25,
              divisions: 4,
              label: '₹${_healthSumAssured.toInt()}L',
              onChanged: (value) {
                setState(() {
                  _healthSumAssured = value;
                });
              },
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<int>(
              value: adultCount,
              decoration: const InputDecoration(
                labelText: "Adult Count",
                border: OutlineInputBorder(),
              ),
              items:
                  [1, 2].map((int count) {
                    return DropdownMenuItem<int>(
                      value: count,
                      child: Text("$count Adult(s)"),
                    );
                  }).toList(),
              onChanged: (value) {
                setState(() {
                  adultCount = value!;
                });
              },
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<int>(
              value: childCount,
              decoration: const InputDecoration(
                labelText: "Child Count",
                border: OutlineInputBorder(),
              ),
              items:
                  [0, 1, 2, 3].map((int count) {
                    return DropdownMenuItem<int>(
                      value: count,
                      child: Text("$count Child(ren)"),
                    );
                  }).toList(),
              onChanged: (value) {
                setState(() {
                  childCount = value!;
                });
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              readOnly: true,
              controller: _adultDobController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter highest adult DOB';
                }
                if (!_isAgeValid(value)) {
                  return 'Age must be at least 18 years';
                }
                return null;
              },
              onTap: () async {
                final DateTime? picker = await showDatePicker(
                  context: context,
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );
                if (picker != null) {
                  setState(() {
                    _adultDobController.text = DateFormat(
                      'dd/MM/yyyy',
                    ).format(picker);
                  });
                }
              },
              decoration: const InputDecoration(
                labelText: "Highest Adult DOB",
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.calendar_today),
              ),
            ),
          ],
        );

      case "Home Insurance":
        return const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "A comprehensive Home Insurance policy designed to protect your property against unexpected damages caused by natural disasters incidents.",
          ),
        );

      case "Vehicle Insurance":
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Vehicle Registration Number",
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter vehicle registration number';
                }
                return null;
              },
              onChanged: (value) => registrationNumber = value,
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: vehicleType,
              decoration: const InputDecoration(
                labelText: "Vehicle Type",
                border: OutlineInputBorder(),
              ),
              items:
                  vehicleTypes.map((String type) {
                    return DropdownMenuItem<String>(
                      value: type,
                      child: Text(type),
                    );
                  }).toList(),
              onChanged: (value) => setState(() => vehicleType = value!),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Owner Name",
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter owner name';
                }
                return null;
              },
              onChanged: (value) => ownerName = value,
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _vehicleYearController,
              decoration: const InputDecoration(
                labelText: "Model Year",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter model year';
                }
                if (int.tryParse(value) == null) {
                  return 'Enter a valid number';
                }
                return null;
              },
            ),
          ],
        );

      default:
        return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 700;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.navyBlue,
        foregroundColor: AppColors.pureWhite,
        title: const Text("Insurance Calculator"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child:
                isSmallScreen
                    ? Column(children: _buildContent())
                    : Row(
                      children: [
                        Expanded(
                          child: Image.asset(
                            "assets/images/fam.jpg",
                            fit: BoxFit.cover,
                            height: MediaQuery.of(context).size.height,
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(child: Column(children: _buildContent())),
                      ],
                    ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildContent() {
    final description = insuranceDescription();
    return [
      DropdownButtonFormField<String>(
        value: selectedInsuranceType,
        decoration: const InputDecoration(
          labelText: "Select Insurance Type",
          border: OutlineInputBorder(),
        ),
        items:
            insuranceTypes.map((String type) {
              return DropdownMenuItem<String>(value: type, child: Text(type));
            }).toList(),
        onChanged: (value) {
          setState(() {
            selectedInsuranceType = value!;
            clearInputs();
          });
        },
      ),
      SizedBox(height: 10),
      ...description.map(
        (point) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("• ", style: TextStyle(fontSize: 18)),
              Expanded(child: Text(point)),
            ],
          ),
        ),
      ),
      SizedBox(height: 20),
      getInsuranceForm(),
      if (selectedInsuranceType != "Home Insurance")
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            "Monthly premium to pay: ₹${calculatePremium().toStringAsFixed(2)}",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
      SizedBox(height: 20),

      // Terms & Conditions Checkbox
      Row(
        children: [
          Checkbox(
            value: _agreedToTerms,
            onChanged: (bool? newValue) {
              setState(() {
                _agreedToTerms = newValue ?? false;
              });
            },
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const TermsAndConditionsPage(),
                  ),
                );
              },
              child: RichText(
                text: const TextSpan(
                  text: 'I agree to the ',
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'Terms and Conditions',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),

      ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            if (!_agreedToTerms) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("You must agree to the Terms and Conditions"),
                ),
              );
              return;
            }
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  "Insurance has been applied. Our team will further contact you.",
                ),
              ),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.navyBlue,
          foregroundColor: AppColors.pureWhite,
        ),
        child: const Text("Request this insurance"),
      ),
    ];
  }
}

class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Terms & Conditions"),
        backgroundColor: AppColors.navyBlue,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: const Text(
            "Finterest Bank - Insurance Terms and Conditions\n\n"
            "Welcome to Finterest's insurance services. By applying for any of our insurance products, you agree to the terms outlined below. Please read them carefully.\n\n"
            "1. General Terms Applicable to All Insurance Types:\n"
            "- All policies are subject to verification and approval by Finterest.\n"
            "- False information or non-disclosure of facts may lead to policy rejection or cancellation.\n"
            "- Premium payments must be made on or before the due date to keep the policy active.\n"
            "- Claims are processed based on policy documents and the terms agreed upon during issuance.\n"
            "- Policyholders must immediately notify Finterest of any change in personal, medical, or asset-related information.\n\n"
            "2. Term Insurance:\n"
            "Term insurance provides financial protection to your family in the event of the policyholder’s death.\n"
            "- Minimum entry age: 18 years. Maximum entry age: 60 years.\n"
            "- Sum assured is based on age, health status, and declared income.\n"
            "- Suicide is excluded from coverage within the first 12 months of the policy.\n"
            "- Claims require submission of valid death certificates and nominee verification.\n\n"
            "3. Health Insurance:\n"
            "Health coverage for individuals and families to manage medical expenses.\n"
            "- Covers hospitalization, surgeries, prescribed medications, and diagnostics.\n"
            "- Pre-existing illnesses may be excluded for a waiting period of up to 3 years.\n"
            "- Premiums may increase based on age, claim history, or inflation.\n"
            "- Daycare procedures and critical illnesses may require separate riders.\n\n"
            "4. Home Insurance:\n"
            "Protection against damage or loss to your residential property.\n"
            "- Covers natural calamities (floods, earthquakes) and man-made events (fire, burglary).\n"
            "- Home contents must be declared for accurate valuation.\n"
            "- Policy does not cover damage due to negligence or illegal activities.\n"
            "- Claims must be reported within 7 days of the incident.\n\n"
            "5. Vehicle Insurance:\n"
            "Financial cover for damage or loss to your personal vehicle.\n"
            "- Covers theft, accidental damage, third-party liability, and personal accident.\n"
            "- Valid driving license and up-to-date vehicle registration are mandatory.\n"
            "- Insurance premium depends on vehicle type, model year, and usage pattern.\n"
            "- Claims may be rejected for drunk driving, unauthorized usage, or expired policies.\n\n"
            "6. Legal and Regulatory Compliance:\n"
            "- Finterest is a registered corporate insurance agent with necessary IRDAI approvals.\n"
            "- All disputes shall be subject to the jurisdiction of Indian courts.\n"
            "- These terms may be updated periodically, and continued use implies acceptance.\n\n"
            "For any queries, please contact our insurance helpdesk or visit the nearest Finterest branch.\n\n"
            "© 2025 Finterest Bank. All rights reserved.",
            style: TextStyle(fontSize: 16, height: 1.5),
          ),
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