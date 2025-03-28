
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_structure/Utils/utils.dart';
import 'package:flutter_project_structure/bloc/auth/login/login_bloc.dart';
import 'package:flutter_project_structure/data/repository/auth_repo.dart';
import 'package:flutter_project_structure/utils/app_enums.dart';
import 'package:flutter_project_structure/views/auth/login/widgets/login_footer_widget.dart';
import 'package:flutter_project_structure/views/auth/login/widgets/login_with_email_widget.dart';
import 'package:flutter_project_structure/views/auth/login/widgets/login_header_widget.dart';
import 'package:flutter_project_structure/views/auth/login/widgets/login_with_phone_widget.dart';
import 'package:flutter_project_structure/views/auth/login/widgets/social_media_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  @override
  Widget build(final BuildContext buildContext) {
    return BlocProvider<LoginBloc>(
      create: (final BuildContext context) =>
          LoginBloc(authRepo: AuthRepoImp()),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (final BuildContext context, final LoginState state) {
          if (state.status == CommonScreenState.success && state.user != null) {
            // Navigate to home screen
            debugPrint(state.user?.authToken);
            context.read<LoginBloc>().navigateToDashboard(context);
          }
        },
        builder: (final BuildContext context, final LoginState state) {
          final LoginBloc bloc = context.read<LoginBloc>();
          return PopScope(
            canPop:  false,
            onPopInvokedWithResult: (final bool didPop, final dynamic result) {
              if(state.isLoginWithOtp){
                bloc.add(LoginEvent.onTapLoginWithOtpStateEvent());
              }
            },
            child: Scaffold(
              body: SingleChildScrollView(
                child: Form(
                  key: bloc.loginFormKey,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        70.height,
                        LoginHeaderWidget(),
                        70.height,
                        state.isLoginWithOtp
                            ? LoginWithPhoneWidget()
                            : LoginWithEmailWidget(),
                        20.height,
                        Row(children: <Widget>[
                          Expanded(child: Divider(endIndent: 10)),
                          Text('Or'),
                          Expanded(child: Divider(indent: 10)),
                        ]),
                        30.height,
                        SocialMediaWidget(),
                        LoginFooterWidget(),
                        30.height
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
