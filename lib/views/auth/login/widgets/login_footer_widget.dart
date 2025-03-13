import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_structure/Views/Auth/sign_up_page.dart';
import 'package:flutter_project_structure/helper/extension/localization_extension.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({super.key});

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0), // Add spacing
      child: RichText(
        text: TextSpan(
          text: '${'New account?'.tr(context)} ',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600], // Normal text color
          ),
          children: <InlineSpan>[
            TextSpan(
              text: 'Signup Here'.tr(context),
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).primaryColor, // App primary color
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline, // Optional underline
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  // Handle navigation to Signup Screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (final BuildContext context) =>
                          SignUpScreen(), // Replace with your SignupScreen
                    ),
                  );
                },
            ),
          ],
        ),
      ),
    );
  }
}
