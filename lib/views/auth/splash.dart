import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_structure/Bloc/splash/splash_bloc.dart';
import 'package:flutter_project_structure/Routes/routes_name.dart';
import 'package:flutter_project_structure/helper/pref_helper/shared_pref_helper.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    return BlocProvider<SplashBloc>(
      create: (final BuildContext context) =>
          SplashBloc()..add(const InitialEvent()),
      child: BlocListener<SplashBloc, SplashState>(
        listener: (final BuildContext context, final SplashState state) async {
          if (state.isNavigate) {
            if (SharedPreferenceHelper().isLoggedIn) {
              await Navigator.pushNamedAndRemoveUntil(
                  context,
                  RouteName.tabNavigationView,
                  (final Route<dynamic> route) => false);
            } else {
              await Navigator.pushNamedAndRemoveUntil(context,
                  RouteName.loginScreen, (final Route<dynamic> route) => false);
            }
          }
        },
        child: const Scaffold(
          backgroundColor: Colors.amber,
        ),
      ),
    );
  }
}
