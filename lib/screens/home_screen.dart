import 'package:bank_ui/Teamfiles/loansteam/insurance/insuranceCalculatorPage.dart';
import 'package:bank_ui/Teamfiles/loansteam/insurance/insurancePage.dart';
import 'package:bank_ui/Teamfiles/loansteam/loan/emi.dart';
import 'package:bank_ui/Teamfiles/loansteam/loan/loan_page.dart';
import 'package:bank_ui/Teamfiles/transactionsteam/Bank_UI/Offers/rewards.dart';
import 'package:bank_ui/Teamfiles/transactionsteam/Bank_UI/account/balance.dart';
import 'package:bank_ui/Teamfiles/transactionsteam/Bank_UI/account/transaction_footer.dart';
import 'package:bank_ui/Teamfiles/transactionsteam/Bank_UI/account/transactions_history.dart';
import 'package:bank_ui/Teamfiles/transactionsteam/Bank_UI/transfer%20money/money.dart';
import 'package:bank_ui/Teamfiles/transactionsteam/billpayment/billpayment.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/main_card_carousel.dart';
import '../widgets/drawer_menu.dart';
import 'view_all_cards_screen.dart';
import 'catcardspages.dart';
import '../bottomnavbar/alerts_page.dart';
import '../bottomnavbar/qr_scanner_page.dart';
import '../bottomnavbar/search_page.dart';

enum HomeCategory { transact, invest, loans }
String? displayName = 'User';

class HomeScreen extends StatefulWidget {
  final VoidCallback toggleTheme;
  const HomeScreen({super.key, required this.toggleTheme});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  
  
  bool _argsHandled = false;
  HomeCategory selectedCategory = HomeCategory.transact;

  final hoverStates = <int, bool>{};

  final List<Widget> _screens = [
    const Placeholder(), // will replace this with main home content
    SearchPage(),
    QrScannerPage(),
    AlertsPage(),
    TransactionPage1(),
  ];

  final Map<HomeCategory, List<Map<String, dynamic>>> categoryCards = {
    HomeCategory.transact: [
      {
        'icon': Icons.send,
        'label': 'Send Money',
        'onPressed': (BuildContext context) {
          Navigator.push(context, MaterialPageRoute(builder: (_) => FundTransferPage()));
        },
      },
      {
        'icon': Icons.receipt,
        'label': 'Bill Pay',
        'onPressed': (BuildContext context) {
          Navigator.push(context, MaterialPageRoute(builder: (_) => BillPaymentPage()));
        },
      },
      {
        'icon': Icons.local_offer,
        'label': 'Rewards',
        'onPressed': (BuildContext context) {
          Navigator.push(context, MaterialPageRoute(builder: (_) => RewardsPage()));
        },
      },
      {
        'icon': Icons.account_balance,
        'label': 'Accounts',
        'onPressed': (BuildContext context) {
          Navigator.push(context, MaterialPageRoute(builder: (_) => AccountPage()));
        },
      },
      {
        'icon': Icons.credit_card,
        'label': 'Cards / PayLater',
        'onPressed': (BuildContext context) {
          Navigator.push(context, MaterialPageRoute(builder: (_) => const CardsPayLaterScreen()));
        },
      },
      {
        'icon': Icons.account_balance_wallet,
        'label': 'UPI Payments',
        'onPressed': (BuildContext context) {
          Navigator.push(context, MaterialPageRoute(builder: (_) => const UpiPaymentsScreen()));
        },
      },
    ],
    HomeCategory.invest: [
      {
        'icon': Icons.trending_up,
        'label': 'Mutual Funds',
        'onPressed': (BuildContext context) {
          Navigator.push(context, MaterialPageRoute(builder: (_) => const MutualFundsScreen()));
        },
      },
      {
        'icon': Icons.savings,
        'label': 'SIP',
        'onPressed': (BuildContext context) {
          Navigator.push(context, MaterialPageRoute(builder: (_) => const SIPScreen()));
        },
      },
      {
        'icon': Icons.insights,
        'label': 'Market Insights',
        'onPressed': (BuildContext context) {
          Navigator.push(context, MaterialPageRoute(builder: (_) => const MarketInsightsScreen()));
        },
      },
    ],
    HomeCategory.loans: [
      {
        'icon': Icons.money,
        'label': 'Get Loan',
        'onPressed': (BuildContext context) {
          Navigator.push(context, MaterialPageRoute(builder: (_) => LoanPage()));
        },
      },
      {
        'icon': Icons.calculate,
        'label': 'EMI Calculator',
        'onPressed': (BuildContext context) {
          Navigator.push(context, MaterialPageRoute(builder: (_) => const EMICalculatorPage()));
        },
      },
      {
        'icon': Icons.verified_user,
        'label': 'Insurance',
        'onPressed': (BuildContext context) {
          Navigator.push(context, MaterialPageRoute(builder: (_) => const InsurancePage()));
        },
      },
      {
        'icon': Icons.verified_user,
        'label': 'Insurance Calculator',
        'onPressed': (BuildContext context) {
          Navigator.push(context, MaterialPageRoute(builder: (_) => const InsuranceCalculatorPage()));
        },
      },
    ],
  };

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  @override

  


  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardStart = isDark ? Colors.grey[800]! : const Color(0xFFF1F6F8);
    final cardEnd = isDark ? Colors.grey[700]! : const Color(0xFFCDD5D6);
    final textColor = isDark ? Colors.white : const Color(0xFF142850);
    final accentColor = isDark ? Colors.white : const Color(0xFF1E3C64);
   final args = ModalRoute.of(context)?.settings.arguments;
final displayName = (args is Map && args['displayName'] != null) ? args['displayName'] as String : 'User';



