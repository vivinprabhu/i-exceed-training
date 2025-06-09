import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:marquee/marquee.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
      home: Scaffold(
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10.0),
              height: 50,
              color: Color(0xFFA899CCFF),
              child: Marquee(
                text:
                    "Plan changing from June 20. Secure your family with top spelling term insurance. Happy life!",
                blankSpace: 380.0,
                pauseAfterRound: Duration(seconds: 1),
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14),
              ),
            ),

            Container(
              padding: EdgeInsets.all(25.0),
              child: CarouselSlider(
                items:
                    [
                      'assets/images/banking1.jpg',
                      'assets/images/banking2.jpeg',
                      'assets/images/banking3.jpg',
                    ].map((i) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          // color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Image.asset(i),
                      );
                    }).toList(),
                options: CarouselOptions(
                  height: 300,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Text(
                    "Insurance plans for all your goals",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 16,
                    ),
                  ),

                  SizedBox(height: 20),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
