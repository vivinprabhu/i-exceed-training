import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LoanApplicationForm extends StatefulWidget {
  final String loanType;

  const LoanApplicationForm({super.key, required this.loanType});

  @override
  State<LoanApplicationForm> createState() => _LoanApplicationFormState();
}

class _LoanApplicationFormState extends State<LoanApplicationForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _incomeController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _otherEmploymentController =
      TextEditingController();
  final TextEditingController _loanAmountController = TextEditingController();
  final TextEditingController _totalgoldController = TextEditingController();
  final TextEditingController _totalacresController = TextEditingController();
  final TextEditingController _institutionController = TextEditingController();
  final TextEditingController _courseController = TextEditingController();
  final TextEditingController _coApplicantNameController =
      TextEditingController();
  final TextEditingController _coApplicantIncomeController =
      TextEditingController();

  String? _employmentStatus;
  String? _coApplicantEmploymentStatus;

  int? _calculatedAge;

  @override
  void dispose() {
    _nameController.dispose();
    _dobController.dispose();
    _incomeController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _otherEmploymentController.dispose();
    _totalgoldController.dispose();
    _totalacresController.dispose();
    _loanAmountController.dispose();
    _institutionController.dispose();
    _courseController.dispose();
    _coApplicantNameController.dispose();
    _coApplicantIncomeController.dispose();
    super.dispose();
  }

  Future<void> _selectDOB(BuildContext context) async {
    DateTime initialDate = DateTime.now().subtract(
      const Duration(days: 365 * 21),
    );
    DateTime firstDate = DateTime(1900);
    DateTime lastDate = DateTime.now();

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );
    if (picked != null) {
      _dobController.text = DateFormat('yyyy-MM-dd').format(picked);
      _calculatedAge = _calculateAge(picked);
      setState(() {});
    }
  }

  int _calculateAge(DateTime dob) {
    DateTime today = DateTime.now();
    int age = today.year - dob.year;
    if (today.month < dob.month ||
        (today.month == dob.month && today.day < dob.day)) {
      age--;
    }
    return age;
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,

    String? Function(String?)? validator,
    int maxLines = 1,
    bool readOnly = false,
    VoidCallback? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        validator: validator,
        maxLines: maxLines,
        readOnly: readOnly,
        onTap: onTap,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: AppColors.navyBlue),
          filled: true,
          //fillColor: Colors.grey.shade100,
          fillColor: AppColors.mutedGrayPeach,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildCommonFields() {
    return Column(
      children: [
        _buildTextField(
          controller: _nameController,
          label: 'Full Name',
          icon: Icons.person,
          validator: (val) {
            if (val == null || val.isEmpty) {
              return 'Please enter your name';
            }
            // Improved regex to allow letters, spaces, and basic punctuation
            if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(val)) {
              return 'Enter a valid name (letters and spaces only)';
            }
            return null;
          },
        ),

        _buildTextField(
          controller: _dobController,
          label: 'Date of Birth',
          icon: Icons.cake,
          readOnly: true,
          onTap: () => _selectDOB(context),
          validator: (val) {
            if (val == null || val.isEmpty)
              return 'Please select your date of birth';
            if (_calculatedAge == null || _calculatedAge! < 21)
              return 'Age must be 21 or older';
            return null;
          },
        ),
        _buildTextField(
          controller: _phoneController,
          label: 'Mobile Number',
          icon: Icons.phone,
          keyboardType: TextInputType.phone,
          validator: (val) {
            if (val == null || val.isEmpty) return 'Please enter mobile number';
            if (!RegExp(r'^[6-9]\d{9}$').hasMatch(val))
              return 'Enter valid 10-digit mobile number';
            return null;
          },
        ),
        _buildTextField(
          controller: _emailController,
          label: 'Email',
          icon: Icons.email,
          keyboardType: TextInputType.emailAddress,
          validator: (val) {
            if (val == null || val.isEmpty) return 'Please enter email';
            if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(val))
              return 'Enter valid email';
            return null;
          },
        ),
        _buildTextField(
          controller: _addressController,
          label: 'Address',
          icon: Icons.home,
          maxLines: 2,
          validator: (val) =>
              val == null || val.isEmpty ? 'Please enter address' : null,
        ),
      ],
    );
  }

  Widget _buildCoApplicantEmploymentDropdown() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: 'Co-applicant Employment Status',
        prefixIcon: Icon(Icons.work, color: AppColors.navyBlue),
        filled: true,
        //fillColor: Colors.grey.shade100,
        fillColor: AppColors.mutedGrayPeach,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      items: const [
        DropdownMenuItem(value: 'Salaried', child: Text('Salaried')),
        DropdownMenuItem(value: 'Self-Employed', child: Text('Self-Employed')),
        DropdownMenuItem(value: 'Other', child: Text('Other')),
      ],
      value: _coApplicantEmploymentStatus,
      onChanged: (val) {
        setState(() {
          _coApplicantEmploymentStatus = val;
        });
      },
      validator: (val) =>
          val == null ? 'Please select co-applicant status' : null,
    );
  }

  Widget _buildSpecificFields() {
    switch (widget.loanType) {
      case 'Education Loan':
        return Column(
          children: [
            _buildTextField(
              controller: _institutionController,
              label: 'Institution Name',
              icon: Icons.location_city,
              //validator: (val) => val == null || val.isEmpty ? 'Please enter institution name' : null,
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return 'Please enter institution name';
                }
                // Improved regex to allow letters, spaces, and basic punctuation
                if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(val)) {
                  return 'Enter a valid institution name ';
                }
                return null;
              },
            ),
            _buildTextField(
              controller: _courseController,
              label: 'Course Name',
              icon: Icons.book,
              //validator: (val) => val == null || val.isEmpty ? 'Please enter course name' : null,
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return 'Please enter course name';
                }
                // Improved regex to allow letters, spaces, and basic punctuation
                if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(val)) {
                  return 'Enter a valid course name ';
                }
                return null;
              },
            ),
            _buildTextField(
              controller: _loanAmountController,
              label: 'Tuition Fee Amount (₹)',
              icon: Icons.school,
              keyboardType: TextInputType.number,
              //validator: (val) => val == null || val.isEmpty ? 'Enter tuition fee amount' : null,
              validator: (val) {
                if (val == null || val.isEmpty)
                  return 'Enter tuition fee amount';
                final amount = double.tryParse(val);
                if (amount == null || amount <= 0)
                  return 'Enter a valid amount';
                return null;
              },
            ),
            _buildTextField(
              controller: _coApplicantNameController,
              label: 'Co-applicant Name',
              icon: Icons.person_add,
              //validator: (val) => val == null || val.isEmpty ? 'Enter co-applicant name' : null,
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return 'Please enter co-applicant name';
                }
                // Improved regex to allow letters, spaces, and basic punctuation
                if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(val)) {
                  return 'Enter a valid co-applicant name ';
                }
                return null;
              },
            ),
            const SizedBox(height: 15),
            _buildCoApplicantEmploymentDropdown(),
            const SizedBox(height: 15),
            _buildTextField(
              controller: _coApplicantIncomeController,
              label: 'Co-applicant Income (₹)',
              icon: Icons.currency_rupee,
              keyboardType: TextInputType.number,
              //validator: (val) => val == null || val.isEmpty ? 'Enter co-applicant income' : null,
              validator: (val) {
                if (val == null || val.isEmpty)
                  return 'Enter co-applicant income';
                final amount = double.tryParse(val);
                if (amount == null || amount <= 0)
                  return 'Enter a valid income';
                return null;
              },
            ),
            const SizedBox(height: 15),
            _buildTextField(
              controller: _loanAmountController,
              label: 'Desired Loan Amount (₹)',
              icon: Icons.money,
              keyboardType: TextInputType.number,
              validator: (val) {
                if (val == null || val.isEmpty) return 'Enter loan amount';
                final amount = double.tryParse(val);
                if (amount == null || amount <= 0)
                  return 'Enter a valid amount';
                return null;
              },
            ),
          ],
        );

      case 'Gold Loan':
        return Column(
          children: [
            _buildTextField(
              controller: _incomeController,
              label: 'Annual Income (₹)',
              icon: Icons.account_balance_wallet,
              keyboardType: TextInputType.number,
              //validator: (val) => val == null || val.isEmpty ? 'Enter your income' : null,
              validator: (val) {
                if (val == null || val.isEmpty) return 'Enter your income';
                final amount = double.tryParse(val);
                if (amount == null || amount <= 0)
                  return 'Enter a valid income';
                return null;
              },
            ),
            _buildTextField(
              controller: _totalgoldController,
              label: 'Total grams of Gold',
              icon: Icons.stars,
              keyboardType: TextInputType.number,
              //validator: (val) => val == null || val.isEmpty ? 'Enter gold value' : null,
              validator: (val) {
                if (val == null || val.isEmpty) return 'Enter total grams';
                final amount = double.tryParse(val);
                if (amount == null || amount <= 0) return 'Enter a valid grams';
                return null;
              },
            ),
            _buildTextField(
              controller: _loanAmountController,
              label: 'Required Loan Amount (₹)',
              icon: Icons.money,
              keyboardType: TextInputType.number,
              //validator: (val) => val == null || val.isEmpty ? 'Enter loan amount' : null,
              validator: (val) {
                if (val == null || val.isEmpty) return 'Enter loan amount';
                final amount = double.tryParse(val);
                if (amount == null || amount <= 0)
                  return 'Enter a valid amount';
                return null;
              },
            ),
          ],
        );

      case 'Agricultural Loan':
        return Column(
          children: [
            _buildTextField(
              controller: _incomeController,
              label: 'Annual Farming Income (₹)',
              icon: Icons.agriculture,
              keyboardType: TextInputType.number,
              //validator: (val) => val == null || val.isEmpty ? 'Enter your income' : null,
              validator: (val) {
                if (val == null || val.isEmpty) return 'Enter your income';
                final amount = double.tryParse(val);
                if (amount == null || amount <= 0)
                  return 'Enter a valid income';
                return null;
              },
            ),
            _buildTextField(
              controller: _totalacresController,
              label: 'Land Size (in acres)',
              icon: Icons.terrain,
              keyboardType: TextInputType.number,
              //validator: (val) => val == null || val.isEmpty ? 'Enter land size' : null,
              validator: (val) {
                if (val == null || val.isEmpty) return 'Enter land size';
                final amount = double.tryParse(val);
                if (amount == null || amount <= 0)
                  return 'Enter a valid land size';
                return null;
              },
            ),
            _buildTextField(
              controller: _loanAmountController,
              label: 'Required Loan Amount (₹)',
              icon: Icons.money,
              keyboardType: TextInputType.number,
              //validator: (val) => val == null || val.isEmpty ? 'Enter loan amount' : null,
              validator: (val) {
                if (val == null || val.isEmpty) return 'Enter loan amount';
                final amount = double.tryParse(val);
                if (amount == null || amount <= 0)
                  return 'Enter a valid amount';
                return null;
              },
            ),
          ],
        );

      default:
        return Column(
          children: [
            _buildDropdownField(),
            const SizedBox(height: 20),
            if (_employmentStatus == 'Other') _buildOtherEmploymentField(),
            _buildTextField(
              controller: _incomeController,
              label: 'Monthly Income (₹)',
              icon: Icons.currency_rupee,
              keyboardType: TextInputType.number,
              //validator: (val) => val == null || val.isEmpty ? 'Please enter your income' : null,
              validator: (val) {
                if (val == null || val.isEmpty) return 'Enter your income';
                final amount = double.tryParse(val);
                if (amount == null || amount <= 0)
                  return 'Enter a valid income';
                return null;
              },
            ),
            const SizedBox(height: 13),
            _buildTextField(
              controller: _loanAmountController,
              label: 'Desired Loan Amount (₹)',
              icon: Icons.money,
              keyboardType: TextInputType.number,
              validator: (val) {
                if (val == null || val.isEmpty)
                  return 'Please enter loan amount';
                final amount = double.tryParse(val);
                if (amount == null || amount <= 0)
                  return 'Enter a valid amount';
                return null;
              },
            ),
          ],
        );
    }
  }

  Widget _buildDropdownField() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: 'Employment Status',
        prefixIcon: Icon(Icons.work, color: AppColors.navyBlue),
        filled: true,
        fillColor: AppColors.mutedGrayPeach,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      items: const [
        DropdownMenuItem(value: 'Salaried', child: Text('Salaried')),
        DropdownMenuItem(value: 'Self-Employed', child: Text('Self-Employed')),
        DropdownMenuItem(value: 'Other', child: Text('Other')),
      ],
      value: _employmentStatus,
      onChanged: (val) => setState(() {
        _employmentStatus = val;
        if (val != 'Other') {
          _otherEmploymentController.clear();
        }
      }),
      validator: (val) =>
          val == null ? 'Please select employment status' : null,
    );
  }

  Widget _buildOtherEmploymentField() {
    return _buildTextField(
      controller: _otherEmploymentController,
      label: 'Please specify your employment',
      icon: Icons.work_outline,
      validator: (val) =>
          val == null || val.isEmpty ? 'Please specify your employment' : null,
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Application Submitted'),
          content: Text(
            'Thank you for applying for a ${widget.loanType}. We will contact you soon.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context)
                  ..pop()
                  ..pop();
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double formWidth = screenWidth * 0.85;

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.loanType} Application'),
        //backgroundColor: Colors.indigo.shade900,
        backgroundColor: AppColors.navyBlue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      backgroundColor: AppColors.pureWhite,
      body: Center(
        child: Container(
          width: formWidth,
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
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Text(
                      'Please fill in the details below to apply for your ${widget.loanType}.',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.navyBlueDark,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    _buildCommonFields(),
                    const SizedBox(height: 20),
                    _buildSpecificFields(),
                    const SizedBox(height: 30),
                    Center(
                      child: SizedBox(
                        width: 180,
                        child: ElevatedButton.icon(
                          onPressed: _submitForm,
                          icon: const Icon(Icons.send, size: 18),
                          label: const Text(
                            'Submit',
                            style: TextStyle(fontSize: 14),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.navyBlue,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
