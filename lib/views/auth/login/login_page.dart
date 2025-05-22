import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_structure/Utils/utils.dart';
import 'package:flutter_project_structure/bloc/auth/login/login_bloc.dart';
import 'package:flutter_project_structure/data/repository/auth_repo.dart';
import 'package:flutter_project_structure/theme/app_colors.dart';
import 'package:flutter_project_structure/theme/status_bar_config.dart';
import 'package:flutter_project_structure/utils/app_enums.dart';
import 'package:flutter_project_structure/views/auth/login/widgets/login_footer_widget.dart';
import 'package:flutter_project_structure/views/auth/login/widgets/login_header_widget.dart';
import 'package:flutter_project_structure/views/auth/login/widgets/login_with_email_widget.dart';
import 'package:flutter_project_structure/views/auth/login/widgets/login_with_phone_widget.dart';
import 'package:flutter_project_structure/views/auth/login/widgets/social_media_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  @override
  Widget build(final BuildContext buildContext) {
    final Size size = MediaQuery.of(buildContext).size;
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
            canPop: false,
            onPopInvokedWithResult: (final bool didPop, final dynamic result) {
              if (state.isLoginWithOtp) {
                bloc.add(LoginEvent.onTapLoginWithOtpStateEvent());
              }
            },
            child: AnnotatedRegion<SystemUiOverlayStyle>(
              value: lightStatusBarTransparent,
              child: Scaffold(
                body: SingleChildScrollView(
                  child: Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 100),
                        width: double.infinity,
                        height: size.height * 0.4,
                        decoration: BoxDecoration(
                          color: AppColors.colorPrimary500,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                          ),
                          gradient: LinearGradient(
                            colors: [
                              AppColors.colorA478D1,
                              AppColors.color4478D1
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: LoginHeaderWidget(),
                      ),
                      Container(
                        width: double.infinity,
                        height: size.height * 0.6,
                        margin: EdgeInsets.only(left: 20, right: 20, top: 300),
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color:
                                      AppColors.black.withValues(alpha: 0.10),
                                  blurRadius: 10,
                                  offset: Offset(0, 0),
                                  spreadRadius: 6)
                            ]),
                        child: SingleChildScrollView(
                          child: Form(
                            key: bloc.loginFormKey,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  30.height,
                                  state.isLoginWithOtp
                                      ? LoginWithPhoneWidget()
                                      : LoginWithEmailWidget(),
                                  20.height,
                                  Row(children: <Widget>[
                                    Expanded(child: Divider(endIndent: 10)),
                                    Text('Or'),
                                    Expanded(child: Divider(indent: 10)),
                                  ]),
                                  16.height,
                                  SocialMediaWidget(),
                                  16.height,
                                  LoginFooterWidget(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
