import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import '../utils/app_colors.dart';
import '../utils/helpers.dart';

class CardBlockedConfirmationPage extends StatelessWidget {
  final String last4Digits;
  final String reason;
  final String dateTime;
  final String referenceNumber;
  final String cardType;

  const CardBlockedConfirmationPage({
    super.key,
    required this.last4Digits,
    required this.reason,
    required this.dateTime,
    required this.referenceNumber,
    required this.cardType,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Confirmation")),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final bool isWide = constraints.maxWidth > 600;

          return Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: isWide ? 600 : double.infinity,
                ),
                child: Container(
                  decoration: getCardBoxDecoration(),
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Icon(FontAwesomeIcons.circleCheck,
                            color: Colors.green, size: 80),
                      ),
                      const SizedBox(height: 20),
                      const Center(
                        child: Text(
                          "Card Blocked Successfully!",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Divider(height: 30, thickness: 1.5),
                      infoRow("Card Type", cardType),
                      infoRow("Card Ending", "**** $last4Digits"),
                      infoRow("Reason", reason),
                      infoRow("Date & Time", dateTime),
                      infoRow("Reference No", referenceNumber),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: ElevatedButton.icon(
                              onPressed: () => _generatePdf(context),
                              icon: const Icon(Icons.picture_as_pdf),
                              label: const Text("Download PDF"),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.indigo,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 14, horizontal: 18),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: ElevatedButton.icon(
                              onPressed: () => Navigator.popUntil(
                                context,
                                ModalRoute.withName('/'),
                              ),
                              icon: const Icon(Icons.home),
                              label: const Text("Back to Home"),
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 14, horizontal: 18),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              "$label:",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(value, softWrap: true),
          ),
        ],
      ),
    );
  }

  void _generatePdf(BuildContext context) async {
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text("Card Block Confirmation",
                style: pw.TextStyle(
                    fontSize: 22, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 30),
            _pdfRow("Card Type", cardType),
            _pdfRow("Card Ending", "**** $last4Digits"),
            _pdfRow("Reason", reason),
            _pdfRow("Date & Time", dateTime),
            _pdfRow("Reference No", referenceNumber),
            pw.SizedBox(height: 40),
            pw.Text(
              "This is a system-generated confirmation. No signature required.",
              style:
                  pw.TextStyle(fontStyle: pw.FontStyle.italic, fontSize: 10),
            ),
          ],
        ),
      ),
    );

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
      name: 'Card_Block_Confirmation.pdf',
    );
  }

  pw.Widget _pdfRow(String label, String value) {
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(vertical: 6),
      child: pw.Row(
        children: [
          pw.Expanded(
            flex: 3,
            child: pw.Text("$label:",
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
          ),
          pw.Expanded(flex: 5, child: pw.Text(value)),
        ],
      ),
    );
  }
}
