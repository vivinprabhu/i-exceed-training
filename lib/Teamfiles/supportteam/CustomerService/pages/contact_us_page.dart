import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/app_colors.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  Widget _buildSectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.navyBlueDark,
        ),
      ),
    );
  }

  Widget _buildContactCard(
      IconData icon, String label, String value, BuildContext context) {
    return Card(
      color: AppColors.softBlueGray,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: AppColors.navyBlue),
        title: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(value),
      ),
    );
  }

  Widget _buildSocialIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSocialButton(Icons.facebook, "https://facebook.com"),
        _buildSocialButton(Icons.alternate_email, "https://twitter.com"),
        _buildSocialButton(Icons.link, "https://linkedin.com"),
      ],
    );
  }

  Widget _buildSocialButton(IconData icon, String url) {
    return Material(
      shape: const CircleBorder(),
      color: Colors.grey.shade200,
      child: InkWell(
        onTap: () => _launchURL(url),
        customBorder: const CircleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Icon(icon, color: AppColors.navyBlue),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController messageController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.pureWhite,
      appBar: AppBar(
        title: const Text("Contact Us"),
        backgroundColor: AppColors.navyBlue,
        foregroundColor: AppColors.pureWhite,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const Text(
              "📞 Let's get in touch",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: AppColors.navyBlueDark,
              ),
            ),
            const SizedBox(height: 8),
            const Text("We're here to help you anytime."),

            _buildSectionTitle("Reach Our Support Team"),

            _buildContactCard(
              Icons.phone,
              "Phone",
              "+91-9876543210",
              context,
            ),
            _buildContactCard(
              Icons.email,
              "Email",
              "support@yourbank.com",
              context,
            ),
            _buildContactCard(
              Icons.location_on,
              "Address",
              "123, Financial Road, Mumbai, India",
              context,
            ),

            _buildSectionTitle("Customer Care Hours"),
            const Text("Mon–Sat: 9:00 AM – 6:00 PM"),
            const Text("Sunday: Closed"),
            const SizedBox(height: 8),
            Row(
              children: const [
                Icon(Icons.circle, color: Colors.green, size: 12),
                SizedBox(width: 6),
                Text("Support is online"),
              ],
            ),

            _buildSectionTitle("Send us a Message"),
            TextField(
              controller: messageController,
              maxLines: 4,
              decoration: InputDecoration(
                labelText: "Your Message",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (messageController.text.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Row(
                          children: const [
                            Icon(Icons.error_outline, color: Colors.white),
                            SizedBox(width: 10),
                            Text("Please fill in the message before sending."),
                          ],
                        ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Row(
                          children: const [
                            Icon(Icons.check_circle_outline, color: Colors.white),
                            SizedBox(width: 10),
                            Text("Message sent successfully."),
                          ],
                        ),
                      ),
                    );
                    messageController.clear();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.navyBlue,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Send Message",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),

            _buildSectionTitle("Follow us on"),
            _buildSocialIcons(),
          ],
        ),
      ),
    );
  }
}