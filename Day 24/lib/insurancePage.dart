import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee/marquee.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'insuranceCalculatorPage.dart';

void main() {
  runApp(InsurancePage());
}

class AppColors {
  static const pureWhite = Color.fromARGB(255, 255, 255, 255);
  static const softBlueGray = Color.fromARGB(255, 241, 246, 248);
  static const mutedGrayPeach = Color.fromARGB(253, 205, 213, 214);
  static const navyBlueDark = Color.fromARGB(255, 20, 40, 80);
  static const navyBlue = Color.fromARGB(255, 30, 60, 100);
}

class InsurancePage extends StatelessWidget {
  const InsurancePage({super.key});

  @override
  Widget build(BuildContext context) {
    final icons = [
      Icons.account_balance_wallet,
      Icons.shield,
      Icons.assessment,
      Icons.money_outlined,
      Icons.female,
      Icons.male,
      Icons.child_care,
      Icons.lock,
      Icons.emoji_people,
      Icons.business_center,
    ];

    final labels = [
      "ULIP wealth plans",
      "Term life insurance",
      "Term plan with returns",
      "Term plan for salaried",
      "Term insurance for women",
      "Term insurance for men",
      "Child plan",
      "Capital Garuntee",
      "Retirement/Pension plans",
      "Term plan for self employeed",
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
      home: Scaffold(
        body: SingleChildScrollView(
          child: LayoutBuilder(
            builder: (context, constraints) {
              double screenWidth = constraints.maxWidth;

              int columns =
                  screenWidth > 1000
                      ? 5
                      : screenWidth > 800
                      ? 4
                      : screenWidth > 600
                      ? 3
                      : 2;

              double spacing = 10;
              double totalSpacing = (columns - 1) * spacing;
              double boxWidth = (screenWidth - 20 - totalSpacing) / columns;

              return Column(
                children: [
                  // Marquee
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    height: 50,
                    color: AppColors.navyBlueDark,
                    child: Marquee(
                      text:
                          "Plan changing from June 20. Secure your family with top spelling term insurance. Happy life!",
                      blankSpace: 380.0,
                      pauseAfterRound: const Duration(seconds: 1),
                      style: const TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                        color: AppColors.pureWhite,
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Carousel
                  CarouselSlider(
                    items:
                        [
                          'assets/images/banking1.jpg',
                          'assets/images/banking2.jpeg',
                          'assets/images/banking3.jpg',
                        ].map((i) {
                          return Container(
                            width: screenWidth,
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                i,
                                fit: BoxFit.cover,
                                width: screenWidth,
                              ),
                            ),
                          );
                        }).toList(),
                    options: CarouselOptions(
                      height: screenWidth < 600 ? 200 : 300,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      viewportFraction: 1.0,
                    ),
                  ),

                  const SizedBox(height: 50),

                  // Insurance list
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      children: [
                        const Text(
                          "Insurance Plans for all your Goals",
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Wrap(
                          spacing: spacing,
                          runSpacing: 10,
                          children: List.generate(10, (index) {
                            return HoverEffect(
                              iconData: icons[index],
                              label: labels[index],
                              boxWidth: boxWidth,
                            );
                          }),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 50),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        bool isSmallScreen = constraints.maxWidth < 600;

                        final image = ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/images/fam.jpg',
                            fit: BoxFit.contain,
                            height: isSmallScreen ? 240 : 480,
                          ),
                        );

                        final description = Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Empower yourself with comprehensive insights to accurately determine the optimal insurance premium, meticulously tailored to align with your unique financial objectives and life stage requirements.",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                            const SizedBox(height: 30),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) =>
                                            const InsuranceCalculatorPage(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.navyBlue,
                                foregroundColor: AppColors.pureWhite,
                              ),
                              child: const Text("Calculate Insurance"),
                            ),
                          ],
                        );

                        return isSmallScreen
                            ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                image,
                                const SizedBox(height: 20),
                                description,
                              ],
                            )
                            : Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(flex: 2, child: description),
                                const SizedBox(width: 20),
                                Expanded(flex: 3, child: image),
                              ],
                            );
                      },
                    ),
                  ),

                  const SizedBox(height: 50),

                  // FAQ Section
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Frequently Asked Questions",
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 20),
                        ...[
                          {
                            "question": "What is term life insurance?",
                            "answer":
                                "Term life insurance provides coverage for a specific period and pays benefits only if the insured passes away during the term.",
                          },
                          {
                            "question":
                                "How do I choose the right insurance plan?",
                            "answer":
                                "Assess your financial goals, family needs, and risk tolerance, then consult with a professional advisor for personalized recommendations.",
                          },
                          {
                            "question":
                                "Are premiums fixed throughout the policy?",
                            "answer":
                                "Premiums for term plans are usually fixed, but for some plans, they may vary depending on the policy type.",
                          },
                          {
                            "question":
                                "What documents are required to buy insurance?",
                            "answer":
                                "Typically, identity proof, address proof, age proof, income proof, and medical reports are needed.",
                          },
                          {
                            "question":
                                "Can I add riders to my insurance plan?",
                            "answer":
                                "Yes, riders like accidental death benefit or critical illness coverage can be added for enhanced protection.",
                          },
                          {
                            "question":
                                "What happens if I miss a premium payment?",
                            "answer":
                                "Missing payments might lead to policy lapse, but many insurers provide a grace period to pay without losing coverage.",
                          },
                          {
                            "question":
                                "Can I surrender my policy before maturity?",
                            "answer":
                                "Surrendering policies before maturity may lead to loss of benefits or surrender charges; check your policy terms.",
                          },
                        ].map((faq) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: ExpansionTile(
                              title: Text(
                                faq['question']!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0,
                                    vertical: 8.0,
                                  ),
                                  child: Text(
                                    faq['answer']!,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class HoverEffect extends StatefulWidget {
  final IconData iconData;
  final String label;
  final double boxWidth;

  const HoverEffect({
    Key? key,
    required this.iconData,
    required this.label,
    required this.boxWidth,
  }) : super(key: key);

  @override
  State<HoverEffect> createState() => _HoverEffectState();
}

class _HoverEffectState extends State<HoverEffect> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),

      child: Container(
        width: widget.boxWidth,
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: isHovered ? AppColors.navyBlueDark : AppColors.mutedGrayPeach,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Icon(
              widget.iconData,
              size: 30,
              color:
                  isHovered ? AppColors.mutedGrayPeach : AppColors.navyBlueDark,
            ),
            const SizedBox(height: 8),
            Text(
              widget.label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color:
                    isHovered
                        ? AppColors.mutedGrayPeach
                        : AppColors.navyBlueDark,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
