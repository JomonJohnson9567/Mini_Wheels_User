import 'package:flutter/material.dart';
import 'package:mini_wheelz_user/features/core/colors.dart';

class TermsDialog {
  static Future<void> show(BuildContext context) {
    return showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            backgroundColor: whiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            title: Text(
              "Terms of Service",
              style: TextStyle(
                color: secondaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            content: SizedBox(
              height: 300, // ensures scrollable
              width: double.maxFinite,
              child: SingleChildScrollView(
                child: Text(
                  "Welcome to Mini Wheelz!\n\n"
                  "By using our services, you agree to the following terms:\n\n"
                  "1. Usage of App\n"
                  "   • You must use the app only for lawful purposes.\n"
                  "   • Do not misuse features or interfere with others’ usage.\n\n"
                  "2. Privacy\n"
                  "   • We respect your privacy and protect your data.\n"
                  "   • Read our Privacy Policy for details on data collection.\n\n"
                  "3. User Responsibilities\n"
                  "   • You are responsible for providing accurate information.\n"
                  "   • Mini Wheelz is not liable for damages caused by incorrect usage.\n\n"
                  "4. Updates & Modifications\n"
                  "   • We may update these terms at any time.\n"
                  "   • Continued use of the app means you accept the changes.\n\n"
                  "5. Limitations of Liability\n"
                  "   • We are not liable for indirect, incidental, or consequential damages.\n\n"
                  "Thank you for using Mini Wheelz 💙",
                  style: TextStyle(color: grey600, fontSize: 14, height: 1.4),
                ),
              ),
            ),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  foregroundColor: whiteColor,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "OK",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
    );
  }
}
