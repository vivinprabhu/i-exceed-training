import 'package:flutter/material.dart';
import 'success.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: FundTransferPage(),
  ));
}

class FundTransferPage extends StatefulWidget {
  @override
  _FundTransferPageState createState() => _FundTransferPageState();
}

class _FundTransferPageState extends State<FundTransferPage> {
  bool isWithinSame = true;
  final _formKey = GlobalKey<FormState>(); // Form key

  final _accountController = TextEditingController();
  final _reEnterAccountController = TextEditingController();
  final _beneficiaryNameController = TextEditingController();
  final _nickNameController = TextEditingController();
  final _ifscController = TextEditingController();
  final _amountController = TextEditingController();

  @override
  void dispose() {
    _accountController.dispose();
    _reEnterAccountController.dispose();
    _beneficiaryNameController.dispose();
    _nickNameController.dispose();
    _ifscController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  final List<String> _banks = [
    'HDFC Bank',
    'ICICI Bank',
    'State Bank of India',
    'Axis Bank',
    'Kotak Mahindra Bank',
    'Punjab National Bank',
    'Yes Bank',
    'Bank of Baroda',
    'IDFC First Bank',
  ];

  String? _selectedBank;
  bool _isLoading = false; // optional loading indicator

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text(
          "Send Money",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 30, 60, 100),
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(height: 10),

          // Toggle Tabs
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(253, 205, 213, 214),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  buildTab("Within Same Bank", isWithinSame, () {
                    setState(() => isWithinSame = true);
                  }),
                  buildTab("Other Bank", !isWithinSame, () {
                    setState(() => isWithinSame = false);
                  }),
                ],
              ),
            ),
          ),

          SizedBox(height: 15),

          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                color: Color.fromARGB(255, 241, 246, 248),
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        buildValidatedInputField("Account Number", _accountController, Icons.account_balance_wallet),
                        buildValidatedInputField("Re-enter Account Number", _reEnterAccountController, Icons.repeat),

                        if (!isWithinSame) ...[
                          buildBankDropdown(),
                          buildValidatedInputField("IFSC Code", _ifscController, Icons.qr_code),
                        ],

                        buildValidatedInputField("Beneficiary Name", _beneficiaryNameController, Icons.person),
                        buildValidatedInputField("Nick Name", _nickNameController, Icons.edit_note),
                        buildValidatedInputField("Amount", _amountController, Icons.currency_rupee, isAmount: true),

                        SizedBox(height: 30),

                        ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                _isLoading = true;
                              });

                              await Future.delayed(Duration(seconds: 2));

                              setState(() {
                                _isLoading = false;
                              });


                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => TransferSuccessPage(
                                    amount: _amountController.text.trim(),
                                    beneficiary: _beneficiaryNameController.text.trim(),
                                    accountNumber: _accountController.text.trim(),
                                    transferType: isWithinSame ? "Within Same Bank" : "Other Bank",
                                    outsideBank: isWithinSame ? null : _selectedBank,
                                  ),
                                ),
                              ).then((_) {
                                // Reset form and clear fields when returning back
                                _formKey.currentState?.reset();
                                _accountController.clear();
                                _reEnterAccountController.clear();
                                _beneficiaryNameController.clear();
                                _nickNameController.clear();
                                _ifscController.clear();
                                _amountController.clear();
                                setState(() {
                                  _selectedBank = null;
                                });
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 30, 60, 100),
                            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          child: _isLoading
                              ? SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                              : Text(
                            "Confirm",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildValidatedInputField(String label, TextEditingController controller, IconData icon, {bool isAmount = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: controller,
        keyboardType: isAmount ? TextInputType.number : TextInputType.text,
        style: TextStyle(
          fontSize: 16,
          color: Color.fromARGB(255, 20, 40, 80),
        ),
        cursorColor: Color.fromARGB(255, 30, 60, 100),
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Color.fromARGB(255, 20, 40, 80)),
          labelText: label,
          labelStyle: TextStyle(
            fontSize: 16,
            color: Color.fromARGB(255, 20, 40, 80),
          ),
          filled: true,
          fillColor: Color.fromARGB(253, 205, 213, 214),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Color.fromARGB(255, 30, 60, 100),
              width: 2,
            ),
          ),
        ),
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Please enter $label';
          }
          if (label == "Account Number") {
            if (!RegExp(r'^\d{11}$').hasMatch(value.trim())) {
              return 'Account number must be exactly 11 digits';
            }
          }
          if (label == "Re-enter Account Number" &&
              value.trim() != _accountController.text.trim()) {
            return 'Account numbers do not match';
          }
          if (label == "Beneficiary Name") {
            if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value.trim())) {
              return 'Name must contain only letters and spaces';
            }
          }
          if (label == "Nick Name") {
            if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value.trim())) {
              return 'Name must contain only letters and spaces';
            }
          }
          if (label == "IFSC Code") {
            if (!RegExp(r'^[A-Z]{4}0[A-Z0-9]{6}$').hasMatch(value.trim())) {
              return 'Enter a valid IFSC code';
            }
          }
          if (label == "Amount") {
            if (double.tryParse(value.trim()) == null || double.parse(value.trim()) <= 0) {
              return 'Please enter valid amount';
            }
          }

          return null;
        },
      ),
    );
  }

  Widget buildBankDropdown() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: DropdownButtonFormField(

        decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_balance, color: Color.fromARGB(255, 20, 40, 80)),
          labelText: "Select Bank",
          labelStyle: TextStyle(
            fontSize: 16,
            color: Color.fromARGB(255, 20, 40, 80),
          ),
          filled: true,
          fillColor: Color.fromARGB(253, 205, 213, 214),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Color.fromARGB(255, 30, 60, 100),
              width: 2,
            ),
          ),
        ),
        value: _selectedBank,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Please select bank';
          }
          return null;
        },
        items: _banks.map((bank) {
          return DropdownMenuItem(
            value: bank,
            child: Text(bank,
                style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 20, 40, 80))),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            _selectedBank = value;
          });
        },
      ),
    );
  }

  Widget buildTab(String label, bool isSelected, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(30),
            boxShadow: isSelected
                ? [BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 2))]
                : [],
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 16,
              color: isSelected
                  ? Color.fromARGB(255, 20, 40, 80)
                  : Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
