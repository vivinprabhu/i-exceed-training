// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:intl/intl.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';
// import 'package:url_launcher/url_launcher.dart';

// // Import all page files
// import 'pages/customer_services_page.dart';
// import 'pages/update_personal_details_page.dart';
// import 'pages/block_card_page.dart';
// import 'pages/request_new_card_page.dart';
// import 'pages/card_limitations_page.dart';
// import 'pages/faq_page.dart';
// import 'pages/settings_page.dart';
// import 'pages/change_pin_page.dart';
// import 'pages/update_password_page.dart';
// import 'pages/sms_alerts_page.dart';
// import 'pages/contact_us_page.dart';
// import 'pages/raise_complaint_page.dart';
// import 'pages/language_settings_page.dart';
// import 'pages/privacy_security_page.dart';
// import 'pages/card_blocked_confirmation_page.dart';
// import 'utils/app_colors.dart';
// import 'utils/helpers.dart';

// void main() {
//   runApp(const MyBankingApp());
// }

// class MyBankingApp extends StatelessWidget {
//   const MyBankingApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
      // theme: ThemeData(
      //   scaffoldBackgroundColor: AppColors.pureWhite,
      //   fontFamily: "serif",
      //   appBarTheme: const AppBarTheme(
      //     backgroundColor: AppColors.navyBlue,
      //     foregroundColor: Colors.white,
      //   ),
      //   cardColor: AppColors.lighterBlue,
      //   elevatedButtonTheme: ElevatedButtonThemeData(
      //     style: ElevatedButton.styleFrom(
      //       backgroundColor: AppColors.navyBlue,
      //       foregroundColor: Colors.white,
      //       padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
      //       textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      //     ),
      //   ),
      //   snackBarTheme: const SnackBarThemeData(
      //     backgroundColor: AppColors.navyBlue,
      //   ),
      //   inputDecorationTheme: const InputDecorationTheme(
      //     filled: true,
      //     fillColor: Colors.white,
      //   ),
      //   textTheme: const TextTheme(
      //     bodyMedium: TextStyle(color: AppColors.navyBlueDark),
      //   ),
      //   checkboxTheme: CheckboxThemeData(
      //     checkColor: MaterialStateProperty.all(AppColors.pureWhite),
      //     fillColor: MaterialStateProperty.all(AppColors.navyBlue),
      //   ),
      //   radioTheme: RadioThemeData(
      //     fillColor: MaterialStateProperty.all(AppColors.navyBlue),
      //   ),
      // ),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => const CustomerServicesPage(),
      //   '/block-card': (context) => const BlockDebitCardPage(),
      //   '/request-card': (context) => RequestNewCardPage(),
      //   '/set-limits': (context) => CardLimitationsPage(),
      //   '/faq': (context) => const FAQPage(),
      //   '/settings': (context) => const YonoSettingsPage(),
      //   '/change-pin': (context) => const ChangePinScreen(),
      //   '/update-password': (context) => const UpdatePasswordScreen(),
      //   '/sms-alerts': (context) => const SmsAlertActivationPage(),
      //   '/contact-us': (context) => const ContactUsPage(),
      //   '/raise-complaint': (context) => const RaiseComplaintPage(),
      //   '/language-settings': (context) => const LanguageSettingsPage(),
      //   '/privacy-security': (context) => const PrivacySecurityPage(),
      //   '/update-profile': (context) => const UpdatePersonalDetailsScreen(),
      // },
//     );
//   }
// }