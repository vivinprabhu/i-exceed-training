import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/helpers.dart';

class UpdatePersonalDetailsScreen extends StatefulWidget {
  const UpdatePersonalDetailsScreen({super.key});

  @override
  State<UpdatePersonalDetailsScreen> createState() => _UpdatePersonalDetailsScreenState();
}

class _UpdatePersonalDetailsScreenState extends State<UpdatePersonalDetailsScreen> {
  bool isEditing = false;
  TextEditingController phoneController = TextEditingController(text: "********06");
  TextEditingController emailController = TextEditingController(text: "aksh*******@gmail.com");
  TextEditingController nameController = TextEditingController(text: "User");
  TextEditingController addressController = TextEditingController(text: "123, MG Road, Bangalore");

  @override
  void dispose() {
    phoneController.dispose();
    emailController.dispose();
    nameController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Personal Details"),
        backgroundColor: AppColors.navyBlue,
        foregroundColor: AppColors.pureWhite,
        actions: [
          IconButton(
            icon: Icon(isEditing ? Icons.save : Icons.edit),
            tooltip: isEditing ? "Save" : "Edit",
            onPressed: () {
              setState(() {
                isEditing = !isEditing;
              });
              if (!isEditing) {
                // Show success message when saving
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Personal details updated successfully!"),
                    backgroundColor: AppColors.navyBlue,
                  ),
                );
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Stack(
                    children: [
                      const CircleAvatar(
                        radius: 60,
                        backgroundColor: AppColors.softBlueGray,
                        child: Icon(
                          Icons.person,
                          size: 60,
                          color: AppColors.navyBlue,
                        ),
                      ),
                      if (isEditing)
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: AppColors.navyBlue,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.camera_alt, color: Colors.white, size: 20),
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("Photo update feature coming soon!")),
                                );
                              },
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  isEditing
                      ? SizedBox(
                    width: 200,
                    child: TextFormField(
                      controller: nameController,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: AppColors.navyBlueDark,
                      ),
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        isDense: true,
                      ),
                    ),
                  )
                      : Text(
                    nameController.text,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: AppColors.navyBlueDark,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            sectionTitle(Icons.account_balance, "Account Details"),
            detailCard([
              buildRow("Account No", "447689036788"),
              buildRow("IFSC Code", "SBIN0090876"),
              buildRow("Branch", "Madiwala Bangalore"),
              buildRow("Account Type", "Savings Account"),
            ]),

            sectionTitle(Icons.contact_phone, "Contact Information"),
            detailCard([
              isEditing
                  ? buildEditableRow("Phone", phoneController)
                  : buildRow("Phone", phoneController.text),
              isEditing
                  ? buildEditableRow("Email", emailController)
                  : buildRow("Email", emailController.text),
              isEditing
                  ? buildEditableRow("Address", addressController, maxLines: 2)
                  : buildRow("Address", addressController.text),
            ]),

            sectionTitle(Icons.credit_card, "PAN Linkage"),
            detailCard([
              buildRow("PAN Number", "EDG**987A"),
              buildRow("Status", "Verified", valueColor: Colors.green),
            ]),

            sectionTitle(Icons.security, "Security Information"),
            detailCard([
              buildRow("Last Login", "Today, 10:30 AM"),
              buildRow("Login Method", "Biometric"),
              buildRow("Two-Factor Auth", "Enabled", valueColor: Colors.green),
            ]),

            const SizedBox(height: 30),

            if (isEditing)
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      icon: const Icon(Icons.cancel),
                      label: const Text("Cancel"),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.navyBlue,
                        side: const BorderSide(color: AppColors.navyBlue),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      onPressed: () {
                        setState(() {
                          isEditing = false;
                          // Reset controllers to original values
                          phoneController.text = "********06";
                          emailController.text = "aksh*******@gmail.com";
                          nameController.text = "Akshay Kumar";
                          addressController.text = "123, MG Road, Bangalore";
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.save),
                      label: const Text("Save Changes"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.navyBlue,
                        foregroundColor: AppColors.pureWhite,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      onPressed: () {
                        setState(() {
                          isEditing = false;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Personal details updated successfully!"),
                            backgroundColor: AppColors.navyBlue,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              )
            else
              Center(
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.arrow_back),
                  label: const Text("Back"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.navyBlue,
                    foregroundColor: AppColors.pureWhite,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget sectionTitle(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, bottom: 8),
      child: Row(
        children: [
          Icon(icon, color: AppColors.navyBlue),
          const SizedBox(width: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColors.navyBlueDark,
            ),
          ),
        ],
      ),
    );
  }

  Widget detailCard(List<Widget> children) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: getCardBoxDecoration(),
      padding: const EdgeInsets.all(16),
      child: Column(children: children),
    );
  }

  Widget buildRow(String title, String value, {Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: AppColors.navyBlueDark,
            ),
          ),
          Flexible(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 16,
                color: valueColor ?? Colors.grey[700],
                fontWeight: valueColor != null ? FontWeight.w600 : FontWeight.normal,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildEditableRow(String title, TextEditingController controller, {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: AppColors.navyBlueDark,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: TextFormField(
              controller: controller,
              maxLines: maxLines,
              style: const TextStyle(fontSize: 16),
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppColors.navyBlue),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppColors.navyBlue, width: 2),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}