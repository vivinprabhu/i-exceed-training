import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class RaiseComplaintPage extends StatefulWidget {
  const RaiseComplaintPage({super.key});

  @override
  State<RaiseComplaintPage> createState() => _RaiseComplaintPageState();
}

class _RaiseComplaintPageState extends State<RaiseComplaintPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController complaintController = TextEditingController();
  String? selectedCategory;
  DateTime? selectedDate;

  final List<String> categories = [
    'Transaction Issue',
    'Card Block Request',
    'Login Problem',
    'Other',
  ];

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    complaintController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pureWhite,
      appBar: AppBar(
        title: const Text("Raise a Complaint"),
        backgroundColor: AppColors.navyBlue,
        foregroundColor: AppColors.pureWhite,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text(
              "📝 We're here to help",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.navyBlueDark,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Please fill in the details below and our support team will get back to you.",
              style: TextStyle(fontSize: 14, color: AppColors.navyBlueDark),
            ),
            const SizedBox(height: 20),

            // Stylish Card Form
            Card(
              color: AppColors.pureWhite,
              elevation: 8,
              shadowColor: AppColors.softBlueGray,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    // Name Field
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: "Your Name",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelStyle: const TextStyle(color: AppColors.navyBlueDark),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Email Field
                    TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Email Address",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelStyle: const TextStyle(color: AppColors.navyBlueDark),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Category Dropdown
                    DropdownButtonFormField<String>(
                      value: selectedCategory,
                      dropdownColor: Colors.white,
                      items: categories.map((category) {
                        return DropdownMenuItem(
                          value: category,
                          child: Text(category),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        labelText: "Complaint Category",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelStyle: const TextStyle(color: AppColors.navyBlueDark),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          selectedCategory = value;
                        });
                      },
                    ),
                    const SizedBox(height: 16),

                    // Complaint Details
                    TextField(
                      controller: complaintController,
                      maxLines: 5,
                      decoration: InputDecoration(
                        labelText: "Complaint Details",
                        alignLabelWithHint: true,
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelStyle: const TextStyle(color: AppColors.navyBlueDark),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Date Picker
                    ElevatedButton.icon(
                      onPressed: () async {
                        final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2020),
                          lastDate: DateTime.now(),
                          builder: (context, child) {
                            return Theme(
                              data: Theme.of(context).copyWith(
                                dialogBackgroundColor: Colors.white,
                                colorScheme: const ColorScheme.light(
                                  primary: AppColors.navyBlue,
                                  onPrimary: AppColors.pureWhite,
                                  onSurface: AppColors.navyBlueDark,
                                ),
                                textButtonTheme: TextButtonThemeData(
                                  style: TextButton.styleFrom(
                                    foregroundColor: AppColors.navyBlue,
                                  ),
                                ),
                              ),
                              child: child!,
                            );
                          },
                        );
                        if (picked != null) {
                          setState(() {
                            selectedDate = picked;
                          });
                        }
                      },
                      icon: const Icon(Icons.calendar_today),
                      label: const Text("Select Date of Issue"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.mutedGrayPeach,
                        foregroundColor: AppColors.navyBlueDark,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    if (selectedDate != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          "Date Selected: ${selectedDate!.toLocal().toIso8601String().split('T').first}",
                          style: const TextStyle(color: AppColors.navyBlueDark),
                        ),
                      ),
                    const SizedBox(height: 24),

                    // Submit Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (nameController.text.isEmpty ||
                              emailController.text.isEmpty ||
                              complaintController.text.isEmpty ||
                              selectedCategory == null ||
                              selectedDate == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Row(
                                  children: const [
                                    Icon(Icons.error_outline, color: Colors.white),
                                    SizedBox(width: 10),
                                    Text("Please complete all the fields"),
                                  ],
                                ),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Row(
                                  children: const [
                                    Icon(Icons.check_circle_outline, color: Colors.white),
                                    SizedBox(width: 10),
                                    Text("Complaint submitted successfully."),
                                  ],
                                ),
                              ),
                            );
                            nameController.clear();
                            emailController.clear();
                            complaintController.clear();
                            setState(() {
                              selectedCategory = null;
                              selectedDate = null;
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.navyBlue,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          "Submit Complaint",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}