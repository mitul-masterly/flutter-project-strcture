import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_structure/bloc/auth/login/login_bloc.dart';
import 'package:flutter_project_structure/components/common_button_widget.dart';
import 'package:flutter_project_structure/data/repository/auth_repo.dart';
import 'package:flutter_project_structure/helper/extension/localization_extension.dart';
import 'package:flutter_project_structure/utils/app_enums.dart';
import 'package:flutter_project_structure/utils/app_strings.dart';
import 'package:flutter_project_structure/utils/utils.dart';
import 'package:flutter_project_structure/views/auth/login/widgets/login_footer_widget.dart';
import 'package:flutter_project_structure/views/auth/login/widgets/login_form_widget.dart';
import 'package:flutter_project_structure/views/auth/login/widgets/login_header_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(final BuildContext buildContext) {
    return BlocProvider<LoginBloc>(
      create: (final BuildContext context) =>
          LoginBloc(authRepo: context.read<AuthRepo>()),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (final BuildContext context, final LoginState state) {
          if (state.isSuccess && state.user != null) {
            // Navigate to home screen
            debugPrint(state.user?.authToken);
            context.read<LoginBloc>().navigateToDashboard(context);
          }
        },
        builder: (final BuildContext context, final LoginState state) {
          final LoginBloc bloc = context.read<LoginBloc>();
          return Stack(
            children: <Widget>[
              Scaffold(
                body: Form(
                  key: loginFormKey,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        LoginHeaderWidget(),
                        70.height,
                        LoginFormWidget(),
                        40.height,
                        AppButton(
                          title: AppStrings.login.tr(buildContext),
                          width: double.maxFinite,
                          isLoading: state.isLoading,
                          icon: null,
                          onPressed: () {
                            if (loginFormKey.currentState!.validate()) {
                              bloc.add(const OnButtonClickEvent());
                            }

                            // Will Use for localization
                            // if (context
                            //         .read<LocalisationBloc>()
                            //         .state
                            //         .language ==
                            //     Locale(SupportedLangCode.english.langCode,
                            //         SupportedLangCode.english.countryCode)) {
                            //   context.read<LocalisationBloc>().add(
                            //       LocalisationEvent.onChangeLanguage(Locale(
                            //           SupportedLangCode.arabic.langCode,
                            //           SupportedLangCode.arabic.countryCode)));
                            // } else {
                            //   context.read<LocalisationBloc>().add(
                            //       LocalisationEvent.onChangeLanguage(Locale(
                            //           SupportedLangCode.english.langCode,
                            //           SupportedLangCode.english.countryCode)));
                            // }
                          },
                          type: AppButtonType.primary,
                        ),
                        20.height,
                        LoginFooterWidget()
                      ],
                    ),
                  ),
                ),
              ),
              if (state.isLoading) Utils.loaderBrier(),
              if (state.isLoading) Utils.loaderWid(),
            ],
          );
        },
      ),
    );
  }
}
