import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class ChangePinScreen extends StatefulWidget {
  const ChangePinScreen({super.key});

  @override
  State<ChangePinScreen> createState() => _ChangePinScreenState();
}

class _ChangePinScreenState extends State<ChangePinScreen> {
  final _formKey = GlobalKey<FormState>();
  final _oldPinController = TextEditingController();
  final _newPinController = TextEditingController();
  final _confirmPinController = TextEditingController();

  bool _showOld = false;
  bool _showNew = false;
  bool _showConfirm = false;

  void _submit() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          backgroundColor: AppColors.pureWhite,
          contentPadding: const EdgeInsets.all(24),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.check_circle, color: Colors.green, size: 60),
              const SizedBox(height: 16),
              const Text(
                "PIN Updated",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.navyBlueDark,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Your PIN has been updated successfully.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: AppColors.navyBlueDark),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.navyBlue,
                  foregroundColor: AppColors.pureWhite,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop(); // Go back to settings
                },
                child: const Text("OK"),
              )
            ],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.softBlueGray,
      appBar: AppBar(
        title: const Text("Change PIN"),
        centerTitle: true,
        backgroundColor: AppColors.navyBlue,
        foregroundColor: AppColors.pureWhite,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              buildPinField("Current PIN", _oldPinController, _showOld, (val) {
                setState(() => _showOld = !_showOld);
              }),
              const SizedBox(height: 16),
              buildPinField("New PIN", _newPinController, _showNew, (val) {
                setState(() => _showNew = !_showNew);
              }),
              const SizedBox(height: 16),
              buildPinField("Confirm PIN", _confirmPinController, _showConfirm, (val) {
                setState(() => _showConfirm = !_showConfirm);
              }),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.navyBlueDark,
                  foregroundColor: AppColors.pureWhite,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                ),
                onPressed: _submit,
                child: const Text("Update PIN", style: TextStyle(fontSize: 16)),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPinField(String label, TextEditingController controller, bool isVisible, Function toggle) {
    return TextFormField(
      controller: controller,
      obscureText: !isVisible,
      keyboardType: TextInputType.number,
      maxLength: 6,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        filled: true,
        fillColor: AppColors.mutedGrayPeach,
        counterText: "", // Hide character counter
        suffixIcon: IconButton(
          icon: Icon(isVisible ? Icons.visibility : Icons.visibility_off),
          onPressed: () => toggle(!isVisible),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) return "Please enter $label";
        if (value.length != 4 && value.length != 6) {
          return "PIN must be 4 or 6 digits";
        }
        if (label == "Confirm PIN" && value != _newPinController.text) {
          return "PINs do not match";
        }
        return null;
      },
    );
  }

  @override
  void dispose() {
    _oldPinController.dispose();
    _newPinController.dispose();
    _confirmPinController.dispose();
    super.dispose();
  }
}