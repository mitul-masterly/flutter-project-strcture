import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_structure/Components/common_button_widget.dart';
import 'package:flutter_project_structure/Routes/routes_name.dart';
import 'package:flutter_project_structure/bloc/auth/login/login_bloc.dart';
import 'package:flutter_project_structure/components/common_text_field_widget.dart';
import 'package:flutter_project_structure/gen/assets.gen.dart';
import 'package:flutter_project_structure/helper/extension/localization_extension.dart';
import 'package:flutter_project_structure/theme/app_colors.dart';
import 'package:flutter_project_structure/theme/font_styles.dart';
import 'package:flutter_project_structure/utils/app_enums.dart';
import 'package:flutter_project_structure/utils/app_strings.dart';
import 'package:flutter_project_structure/utils/utils.dart';

class LoginWithEmailWidget extends StatelessWidget {
  const LoginWithEmailWidget({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext buildContext) {
    return BlocBuilder<LoginBloc, LoginState>(
        builder: (final BuildContext context, final LoginState state) {
      final LoginBloc bloc = context.read<LoginBloc>();
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AppTextField(
            key: Key('login_email_field'),
            initialValue: state.email,
            type: TextFieldTypes.email,
            title: AppStrings.email,
            strHeaderTitle: '${AppStrings.email.tr(buildContext)} ',
            textInputAction: TextInputAction.next,
            onChange: (final String value) {
              context.read<LoginBloc>().add(OnChangeEmail(email: value));
            },
          ),
          20.height,
          AppTextField(
            key: Key('login_password_field'),
            initialValue: state.password,
            type: TextFieldTypes.password,
            title: AppStrings.password,
            strHeaderTitle: '${AppStrings.password.tr(buildContext)} ',
            textInputAction: TextInputAction.done,
            onChange: (final String value) {
              context.read<LoginBloc>().add(OnChangePassword(password: value));
            },
          ),
          12.height,
          Row(
            children: <Widget>[
              Expanded(
                child: InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {
                    context.read<LoginBloc>().add(
                        OnChangeRememberMe(isRememberMe: !state.isRememberMe));
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(
                        state.isRememberMe
                            ? Icons.check_box_rounded
                            : Icons.check_box_outline_blank_rounded,
                        color: AppColors.colorPrimary500,
                      ),
                      5.width,
                      Text(
                        'Remember me'.tr(context),
                        style: dMSansW400.copyWith(
                            color: AppColors.baseColorWhite45, fontSize: 14),
                      )
                    ],
                  ),
                ),
              ),
              8.width,
              InkWell(
                splashColor: Colors.transparent,
                onTap: () {
                  context
                      .read<LoginBloc>()
                      .add(LoginEvent.onTapForgotPassword(context: context));
                },
                child: Text(
                  textAlign: TextAlign.end,
                  'Forgot Password?'.tr(context),
                  style: dMSansW700.copyWith(
                      color: AppColors.colorPrimary500, fontSize: 14),
                ),
              ),
            ],
          ),
          40.height,
          AppButton(
            key: Key('login_button'),
            title: AppStrings.login.tr(buildContext),
            width: double.maxFinite,
            isLoading: state.status == CommonScreenState.loading,
            icon: null,
            onPressed: () {
              if (bloc.loginFormKey.currentState?.validate() == true) {
                debugPrint('Login Button Pressed');
                bloc.add(OnSubmit());
              }
            },
            type: AppButtonType.primary,
          ),
          10.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  bloc.add(LoginEvent.onTapLoginWithOtpStateEvent());
                },
                child: Text(
                  'Login With OTP'.tr(context),
                  style: dMSansW400.copyWith(
                      fontSize: 12.0, color: AppColors.colorPrimary500),
                ),
              ),
              15.width,
              Row(
                children: <Widget>[
                  Assets.svg.icFinger.svg(),
                  5.width,
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                          context, RouteName.fingerprintAuthScreen);
                    },
                    child: Text(
                      'Use Fingerprint'.tr(context),
                      style: dMSansW400.copyWith(
                          fontSize: 12.0, color: AppColors.colorNeutral700),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      );
    });
  }
}
