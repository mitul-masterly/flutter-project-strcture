import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_structure/bloc/auth/forgot_password/forgot_password_bloc.dart';
import 'package:flutter_project_structure/components/common_text_field_widget.dart';
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
          return ForgotPasswordBloc();
        },
        child: BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(builder:
            (final BuildContext context, final ForgotPasswordState state) {
          return Column(
            children: <Widget>[
              Text(
                'Forgot Password'.tr(context),
                style: rubikW700.copyWith(fontSize: 25),
              ),
              5.height,
              Text(
                'Please enter your email address to receive a link to reset your password'
                    .tr(context),
                style: rubikW400.copyWith(color: AppColors.color808080),
              ),
              16.height,
              AppTextField(
                type: TextFieldTypes.email,
                title: AppStrings.email,
                textEditingController: state.txtEmail,
                strHeaderTitle: '${AppStrings.email.tr(context)}*',
                textInputAction: TextInputAction.next,
              ),
            ],
          );
        }),
      ),
    );
  }
}
