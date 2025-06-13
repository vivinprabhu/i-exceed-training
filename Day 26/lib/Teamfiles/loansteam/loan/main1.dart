import 'package:bank_ui/Teamfiles/loansteam/loan/loan_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Banking Loans',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.white,),
      home: LoanPage(),
    );
  }
}

