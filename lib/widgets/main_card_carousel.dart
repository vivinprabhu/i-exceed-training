import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

class MainCardCarousel extends StatefulWidget {
  final double accNum;
  const MainCardCarousel({super.key, required this.accNum});

  @override
  State<MainCardCarousel> createState() => _MainCardCarouselState();
}


class _MainCardCarouselState extends State<MainCardCarousel>
    with SingleTickerProviderStateMixin {
      

  final PageController _controller = PageController(viewportFraction: 0.9);
  bool _isFront = true;
  late AnimationController _flipController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _flipController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _flipController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _flipController.dispose();
    _controller.dispose();
    super.dispose();
  }

  final gradient = const LinearGradient(
    colors: [Color(0xFF1E3C64), Color(0xFF5F72BE)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = Colors.white;
    final accentColor = isDark ? Colors.blue[200]! : Colors.white;
final accNum = widget.accNum;
    return SizedBox(
      height: 220,
      child: PageView.builder(
        controller: _controller,
        itemCount: 4,
        itemBuilder: (context, index) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              gradient: gradient,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: _buildCardContent(index, textColor, accentColor),
          );
        },
      ),
    );
  }

  Widget _buildCardContent(int index, Color textColor, Color accentColor) {
    if (index == 0) {
      return GestureDetector(
        onTap: () {
          _isFront ? _flipController.forward() : _flipController.reverse();
          _isFront = !_isFront;
        },
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            final angle = _animation.value * pi;
            final transform = Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(angle);
            return Transform(
              transform: transform,
              alignment: Alignment.center,
              child: _animation.value <= 0.5
                  ? _buildFrontCard(textColor, accentColor)
                  : Transform(
                      transform: Matrix4.rotationY(pi),
                      alignment: Alignment.center,
                      child: _buildBackCard(textColor),
                    ),
            );
          },
        ),
      );
    } else {
      return _buildStaticCard(index, textColor);
    }
  }

  Widget _buildFrontCard(Color textColor, Color accentColor) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Account Number", style: GoogleFonts.poppins(color: textColor)),
          const SizedBox(height: 6),
          Text(widget.accNum.toStringAsFixed(0),

              style: GoogleFonts.poppins(
                  color: textColor, fontSize: 18, fontWeight: FontWeight.bold)),
          const Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.blue.shade900,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              _isFront ? _flipController.forward() : _flipController.reverse();
              _isFront = !_isFront;
            },
            child: const Text("View Balance"),
          )
        ],
      ),
    );
  }

  Widget _buildBackCard(Color textColor) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Balance", style: GoogleFonts.poppins(color: textColor)),
          const SizedBox(height: 6),
          Text("₹ 58,450.75",
              style: GoogleFonts.poppins(
                  color: textColor, fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 14),
          Text("Account Type: Savings",
              style: GoogleFonts.poppins(color: textColor)),
          const Spacer(),
          TextButton(
            onPressed: () {
              _isFront ? _flipController.forward() : _flipController.reverse();
              _isFront = !_isFront;
            },
            child: const Text("Hide Balance", style: TextStyle(color: Colors.white)),
          )
        ],
      ),
    );
  }

  Widget _buildStaticCard(int index, Color textColor) {
    final titles = ["Credit Card Summary", "Upcoming Bills", "Investments"];
    final descriptions = [
      "Next bill: ₹ 3,200 on June 25",
      "Electricity & Internet due this week",
      "Mutual funds up 4.2% this month"
    ];

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(titles[index - 1],
              style: GoogleFonts.poppins(
                  color: textColor, fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Text(descriptions[index - 1],
              style: GoogleFonts.poppins(color: textColor)),
        ],
      ),
    );
  }
}
