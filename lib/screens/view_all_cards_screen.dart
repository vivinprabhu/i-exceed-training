import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewAllCardsPage extends StatelessWidget {
  const ViewAllCardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardStart = isDark ? Colors.grey[800]! : const Color(0xFF1E3C72);
    final cardEnd = isDark ? Colors.grey[700]! : const Color(0xFF2A5298);
    final textColor = isDark ? Colors.white : const Color(0xFFEFF6FF);
    final accentColor = isDark ? Colors.white : const Color(0xFF1E3C64);

    return Scaffold(
      appBar: AppBar(
        title: Text('All Cards', style: GoogleFonts.poppins(color: Colors.white)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildCardContainer(
            context,
            _buildBalanceCard(textColor, accentColor),
            cardStart,
            cardEnd,
          ),
          const SizedBox(height: 20),
          _buildCardContainer(
            context,
            _buildInfoCard(
              'Credit Card Summary',
              'Next bill: ₹ 3,200 on June 25',
              textColor,
            ),
            cardStart,
            cardEnd,
          ),
          const SizedBox(height: 20),
          _buildCardContainer(
            context,
            _buildInfoCard(
              'Upcoming Bills',
              'Electricity & Internet due this week',
              textColor,
            ),
            cardStart,
            cardEnd,
          ),
          const SizedBox(height: 20),
          _buildCardContainer(
            context,
            _buildInfoCard(
              'Investments',
              'Mutual funds up 4.2% this month',
              textColor,
            ),
            cardStart,
            cardEnd,
          ),
        ],
      ),
    );
  }

  Widget _buildCardContainer(BuildContext context, Widget child, Color cardStart, Color cardEnd) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [cardStart, cardEnd],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: child,
    );
  }

  Widget _buildBalanceCard(Color textColor, Color accentColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Account Number", style: GoogleFonts.poppins(color: textColor)),
        const SizedBox(height: 4),
        Text("1234 5678 9012 3456",
            style: GoogleFonts.poppins(
                color: textColor, fontSize: 18, fontWeight: FontWeight.bold)),
        const Spacer(),
        Text("Balance", style: GoogleFonts.poppins(color: textColor)),
        const SizedBox(height: 4),
        Text("₹ 58,450.75",
            style: GoogleFonts.poppins(
                color: textColor, fontSize: 22, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Text("Account Type: Savings",
            style: GoogleFonts.poppins(color: textColor)),
      ],
    );
  }

  Widget _buildInfoCard(String title, String description, Color textColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: GoogleFonts.poppins(
                color: textColor, fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        Text(description, style: GoogleFonts.poppins(color: textColor)),
      ],
    );
  }
}
