import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_structure/Utils/utils.dart';
import 'package:flutter_project_structure/bloc/auth/biometric/biometric_bloc.dart';
import 'package:flutter_project_structure/gen/assets.gen.dart';

class FingerprintAuthScreen extends StatelessWidget {
  const FingerprintAuthScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    return BlocProvider<BiometricBloc>(
      create: (final BuildContext context) => BiometricBloc(),
      child: BlocBuilder<BiometricBloc, BiometricState>(
        builder: (final BuildContext context, final BiometricState state) {
          final BiometricBloc bloc = context.read<BiometricBloc>();
          return Stack(
            children: <Widget>[
              Scaffold(
                body: SafeArea(
                    child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text('Fingerprint Authentication'),
                      20.height,
                      Text('Touch in the fingerprint sensor to continue.'),
                      10.height,
                      Text('Cancel'),
                      GestureDetector(
                          onTap: () {
                            bloc.add(LoginWithBiometric(context: context));
                          },
                          child:
                              Assets.svg.icFinger.svg(height: 53, width: 53)),
                      20.height,
                      GestureDetector(
                          onTap: () {
                            bloc.add(LoginWithFaceID(context: context));
                          },
                          child:
                              Text('face')),
                    ],
                  ),
                )),
              ),
            ],
          );
        },
      ),
    );
  }
}
