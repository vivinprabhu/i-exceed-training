import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: TransactionAnalysisPage(),
  ));
}

class Transaction {
  String type; // "Credit" or "Debit"
  double amount;
  String date;

  Transaction({
    required this.type,
    required this.amount,
    required this.date,
  });
}

List<Transaction> trans = [
  Transaction(type: "Debit", amount: 1250.75, date: "2025-01-10"),
  Transaction(type: "Credit", amount: 50000.00, date: "2025-01-11"),
  Transaction(type: "Debit", amount: 1850.25, date: "2025-02-28"),
  Transaction(type: "Credit", amount: 299.00, date: "2025-03-25"),
  Transaction(type: "Debit", amount: 2000.00, date: "2025-03-30"),
  Transaction(type: "Debit", amount: 999.00, date: "2025-04-20"),
  Transaction(type: "Debit", amount: 450.75, date: "2025-05-18"),
  Transaction(type: "Debit", amount: 649.00, date: "2025-05-15"),
  Transaction(type: "Credit", amount: 1200.00, date: "2025-06-12"),
  Transaction(type: "Credit", amount: 980.00, date: "2025-06-10"),
  Transaction(type: "Debit", amount: 1125.30, date: "2025-07-08"),
  Transaction(type: "Credit", amount: 100.00, date: "2025-07-05"),
];

class TransactionAnalysisPage extends StatefulWidget {
  const TransactionAnalysisPage({super.key});

  @override
  State<TransactionAnalysisPage> createState() =>
      _TransactionAnalysisPageState();
}

class _TransactionAnalysisPageState extends State<TransactionAnalysisPage> {
  List<String> getSortedMonths(List<Transaction> trans) {
    var monthSet = <String>{};
    for (var t in trans) {
      monthSet.add(t.date.substring(0, 7)); // yyyy-MM
    }
    var months = monthSet.toList();
    months.sort();
    return months;
  }

  Map<String, double> getMonthlyDebitTotals(List<Transaction> trans) {
    Map<String, double> monthlyDebits = {};
    for (var t in trans) {
      if (t.type == "Debit") {
        String monthKey = t.date.substring(0, 7);
        monthlyDebits[monthKey] =
            (monthlyDebits[monthKey] ?? 0) + t.amount;
      }
    }
    return monthlyDebits;
  }

  List<FlSpot> getMonthlyDebitSpots(List<Transaction> trans) {
    var monthlyDebits = getMonthlyDebitTotals(trans);
    var months = getSortedMonths(trans);

    List<FlSpot> spots = [];
    for (int i = 0; i < months.length; i++) {
      double debit = monthlyDebits[months[i]] ?? 0;
      spots.add(FlSpot(i.toDouble(), debit));
    }
    return spots;
  }

  double getTotalByType(String type) {
    return trans
        .where((t) => t.type == type)
        .fold(0.0, (sum, t) => sum + t.amount);
  }

  @override
  Widget build(BuildContext context) {
    final balanceSpots = getMonthlyDebitSpots(trans);
    final months = getSortedMonths(trans);
    final totalCredit = getTotalByType("Credit");
    final totalDebit = getTotalByType("Debit");

    double maxY = balanceSpots.isNotEmpty
        ? balanceSpots.map((e) => e.y).reduce((a, b) => a > b ? a : b)
        : 0;
    maxY += 2000;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            double width = constraints.maxWidth;
            double chartHeight = width < 600 ? 240 : 320;
            double fontSize = width < 600 ? 12 : 16;

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back_ios,
                        color: Color.fromARGB(255, 30, 60, 100)),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        amountColumn("Total Credit", totalCredit, fontSize),
                        const SizedBox(
                          height: 45,
                          child: VerticalDivider(
                              color: Color.fromARGB(255, 30, 60, 100)),
                        ),
                        amountColumn("Total Debit", totalDebit, fontSize),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    height: chartHeight,
                    child: LineChart(
                      LineChartData(
                        gridData: const FlGridData(show: false),
                        borderData: FlBorderData(show: false),
                        lineBarsData: [
                          LineChartBarData(
                            spots: balanceSpots,
                            isCurved: true,
                            color: const Color.fromARGB(255, 30, 60, 100),
                            barWidth: 5,
                            dotData: const FlDotData(show: false),
                            belowBarData: BarAreaData(
                              show: true,
                              color: const Color.fromARGB(255, 30, 60, 100)
                                  .withOpacity(0.3),
                            ),
                          ),
                        ],
                        titlesData: FlTitlesData(
                          rightTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false)),
                          topTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false)),
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              interval: 1000,
                              getTitlesWidget: (value, _) => Text(
                                '₹${(value ~/ 1000)}k',
                                style: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 30, 60, 100),
                                  fontSize: fontSize,
                                ),
                              ),
                            ),
                          ),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              interval: 1,
                              getTitlesWidget: (value, meta) {
                                int index = value.toInt();
                                if (index >= 0 && index < months.length) {
                                  DateTime dt = DateFormat("yyyy-MM")
                                      .parse(months[index]);
                                  String monthName =
                                      DateFormat.MMM().format(dt);
                                  return Text(
                                    monthName,
                                    style: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 30, 60, 100),
                                        fontSize: fontSize),
                                  );
                                }
                                return const Text('');
                              },
                            ),
                          ),
                        ),
                        minX: 0,
                        maxX: months.isNotEmpty
                            ? (months.length - 1).toDouble()
                            : 0,
                        minY: 0,
                        maxY: maxY,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget amountColumn(String title, double amount, double fontSize) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: fontSize,
              color: const Color.fromARGB(255, 30, 60, 100)),
        ),
        Text(
          "₹${amount.toStringAsFixed(2)}",
          style: TextStyle(
              fontSize: fontSize + 10,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 30, 60, 100)),
        ),
      ],
    );
  }
}
