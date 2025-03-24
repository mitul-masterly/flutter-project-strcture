import 'package:flutter/material.dart';
import 'package:flutter_project_structure/theme/font_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen();

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Home Screen',
          style: rubikW500,
        ),
      ),
    );
  }
}
