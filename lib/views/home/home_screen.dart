import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project_structure/theme/font_styles.dart';
import 'package:flutter_project_structure/theme/status_bar_config.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen();

  @override
  Widget build(final BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: darkStatusBarTransparent,
      child: Scaffold(
        body: Center(
          child: Text(
            'Home Screen',
            style: dMSansW500,
          ),
        ),
      ),
    );
  }
}
