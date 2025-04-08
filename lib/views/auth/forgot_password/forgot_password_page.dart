import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_structure/Components/common_button_widget.dart';
import 'package:flutter_project_structure/bloc/auth/forgot_password/forgot_password_bloc.dart';
import 'package:flutter_project_structure/components/common_text_field_widget.dart';
import 'package:flutter_project_structure/data/repository/auth_repo.dart';
import 'package:flutter_project_structure/helper/extension/localization_extension.dart';
import 'package:flutter_project_structure/theme/app_colors.dart';
import 'package:flutter_project_structure/theme/font_styles.dart';
import 'package:flutter_project_structure/utils/app_enums.dart';
import 'package:flutter_project_structure/utils/app_strings.dart';
import 'package:flutter_project_structure/utils/utils.dart';

class ForgotPasswordScreen extends StatelessWidget {
  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: BlocProvider<ForgotPasswordBloc>(
        create: (final BuildContext context) {
          return ForgotPasswordBloc(authRepo: AuthRepoImp());
        },
        child: BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(builder:
            (final BuildContext context, final ForgotPasswordState state) {
          return Column(
            children: <Widget>[
              Text(
                'Forgot Password'.tr(context),
                style: dMSansW700.copyWith(fontSize: 25),
              ),
              5.height,
              Text(
                'Please enter your email address to receive a link to reset your password'
                    .tr(context),
                style: dMSansW400.copyWith(color: AppColors.baseColorWhite85),
              ),
              16.height,
              AppTextField(
                type: TextFieldTypes.email,
                title: AppStrings.email,
                strHeaderTitle: '${AppStrings.email.tr(context)}*',
                textInputAction: TextInputAction.next,
                onChange: (final value) {
                  context
                      .read<ForgotPasswordBloc>()
                      .add(OnChangeEmail(email: value));
                },
              ),
              50.height,
              AppButton(
                key: Key('forgot_password_submit_btn'),
                title: AppStrings.login.tr(context),
                width: double.maxFinite,
                isLoading: false,
                icon: null,
                onPressed: () {
                  context.read<ForgotPasswordBloc>().add(OnTapSubmit());
                },
                type: AppButtonType.primary,
              ),
            ],
          );
        }),
      ),
    );
  }
}
