import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_structure/helper/extension/localization_extension.dart';
import 'package:flutter_project_structure/theme/app_colors.dart';
import 'package:flutter_project_structure/theme/font_styles.dart';
import 'package:flutter_project_structure/views/auth/signup/sign_up_page.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({super.key});

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0), // Add spacing
      child: RichText(
        text: TextSpan(
          text: 'Don’t have any account?'.tr(context),
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600], // Normal text color
          ),
          children: <InlineSpan>[
            TextSpan(
              text: 'Sign up'.tr(context),
              style: dMSansW700.copyWith(
                fontSize: 14,
                color: AppColors.colorPrimary500,
                decoration: TextDecoration.underline,
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
