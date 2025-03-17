import 'package:flutter/material.dart';
import 'package:flutter_project_structure/Routes/routes_name.dart';
import 'package:flutter_project_structure/views/auth/login/login_page.dart';
import 'package:flutter_project_structure/views/auth/signup/sign_up_page.dart';
import 'package:flutter_project_structure/views/auth/splash/splash_page.dart';
import 'package:flutter_project_structure/views/history/history_screen.dart';
import 'package:flutter_project_structure/views/home/home_screen.dart';
import 'package:flutter_project_structure/views/profile/profile_screen.dart';
import 'package:flutter_project_structure/views/tab_navigation_view.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> getRoutes() {
    return <String, WidgetBuilder>{
      RouteName.splashScreen: (final BuildContext context) =>
          const SplashScreen(),
      RouteName.loginScreen: (final BuildContext context) => LoginScreen(),
      RouteName.registrationScreen: (final BuildContext context) =>
          SignUpScreen(),
      RouteName.homeScreen: (final BuildContext context) => HomeScreen(),
      RouteName.historyScreen: (final BuildContext context) => HistoryScreen(),
      RouteName.profileScreen: (final BuildContext context) => ProfileScreen(),
      RouteName.tabNavigationView: (final BuildContext context) =>
          TabNavigationView(),
    };
  }
}
