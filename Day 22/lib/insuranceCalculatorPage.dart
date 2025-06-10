import 'package:basics/insurancePage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: InsuranceCalculatorPage(),
  ));
}

class InsuranceCalculatorPage extends StatefulWidget {
  const InsuranceCalculatorPage({super.key});

  @override
  State<InsuranceCalculatorPage> createState() => _InsuranceCalculatorPageState();
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

  double calculatePremium() {
    switch (selectedInsuranceType) {
      case "Term Insurance":
        return (_sumAssured * 1000) / selectedAge;
      case "Health Insurance":
        return (_healthSumAssured * 500) + (adultCount * 100) + (childCount * 50);
      case "Vehicle Insurance":
        return 1000 + (vehicleType == "4 Wheeler" ? 5000 : 3000);
      default:
        return 0;
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
              onTap: () async {
                final DateTime? picker = await showDatePicker(
                  context: context,
                  firstDate: DateTime(1950),
                  lastDate: DateTime.now(),
                );
                if (picker != null) {
                  setState(() {
                    _dateController.text = DateFormat('dd/MM/yyyy').format(picker);
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
              items: genderOptions.map((String gender) {
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
              items: ageOptions.map((int age) {
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
              items: [1, 2].map((int count) {
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
              items: [0, 1, 2, 3].map((int count) {
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
              onTap: () async {
                final DateTime? picker = await showDatePicker(
                  context: context,
                  firstDate: DateTime(1950),
                  lastDate: DateTime.now(),
                );
                if (picker != null) {
                  setState(() {
                    _adultDobController.text = DateFormat('dd/MM/yyyy').format(picker);
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
            "A Car Insurance policy for your car that keeps it secure against damage caused by natural and man-made calamities, including acts of terrorism. Avail of Own Damage, Personal Accident and Liability cover all in one policy.\n\nIf your car breaks down, help will come your way\nWe issue instant policy online, with minimal paperwork\nAvail cashless services at 3,500+ network garages\nSwitch to our policy and retain existing benefits\nGet allowance for daily commute when your car is getting repaired",
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
              onChanged: (value) => registrationNumber = value,
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: vehicleType,
              decoration: const InputDecoration(
                labelText: "Vehicle Type",
                border: OutlineInputBorder(),
              ),
              items: vehicleTypes.map((String type) {
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: isSmallScreen
              ? Column(children: _buildContent())
              : Row(
            children: [
              Expanded(child: Image.asset("assets/images/fam.jpg", fit: BoxFit.cover, height: MediaQuery.of(context).size.height,)),
              SizedBox(width: 20),
              Expanded(child: Column(children: _buildContent())),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildContent() {
    return [
      DropdownButtonFormField<String>(
        value: selectedInsuranceType,
        decoration: const InputDecoration(
          labelText: "Select Insurance Type",
          border: OutlineInputBorder(),
        ),
        items: insuranceTypes.map((String type) {
          return DropdownMenuItem<String>(
            value: type,
            child: Text(type),
          );
        }).toList(),
        onChanged: (value) => setState(() => selectedInsuranceType = value!),
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
      ElevatedButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Insurance has been applied. Our team will further contact you."),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.navyBlue,
          foregroundColor: AppColors.pureWhite,
        ),
        child: const Text("Request this insurance"),
      ),

      SizedBox(height: 150,),

      ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) =>
              const InsurancePage(),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.navyBlue,
          foregroundColor: AppColors.pureWhite,
        ),
        child: const Text("Back"),
      ),
    ];
  }
}

class AppColors {
  static const pureWhite = Color.fromARGB(255, 255, 255, 255);
  static const softBlueGray = Color.fromARGB(255, 241, 246, 248);
  static const mutedGrayPeach = Color.fromARGB(253, 205, 213, 214);
  static const navyBlueDark = Color.fromARGB(255, 20, 40, 80);
  static const navyBlue = Color.fromARGB(255, 30, 60, 100);
}