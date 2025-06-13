import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class PrivacySecurityPage extends StatefulWidget {
  const PrivacySecurityPage({super.key});

  @override
  State<PrivacySecurityPage> createState() => _PrivacySecurityPageState();
}

class _PrivacySecurityPageState extends State<PrivacySecurityPage> {
  bool biometricLogin = true;
  bool autoLogout = true;
  bool transactionAlerts = true;
  bool dataSharing = false;
  bool marketingEmails = false;
  bool locationTracking = false;
  int autoLogoutTime = 5;

  final List<int> logoutTimes = [1, 2, 5, 10, 15, 30];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pureWhite,
      appBar: AppBar(
        title: const Text("Privacy & Security"),
        backgroundColor: AppColors.navyBlue,
        foregroundColor: AppColors.pureWhite,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSectionHeader("Security Settings", Icons.security),
          _buildCard([
            _buildSwitchTile(
              "Biometric Login",
              "Use fingerprint or face ID to login",
              biometricLogin,
              Icons.fingerprint,
                  (val) => setState(() => biometricLogin = val),
            ),
            _buildDivider(),
            _buildSwitchTile(
              "Auto Logout",
              "Automatically logout after $autoLogoutTime minutes of inactivity",
              autoLogout,
              Icons.timer,
                  (val) => setState(() => autoLogout = val),
            ),
            if (autoLogout) ...[
              _buildDivider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    const SizedBox(width: 56),
                    const Text("Logout after: ", style: TextStyle(color: AppColors.navyBlueDark)),
                    DropdownButton<int>(
                      value: autoLogoutTime,
                      dropdownColor: AppColors.pureWhite,
                      items: logoutTimes.map((time) {
                        return DropdownMenuItem(
                          value: time,
                          child: Text("$time min${time > 1 ? 's' : ''}"),
                        );
                      }).toList(),
                      onChanged: (val) => setState(() => autoLogoutTime = val!),
                    ),
                  ],
                ),
              ),
            ],
            _buildDivider(),
            _buildSwitchTile(
              "Transaction Alerts",
              "Get instant alerts for all transactions",
              transactionAlerts,
              Icons.notifications_active,
                  (val) => setState(() => transactionAlerts = val),
            ),
          ]),
          const SizedBox(height: 24),

          _buildSectionHeader("Privacy Settings", Icons.privacy_tip),
          _buildCard([
            _buildSwitchTile(
              "Data Sharing",
              "Share anonymized data for service improvement",
              dataSharing,
              Icons.share,
                  (val) => setState(() => dataSharing = val),
            ),
            _buildDivider(),
            _buildSwitchTile(
              "Marketing Communications",
              "Receive promotional emails and offers",
              marketingEmails,
              Icons.email,
                  (val) => setState(() => marketingEmails = val),
            ),
            _buildDivider(),
            _buildSwitchTile(
              "Location Tracking",
              "Allow location access for nearby ATM/branch finder",
              locationTracking,
              Icons.location_on,
                  (val) => setState(() => locationTracking = val),
            ),
          ]),
          const SizedBox(height: 24),

          _buildSectionHeader("Data Management", Icons.storage),
          _buildCard([
            _buildListTile("Download My Data", "Get a copy of your personal data", Icons.download, _showDataDownloadDialog),
            _buildDivider(),
            _buildListTile("Delete Account", "Permanently delete your account and data", Icons.delete_forever, _showDeleteAccountDialog, iconColor: Colors.red),
          ]),
          const SizedBox(height: 24),

          _buildSectionHeader("Legal", Icons.gavel),
          _buildCard([
            _buildListTile("Privacy Policy", "", Icons.description, _showPrivacyPolicy),
            _buildDivider(),
            _buildListTile("Terms of Service", "", Icons.description, _showTermsOfService),
          ]),
          const SizedBox(height: 24),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Privacy and security settings updated successfully."),
                    backgroundColor: AppColors.navyBlue,
                  ),
                );
              },
              icon: const Icon(Icons.save),
              label: const Text("Save Settings"),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.navyBlue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, color: AppColors.navyBlue, size: 24),
          const SizedBox(width: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.navyBlueDark,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(List<Widget> children) {
    return Card(
      color: AppColors.mutedGrayPeach,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(children: children),
    );
  }

  Widget _buildSwitchTile(String title, String subtitle, bool value, IconData icon, Function(bool) onChanged) {
    return SwitchListTile(
      title: Text(title, style: const TextStyle(color: AppColors.navyBlueDark)),
      subtitle: Text(subtitle, style: const TextStyle(color: AppColors.navyBlueDark)),
      value: value,
      onChanged: onChanged,
      secondary: Icon(icon, color: AppColors.navyBlue),
    );
  }

  Widget _buildListTile(String title, String subtitle, IconData icon, Function() onTap, {Color iconColor = AppColors.navyBlue}) {
    return ListTile(
      leading: Icon(icon, color: iconColor),
      title: Text(title, style: const TextStyle(color: AppColors.navyBlueDark)),
      subtitle: subtitle.isNotEmpty ? Text(subtitle, style: const TextStyle(color: AppColors.navyBlueDark)) : null,
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.navyBlueDark),
      onTap: onTap,
    );
  }

  Widget _buildDivider() => const Divider(height: 1, color: Colors.grey);

  void _showDataDownloadDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: AppColors.pureWhite,
        title: const Text(
          "Download Personal Data",
          style: TextStyle(color: AppColors.navyBlueDark),
        ),
        content: const Text(
          "We'll prepare a file containing all your personal data and send it to your registered email address within 24-48 hours.",
          style: TextStyle(color: AppColors.navyBlueDark),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel", style: TextStyle(color: AppColors.navyBlue)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.navyBlue,
              foregroundColor: AppColors.pureWhite,
            ),
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Data download request submitted. You'll receive an email shortly."),
                  backgroundColor: AppColors.navyBlue,
                ),
              );
            },
            child: const Text("Request Download"),
          ),
        ],
      ),
    );
  }

  void _showDeleteAccountDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: AppColors.pureWhite,
        title: const Text(
          "Delete Account",
          style: TextStyle(color: AppColors.navyBlueDark),
        ),
        content: const Text(
          "⚠️ This action cannot be undone. All your data will be permanently deleted. "
              "Please contact customer support to proceed with account deletion.",
          style: TextStyle(color: AppColors.navyBlueDark),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel", style: TextStyle(color: AppColors.navyBlue)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: AppColors.pureWhite,
            ),
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/contact-us');
            },
            child: const Text("Contact Support"),
          ),
        ],
      ),
    );
  }

  void _showPrivacyPolicy() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: AppColors.pureWhite,
        title: const Text(
          "Privacy Policy",
          style: TextStyle(color: AppColors.navyBlueDark),
        ),
        content: const SingleChildScrollView(
          child: Text(
            "Privacy Policy Summary:\n\n"
                "• We collect personal information to provide banking services\n"
                "• Your data is encrypted and stored securely\n"
                "• We don't share personal data with third parties without consent\n"
                "• You can request data deletion or modification\n"
                "• We use cookies to improve user experience\n\n"
                "For the complete privacy policy, visit our website or contact customer support.",
            style: TextStyle(color: AppColors.navyBlueDark),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close", style: TextStyle(color: AppColors.navyBlue)),
          ),
        ],
      ),
    );
  }

  void _showTermsOfService() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: AppColors.pureWhite,
        title: const Text(
          "Terms of Service",
          style: TextStyle(color: AppColors.navyBlueDark),
        ),
        content: const SingleChildScrollView(
          child: Text(
            "Terms of Service Summary:\n\n"
                "• You must be 18+ to use our services\n"
                "• Account security is your responsibility\n"
                "• We reserve the right to suspend accounts for suspicious activity\n"
                "• Service fees may apply for certain transactions\n"
                "• These terms are subject to change with notice\n\n"
                "For complete terms and conditions, visit our website or contact customer support.",
            style: TextStyle(color: AppColors.navyBlueDark),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close", style: TextStyle(color: AppColors.navyBlue)),
          ),
        ],
      ),
    );
  }
}