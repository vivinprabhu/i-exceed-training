import 'package:flutter/material.dart';

class TransferSuccessPage extends StatelessWidget {
  final String amount;
  final String beneficiary;
  final String biller;
  final String? supplier;
  final String? accountNumber;
  final String? phoneNumber;
  final String? simType;
  final String? operator;
  final String? plan;
  final String? dueDate;

  const TransferSuccessPage({
    Key? key,
    required this.amount,
    required this.beneficiary,
    required this.biller,
    this.supplier,
    this.accountNumber,
    this.phoneNumber,
    this.simType,
    this.operator,
    this.plan,
    this.dueDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Image.asset(
                'assets/transfer_success/transaction_successfull.png',
                height: 200,
              ),
            ),
            SizedBox(height: 30),
            Text(
              "Transfer successful!",
              style: TextStyle(fontSize: 24, color: Colors.green, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                  children: [
                    TextSpan(text: "Bill amount of "),
                    TextSpan(
                      text: "₹$amount ",
                      style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: "is paid by "),
                    TextSpan(
                      text: beneficiary,
                      style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                IconButton(
                  icon: Icon(Icons.download),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ReceiptPage(
                          amount: amount,
                          beneficiary: beneficiary,
                          biller: biller,
                          supplier: supplier,
                          accountNumber: accountNumber,
                          phoneNumber: phoneNumber,
                          simType: simType,
                          operator: operator,
                          plan: plan,
                          dueDate: dueDate,
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(width: 20),
                IconButton(icon: Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)),
              ],
            ),
            SizedBox(height: 30),

          ],
        ),
      ),
    );
  }
}

class ReceiptPage extends StatelessWidget {
  final String amount;
  final String beneficiary;
  final String biller;
  final String? supplier;
  final String? accountNumber;
  final String? phoneNumber;
  final String? simType;
  final String? operator;
  final String? plan;
  final String? dueDate;

  const ReceiptPage({
    Key? key,
    required this.amount,
    required this.beneficiary,
    required this.biller,
    this.supplier,
    this.accountNumber,
    this.phoneNumber,
    this.simType,
    this.operator,
    this.plan,
    this.dueDate,
  }) : super(key: key);

  Widget buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Text("$label: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          Expanded(child: Text(value, style: TextStyle(fontSize: 16))),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Receipt'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Payment Receipt', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            Divider(thickness: 1, color: Colors.black),
            SizedBox(height: 20),
            buildInfoRow("Amount Paid", '₹$amount'),
            buildInfoRow("Paid By", beneficiary),
            buildInfoRow("Biller", biller),
            if (supplier != null) buildInfoRow("Supplier", supplier!),
            if (accountNumber != null) buildInfoRow("Account No", accountNumber!),
            if (phoneNumber != null) buildInfoRow("Phone Number", phoneNumber!),
            if (simType != null) buildInfoRow("SIM Type", simType!),
            if (operator != null) buildInfoRow("Operator", operator!),
            if (plan != null) buildInfoRow("Plan", plan!),
            if (dueDate != null) buildInfoRow("Due Date", dueDate!),
            Spacer(),
            Divider(thickness: 1, color: Colors.black),
            Center(
              child: Text("Thank you for your payment!", style: TextStyle(fontSize: 16)),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