    return Scaffold(
      appBar: AppBar(
        title: Text("Hi, $displayName", style: GoogleFonts.poppins(fontSize: 20, color: Colors.white)),
        actions: [
  IconButton(
    icon: const Icon(Icons.notifications_none),
    onPressed: () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Notifications"),
            content: const Text("You have no new notifications."),
            actions: [
              TextButton(
                child: const Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    },
  ),
],
        toolbarHeight: 70,
      ),
      drawer: DrawerMenu(toggleTheme: widget.toggleTheme),
      body: _selectedIndex == 0
          ? _buildMainBody(cardStart, cardEnd, textColor, accentColor)
          : _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: accentColor,
        unselectedItemColor: textColor.withOpacity(0.5),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.qr_code), label: "QR"),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_none), label: "Alerts"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
        ],
      ),
    );
  }

  Widget _buildMainBody(Color cardStart, Color cardEnd, Color textColor, Color accentColor) {
    final args = ModalRoute.of(context)?.settings.arguments;

final accNum = (args is Map && args['accNum'] != null) ? args['accNum'] as double : 0.0;

    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 16),
           MainCardCarousel(accNum: accNum)
,
          const SizedBox(height: 8),
          Center(
            child: TextButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ViewAllCardsPage())),
              child: Text("View All", style: GoogleFonts.poppins(color: accentColor)),
            ),
          ),
          const SizedBox(height: 8),
          _buildCategorySegmented(textColor, accentColor),
          const SizedBox(height: 16),
          _buildCategoryGrid(cardStart, cardEnd, textColor, accentColor),
        ],
      ),
    );
  }

  Widget _buildCategorySegmented(Color textColor, Color accentColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SegmentedButton<HomeCategory>(
        segments: const [
          ButtonSegment(value: HomeCategory.transact, label: Text('Transact')),
          ButtonSegment(value: HomeCategory.invest, label: Text('Invest')),
          ButtonSegment(value: HomeCategory.loans, label: Text('Loans')),
        ],
        selected: {selectedCategory},
        onSelectionChanged: (newSelection) {
          setState(() {
            selectedCategory = newSelection.first;
          });
        },
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(GoogleFonts.poppins(fontWeight: FontWeight.w600)),
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) return accentColor;
            return Colors.transparent;
          }),
          foregroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) return Colors.white;
            return textColor;
          }),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
          side: MaterialStateProperty.all(BorderSide(color: accentColor)),
        ),
      ),
    );
  }

  Widget _buildCategoryGrid(Color cardStart, Color cardEnd, Color textColor, Color accentColor) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      child: Padding(
        key: ValueKey<HomeCategory>(selectedCategory),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: categoryCards[selectedCategory]!.length,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            final card = categoryCards[selectedCategory]![index];
            return ElevatedButton(
              onPressed: () => card['onPressed'](context),
              style: ElevatedButton.styleFrom(
                backgroundColor: cardStart,
                foregroundColor: textColor,
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                padding: const EdgeInsets.symmetric(vertical: 8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(card['icon'], size: 28, color: textColor),
                  const SizedBox(height: 8),
                  Text(card['label'], textAlign: TextAlign.center, style: GoogleFonts.poppins(fontSize: 12, color: textColor)),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
