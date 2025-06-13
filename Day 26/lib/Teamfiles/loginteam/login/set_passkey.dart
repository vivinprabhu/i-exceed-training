import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import 'exampledb.dart';

class SetPasskeyPage extends StatefulWidget {
  const SetPasskeyPage({Key? key}) : super(key: key);

  @override
  _SetPasskeyPageState createState() => _SetPasskeyPageState();
}

class _SetPasskeyPageState extends State<SetPasskeyPage> {
  final TextEditingController passkeyController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final db = exampleDb();

  String generatedOtp = '';
  int attemptsLeft = 3;
  int _timeLeft = 0;
  Timer? _timer;

  bool showOtpField = false;
  bool isOtpExpired = false;

  bool isPasskeyObscured = true;
  bool isConfirmObscured = true;

  late double accNumber;

  final OutlineInputBorder boxBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(color: Colors.grey),
  );

  bool isValidPasskey(String passkey) {
    return RegExp(r'^[a-z,A-Z]{6}$').hasMatch(passkey);
  }

  void startTimer() {
    _timeLeft = 60;
    isOtpExpired = false;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeLeft == 0) {
        timer.cancel();
        setState(() {
          isOtpExpired = true;
        });
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("OTP expired!")));
      } else {
        setState(() {
          _timeLeft--;
        });
      }
    });
  }

  void sendOtp() {
    if (_formKey.currentState!.validate()) {
      if (!db.accountNum.containsKey(accNumber)) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Account not registered!")),
        );
        return;
      }

      if (db.userDatabase.containsValue(passkeyController.text)) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Passkey already in use!")),
        );
        return;
      }

      generatedOtp = (1000 + Random().nextInt(9000)).toString();
      attemptsLeft = 3;
      otpController.clear();

      setState(() {
        showOtpField = true;
        isOtpExpired = false;
      });

      startTimer();

      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              title: const Text("OTP Sent"),
              content: Text("Your OTP is: $generatedOtp"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("OK"),
                ),
              ],
            ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fix errors before sending OTP")),
      );
    }
  }

  void verifyOtp() {
    if (!showOtpField || isOtpExpired) return;

    if (otpController.text == generatedOtp) {
      _timer?.cancel();
      db.userDatabase[accNumber.toStringAsFixed(0)] = passkeyController.text;

      showDialog(
        context: context,
        builder:
            (_) => AlertDialog(
              title: const Text("Success"),
              content: const Text("Passkey set successfully."),
              actions: [
                TextButton(
                  onPressed: () {
                    passkeyController.clear();
                    confirmController.clear();
                    otpController.clear();

                    setState(() {
                      showOtpField = false;
                    });

                    Navigator.pop(context); // Close dialog
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                  child: const Text("OK"),
                ),
              ],
            ),
      );
    } else {
      attemptsLeft--;
      if (attemptsLeft == 0) {
        _timer?.cancel();
        setState(() {
          isOtpExpired = true;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Too many attempts! Try again later.")),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Incorrect OTP. Attempts left: $attemptsLeft"),
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)?.settings.arguments;
    if (arg is double) {
      accNumber = arg;
    } else if (arg is String) {
      accNumber = double.tryParse(arg) ?? 0.0;
    } else {
      accNumber = 0.0;
    }

    return Scaffold(
      backgroundColor: const Color.fromRGBO(227, 247, 250, 1),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 30, 60, 100),
        title: const Text(
          "FinTerest",
          style: TextStyle(
            fontSize: 35,
            color: Colors.white,
            fontFamily: "serif",
          ),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Set Passkey",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: passkeyController,
                      obscureText: isPasskeyObscured,
                      decoration: InputDecoration(
                        labelText: "Set Passkey",
                        prefixIcon: const Icon(Icons.key),
                        suffixIcon: IconButton(
                          icon: Icon(
                            isPasskeyObscured
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              isPasskeyObscured = !isPasskeyObscured;
                            });
                          },
                        ),
                        border: boxBorder,
                        enabledBorder: boxBorder,
                        focusedBorder: boxBorder,
                      ),
                      validator: (value) {
                        if (value == null || !isValidPasskey(value)) {
                          return "Must be 6 letters";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: confirmController,
                      obscureText: isConfirmObscured,
                      decoration: InputDecoration(
                        labelText: "Confirm Passkey",
                        prefixIcon: const Icon(Icons.key_outlined),
                        suffixIcon: IconButton(
                          icon: Icon(
                            isConfirmObscured
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              isConfirmObscured = !isConfirmObscured;
                            });
                          },
                        ),
                        border: boxBorder,
                        enabledBorder: boxBorder,
                        focusedBorder: boxBorder,
                      ),
                      validator: (value) {
                        if (value != passkeyController.text) {
                          return "Passkeys do not match";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      onPressed: sendOtp,
                      child: const Text("Send OTP"),
                    ),
                    const SizedBox(height: 20),
                    if (showOtpField) ...[
                      Text(
                        isOtpExpired
                            ? "OTP expired"
                            : "OTP expires in: $_timeLeft seconds",
                        style: const TextStyle(color: Colors.red),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: otpController,
                        keyboardType: TextInputType.number,
                        enabled: !isOtpExpired,
                        decoration: InputDecoration(
                          labelText: "Enter OTP",
                          prefixIcon: const Icon(Icons.key),
                          border: boxBorder,
                          enabledBorder: boxBorder,
                          focusedBorder: boxBorder,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrangeAccent,
                        ),
                        onPressed: isOtpExpired ? null : verifyOtp,
                        child: const Text("Set"),
                      ),
                    ],
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
