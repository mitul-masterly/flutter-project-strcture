import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project_structure/theme/font_styles.dart';
import 'package:flutter_project_structure/theme/status_bar_config.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen();

  @override
  Widget build(final BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: darkStatusBarTransparent,
      child: SafeArea(
        child: Scaffold(
          body: Center(
            child: Text(
              'History Screen',
              style: dMSansW500,
            ),
          ),
        ),
      ),
    );
  }
}
