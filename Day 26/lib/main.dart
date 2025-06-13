import 'package:bank_ui/Teamfiles/loginteam/login/forgot_passkey.dart';
import 'package:bank_ui/Teamfiles/loginteam/login/register.dart';
import 'package:bank_ui/Teamfiles/loginteam/login/set_passkey.dart';
import 'package:bank_ui/Teamfiles/loginteam/login/user_register.dart';
import 'package:bank_ui/Teamfiles/loginteam/login/userlogin.dart';
import 'package:bank_ui/Teamfiles/supportteam/CustomerService/pages/block_card_page.dart';
import 'package:bank_ui/Teamfiles/supportteam/CustomerService/pages/card_limitations_page.dart';
import 'package:bank_ui/Teamfiles/supportteam/CustomerService/pages/change_pin_page.dart';
import 'package:bank_ui/Teamfiles/supportteam/CustomerService/pages/contact_us_page.dart';
import 'package:bank_ui/Teamfiles/supportteam/CustomerService/pages/customer_services_page.dart';
import 'package:bank_ui/Teamfiles/supportteam/CustomerService/pages/faq_page.dart';
import 'package:bank_ui/Teamfiles/supportteam/CustomerService/pages/language_settings_page.dart';
import 'package:bank_ui/Teamfiles/supportteam/CustomerService/pages/privacy_security_page.dart';
import 'package:bank_ui/Teamfiles/supportteam/CustomerService/pages/raise_complaint_page.dart';
import 'package:bank_ui/Teamfiles/supportteam/CustomerService/pages/request_new_card_page.dart';
import 'package:bank_ui/Teamfiles/supportteam/CustomerService/pages/settings_page.dart';
import 'package:bank_ui/Teamfiles/supportteam/CustomerService/pages/sms_alerts_page.dart';
import 'package:bank_ui/Teamfiles/supportteam/CustomerService/pages/update_password_page.dart';
import 'package:bank_ui/Teamfiles/supportteam/CustomerService/pages/update_personal_details_page.dart';
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/support_screen.dart';
import 'screens/settings_screen.dart';
import 'theme/light_theme.dart';
import 'theme/dark_theme.dart';

//page imports



void main() => runApp(MyBankApp());

class MyBankApp extends StatefulWidget {
  @override
  State<MyBankApp> createState() => _MyBankAppState();
}

class _MyBankAppState extends State<MyBankApp> {
  bool isDarkMode = false;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Banking App',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      initialRoute: '/home',
      routes: {
        '/home': (context) => CombinedLogin(),
        '/user': (context) => UsernamePage(),
        '/register': (context) => RegisterPage(),
        '/set_passkey': (context) => SetPasskeyPage(),
        '/forgot_passkey': (context) => ForgotPasskeyPage(),
        '/': (context) => HomeScreen(toggleTheme: toggleTheme),
        '/profile': (context) => ProfileScreen(),
        '/support': (context) => SupportScreen(),
        '/settings1': (context) => SettingsScreen(),
        '/customer-services': (context) => const CustomerServicesPage(),
        '/block-card': (context) => const BlockDebitCardPage(),
        '/request-card': (context) => RequestNewCardPage(),
        '/set-limits': (context) => CardLimitationsPage(),
        '/faq': (context) => const FAQPage(),
        '/settings': (context) => const YonoSettingsPage(),
        '/change-pin': (context) => const ChangePinScreen(),
        '/update-password': (context) => const UpdatePasswordScreen(),
        '/sms-alerts': (context) => const SmsAlertActivationPage(),
        '/contact-us': (context) => const ContactUsPage(),
        '/raise-complaint': (context) => const RaiseComplaintPage(),
        '/language-settings': (context) => const LanguageSettingsPage(),
        '/privacy-security': (context) => const PrivacySecurityPage(),
        '/update-profile': (context) => const UpdatePersonalDetailsScreen(),
      },
    );
  }
}

class MyBankingApp extends StatelessWidget {
  const MyBankingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomerServicesPage();}}
