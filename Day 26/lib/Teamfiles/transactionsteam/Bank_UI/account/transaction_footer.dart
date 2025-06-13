import 'package:flutter/material.dart';
import 'transactions.dart';

void main() {
  runApp(MyBankApp());
}

class MyBankApp extends StatelessWidget {
  const MyBankApp({super.key});

  static const pureWhite = Color.fromARGB(255, 255, 255, 255);
  static const softBlueGray = Color.fromARGB(255, 241, 246, 248);
  static const mutedGrayPeach = Color.fromARGB(253, 205, 213, 214);
  static const navyBlueDark = Color.fromARGB(255, 20, 40, 80);
  static const navyBlue = Color.fromARGB(255, 30, 60, 100);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: pureWhite,
        fontFamily: 'Poppins',
        appBarTheme: AppBarTheme(
          backgroundColor: navyBlue,
          titleTextStyle: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: pureWhite,
          ),
          centerTitle: true,
          elevation: 2,
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: navyBlueDark, fontSize: 16),
          bodyMedium: TextStyle(color: navyBlueDark, fontSize: 14),
          titleMedium: TextStyle(color: navyBlueDark, fontSize: 14),
          titleSmall: TextStyle(color: navyBlueDark, fontSize: 13),
          titleLarge: TextStyle(
            color: navyBlueDark,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
      home: TransactionPage1(),
    );
  }
}

class TransactionPage1 extends StatelessWidget {
  const TransactionPage1({super.key});

  static const softBlueGray = Color.fromARGB(255, 241, 246, 248);
  static const mutedGrayPeach = Color.fromARGB(253, 205, 213, 214);
  static const navyBlueDark = Color.fromARGB(255, 20, 40, 80);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Transaction History",style: TextStyle(color: Colors.white)),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView.separated(
            physics: BouncingScrollPhysics(),
            itemCount: trans.length,
            separatorBuilder: (context, index) => SizedBox(height: 12),
            itemBuilder: (context, index) {
              return getTransactionTile(context, index, theme);
            },
          ),
        ),
      ),
    );
  }

  Widget getTransactionTile(BuildContext context, int index, ThemeData theme) {
    final txn = trans[index];
    final isCredit = txn.type == "Credit";

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [softBlueGray, mutedGrayPeach],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(12),
        leading: CircleAvatar(
          backgroundImage: AssetImage(txn.image),
          radius: 28,
        ),
        title: Text(
          txn.recipient,
          style: theme.textTheme.titleLarge,
        ),
        subtitle: Text(
          txn.date,
          style: theme.textTheme.titleSmall,
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${isCredit ? "+" : "-"} ₹${txn.amount}",
              style: TextStyle(
                color: isCredit ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 16,
                fontFamily: 'Poppins',
              ),
            ),
            Text(
              txn.type,
              style: TextStyle(
                color: isCredit ? Colors.green : Colors.red,
                fontSize: 13,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
