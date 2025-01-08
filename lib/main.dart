import 'package:flutter/material.dart';
import 'package:flutter_project_structure/Routes/app_routes.dart';
import 'package:flutter_project_structure/Utils/app_colors.dart';
import 'package:flutter_project_structure/Views/Auth/login.dart';
import 'package:flutter_project_structure/Views/Auth/registration.dart';
import 'package:flutter_project_structure/Views/Auth/spash.dart';

void main() {
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          "/": (context) => const SplashScreen(),
          RouteName.loginScreen: (context) => LoginScreen(),
          RouteName.registrationScreen: (context) => const RegistrationScreen(),
        });
  }
}
