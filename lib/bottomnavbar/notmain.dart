import 'package:flutter/material.dart';
import 'colors.dart';
import 'search_page.dart';
import 'alerts_page.dart';
import 'qr_scanner_page.dart';

void main() {
  runApp(const MyBankApp());
}

class MyBankApp extends StatelessWidget {
  const MyBankApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bank',
      theme: ThemeData(
        primaryColor: AppColors.navyBlue,
        scaffoldBackgroundColor: AppColors.pureWhite,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.navyBlue,
          foregroundColor: AppColors.pureWhite,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.softBlueGray,
          selectedItemColor: AppColors.navyBlueDark,
          unselectedItemColor: AppColors.navyBlueDark,
        ),
      ),
      home: const MainDashboard(),
    );
  }
}

class MainDashboard extends StatefulWidget {
  const MainDashboard({super.key});

  @override
  State<MainDashboard> createState() => MainDashboardState();
}

class MainDashboardState extends State<MainDashboard> {
  int selectedIndex = 1;

  final List<Widget> _pages = [
    const Center(child: Text('🏦 Home Page', style: TextStyle(fontSize: 20))),
    SearchPage(),
    QrScannerPage(),
    AlertsPage(),
    const Center(
      child: Text('📜 History Page', style: TextStyle(fontSize: 20)),
    ),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SGS Bank')),
      body: _pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner),
            label: 'QR',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            label: 'Alerts',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
        ],
      ),
    );
  }

  // @override
  // dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
