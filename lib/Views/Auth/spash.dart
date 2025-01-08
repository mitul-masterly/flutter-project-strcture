import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_structure/Bloc/splash/splash_bloc.dart';
import 'package:flutter_project_structure/Routes/app_routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc()..add(const InitialEvent()),
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) async {
          if (state.isNavigate) {
            await Navigator.pushNamedAndRemoveUntil(context,
                RouteName.loginScreen, (Route<dynamic> route) => false);
          }
        },
        child: const Scaffold(
          backgroundColor: Colors.amber,
        ),
      ),
    );
  }
}
