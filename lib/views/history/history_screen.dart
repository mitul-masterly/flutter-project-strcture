import 'package:flutter/material.dart';
import 'package:flutter_project_structure/theme/font_styles.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen();

  @override
  Widget build(final BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text(
            'History Screen',
            style: dMSansW500,
          ),
        ),
      ),
    );
  }
}
//https://masterlysolutions.com/terms-and-conditions/
