import 'package:flutter/material.dart';
import 'package:flutter_project_structure/app/my_app.dart';
import 'package:flutter_project_structure/theme/app_colors.dart';
import 'package:flutter_project_structure/theme/font_styles.dart';
import 'package:flutter_project_structure/utils/app_enums.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

void showSnackBar(final String message, final BuildContext context,
    final SnackBarType snackBarType) {
  switch (snackBarType) {
    case SnackBarType.success:
      showSuccessSnackBar(message);
    case SnackBarType.error:
      // TODO: Handle this case.
      showErrorSnackBar(message);
    case SnackBarType.info:
      // TODO: Handle this case.
      showErrorSnackBar(message);
  }
}

void showSuccessSnackBar(final String message) {
  showTopSnackBar(
    navigatorKey.currentState!.overlay!,
    CustomSnackBar.success(
      message: message,
      textAlign: TextAlign.start,
      textStyle: dMSansW600.copyWith(color: Colors.black87),
      backgroundColor: Colors.green,
    ),
  );
}

void showErrorSnackBar(final String message) {
  debugPrint('Error: $message');
  showTopSnackBar(
    navigatorKey.currentState!.overlay!,
    CustomSnackBar.error(
      message: message,
      textAlign: TextAlign.start,
      textStyle: dMSansW600.copyWith(color: Colors.black87),
      backgroundColor: AppColors.colorError500,
    ),
  );
}

void showInfSnackBar(final String message) {
  showTopSnackBar(
    navigatorKey.currentState!.overlay!,
    CustomSnackBar.success(
      message: message,
      textAlign: TextAlign.start,
      textStyle: dMSansW600.copyWith(color: Colors.black87),
      backgroundColor: Colors.blue.shade300,
    ),
  );
}
