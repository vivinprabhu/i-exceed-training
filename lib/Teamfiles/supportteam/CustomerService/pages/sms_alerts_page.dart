import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class SmsAlertActivationPage extends StatefulWidget {
  const SmsAlertActivationPage({super.key});

  @override
  _SmsAlertActivationPageState createState() => _SmsAlertActivationPageState();
}

class _SmsAlertActivationPageState extends State<SmsAlertActivationPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();

  bool activateAlerts = false;
  bool awareOfCharges = false;
  bool cheque = false;
  bool card = false;
  bool holdOnAccountBalance = false;

  @override
  void dispose() {
    _accountController.dispose();
    _mobileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SMS ALERT ACTIVATION'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 6),
              TextFormField(
                controller: _accountController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: AppColors.pureWhite,
                  hintText: "Enter Account Number",
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your account number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _mobileController,
                keyboardType: TextInputType.phone,
                maxLength: 10,
                decoration: const InputDecoration(
                  labelText: "Mobile Number",
                  hintText: "Please type the mobile number",
                  border: OutlineInputBorder(),
                  counterText: "",
                ),
                validator: (value) {
                  if (value == null || value.trim().length != 10) {
                    return 'Enter a valid 10-digit mobile number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              const Text("All SMS Alerts",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.navyBlueDark)),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<bool>(
                      title: const Text("Activate"),
                      value: true,
                      groupValue: activateAlerts,
                      onChanged: (val) {
                        setState(() {
                          activateAlerts = true;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<bool>(
                      title: const Text("Deactivate"),
                      value: false,
                      groupValue: activateAlerts,
                      onChanged: (val) {
                        setState(() {
                          activateAlerts = false;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const Divider(),
              CheckboxListTile(
                title: const Text("Cheque"),
                value: cheque,
                onChanged: (val) {
                  setState(() {
                    cheque = val!;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text("Credit/Debit Account"),
                value: card,
                onChanged: (val) {
                  setState(() {
                    card = val!;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text("Hold on Account Balance"),
                value: holdOnAccountBalance,
                onChanged: (val) {
                  setState(() {
                    holdOnAccountBalance = val!;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text("I am aware of Charges"),
                value: awareOfCharges,
                onChanged: (val) {
                  setState(() {
                    awareOfCharges = val!;
                  });
                },
              ),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.navyBlue,
                        side: const BorderSide(color: AppColors.navyBlue),
                      ),
                      child: const Text("Back"),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate() &&
                            awareOfCharges) {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                backgroundColor: AppColors.pureWhite,
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(Icons.check_circle,
                                          color: Colors.green, size: 60),
                                      const SizedBox(height: 15),
                                      const Text(
                                        "SMS Alert Activated",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.navyBlueDark),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        "SMS alert has been activated for account ${_accountController.text} and mobile ${_mobileController.text}.",
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            color: Colors.black87),
                                      ),
                                      const SizedBox(height: 20),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColors.navyBlue,
                                          foregroundColor: AppColors.pureWhite,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text("OK"),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          );

                          _accountController.clear();
                          _mobileController.clear();
                        } else if (!awareOfCharges) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Please acknowledge that you are aware of charges."),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.navyBlue,
                        foregroundColor: AppColors.pureWhite,
                      ),
                      child: const Text("Submit"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}