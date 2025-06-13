import 'package:flutter/material.dart';

class TransferSuccessPage extends StatelessWidget {
  final String amount;
  final String beneficiary;
  final String accountNumber;
  final String transferType;
  final String? outsideBank;

  TransferSuccessPage({
    required this.amount,
    required this.beneficiary,
    required this.accountNumber,
    required this.transferType,
    this.outsideBank,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   // title: Text("Transfer Successful",style: TextStyle(
      //   //   fontSize: 20,
      //   //   fontWeight: FontWeight.bold,
      //   //   color: Colors.white,
      //   // ),),
      //   // backgroundColor: Color.fromARGB(255, 30, 60, 100),
      // ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center, // center horizontally
          children: [
            // Asset Image at the top
            Image.asset(
              'assets/transfer_success/transaction_successfull.png', // <-- Make sure you add this image in your assets folder and declare it in pubspec.yaml
              height: 300,
              width: 450,
              fit: BoxFit.contain,
            ),

            SizedBox(height: 20),

            Text(
              "₹$amount transferred successfully!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 20, 40, 80),
              ),
            ),

            SizedBox(height: 20),

            // Details card
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              shadowColor: Colors.blueGrey.withOpacity(0.2),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    detailRow("Beneficiary Name", beneficiary),
                    Divider(),
                    detailRow("Account Number", masked(accountNumber)),
                    Divider(),
                    detailRow("Transfer Type", transferType),
                    if (outsideBank != null) ...[
                      Divider(),
                      detailRow("Bank", outsideBank!),
                    ],
                  ],
                ),
              ),
            ),

            SizedBox(height: 40),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 30, 60, 100),
                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                elevation: 4,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Back to Transfer",
                style: TextStyle(color: Colors.white,fontSize: 25, letterSpacing: 0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget detailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Text(
              "$title:",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 17,
                color: Color.fromARGB(255, 40, 70, 110),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Text(
              value,
              style: TextStyle(
                fontSize: 17,
                color: Color.fromARGB(255, 30, 50, 80),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String masked(String accountNumber)
  {
    String last4 = accountNumber.substring(accountNumber.length - 4);
    return ' **** *** $last4';
  }
}