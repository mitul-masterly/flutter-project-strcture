import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_structure/Components/common_button_widget.dart';
import 'package:flutter_project_structure/Routes/routes_name.dart';
import 'package:flutter_project_structure/bloc/auth/login/login_bloc.dart';
import 'package:flutter_project_structure/bloc/auth/otp/otp_bloc.dart';
import 'package:flutter_project_structure/components/common_text_field_widget.dart';
import 'package:flutter_project_structure/gen/assets.gen.dart';
import 'package:flutter_project_structure/helper/extension/localization_extension.dart';
import 'package:flutter_project_structure/theme/app_colors.dart';
import 'package:flutter_project_structure/theme/font_styles.dart';
import 'package:flutter_project_structure/utils/app_enums.dart';
import 'package:flutter_project_structure/utils/app_strings.dart';
import 'package:flutter_project_structure/utils/utils.dart';

class LoginWithPhoneWidget extends StatelessWidget {
  const LoginWithPhoneWidget({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext buildContext) {
    return BlocProvider<OtpBloc>(
      create: (final BuildContext context) => OtpBloc(),
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (final BuildContext context, final LoginState state) {
          final LoginBloc loginBloc = context.read<LoginBloc>();
          return BlocBuilder<OtpBloc, OtpState>(
              builder: (final BuildContext context, final OtpState state) {
            final OtpBloc otpBloc = context.read<OtpBloc>();
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                AppTextField(
                  key: Key('otp_email_field'),
                  initialValue: '',
                  type: TextFieldTypes.text,
                  title: AppStrings.email + ' or Phone',
                  strHeaderTitle: '${'Phone / Email ID'.tr(buildContext)} ',
                  textInputAction: TextInputAction.done,
                  onChange: (final String value) {
                    context
                        .read<OtpBloc>()
                        .add(OnChangeEmailOrPhone(emailOrPhone: value));
                  },
                ),
                30.height,
                AppButton(
                  key: Key('send_otp_button'),
                  title: 'Send OTP'.tr(buildContext),
                  width: double.maxFinite,
                  isLoading: state.status == CommonScreenState.loading,
                  icon: null,
                  onPressed: () {
                    if (loginBloc.loginFormKey.currentState?.validate() ==
                        true) {
                      otpBloc.add(SendOtpEvent(context: context));
                    }
                  },
                  type: AppButtonType.primary,
                ),
                10.height,
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                        context, RouteName.fingerprintAuthScreen);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Assets.svg.icFinger.svg(),
                      5.width,
                      Text(
                        'Use Fingerprint'.tr(context),
                        style: dMSansW400.copyWith(
                            fontSize: 12.0, color: AppColors.colorNeutral700),
                      ),
                    ],
                  ),
                )
              ],
            );
          });
        },
      ),
    );
  }
}
