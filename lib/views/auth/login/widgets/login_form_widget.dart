import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_structure/bloc/auth/login/login_bloc.dart';
import 'package:flutter_project_structure/components/common_text_field_widget.dart';
import 'package:flutter_project_structure/helper/extension/localization_extension.dart';
import 'package:flutter_project_structure/theme/app_colors.dart';
import 'package:flutter_project_structure/theme/font_styles.dart';
import 'package:flutter_project_structure/utils/app_enums.dart';
import 'package:flutter_project_structure/utils/app_strings.dart';
import 'package:flutter_project_structure/utils/utils.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext buildContext) {
    return BlocBuilder<LoginBloc, LoginState>(
        builder: (final BuildContext context, final LoginState state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AppTextField(
            type: TextFieldTypes.email,
            title: AppStrings.email,
            textEditingController: state.emailController,
            strHeaderTitle: '${AppStrings.email.tr(buildContext)}*',
            textInputAction: TextInputAction.next,
          ),
          20.height,
          AppTextField(
            type: TextFieldTypes.password,
            title: AppStrings.password,
            textEditingController: state.passwordController,
            strHeaderTitle: '${AppStrings.password.tr(buildContext)}*',
            textInputAction: TextInputAction.done,
          ),
          12.height,
          Row(
            children: [
              Expanded(
                child: InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {
                    context.read<LoginBloc>().add(
                        OnChangeRememberMe(isRememberMe: !state.isRememberMe));
                  },
                  child: Row(
                    children: [
                      Icon(
                        state.isRememberMe
                            ? Icons.check_box_rounded
                            : Icons.check_box_outline_blank_rounded,
                        color: AppColors.color003366,
                      ),
                      5.width,
                      Text(
                        'Remember me'.tr(context),
                        style: rubikW400.copyWith(
                            color: AppColors.color808080, fontSize: 14),
                      )
                    ],
                  ),
                ),
              ),
              8.width,
              Expanded(
                child: InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {
                    context
                        .read<LoginBloc>()
                        .add(LoginEvent.onTapForgotPassword(context: context));
                  },
                  child: Text(
                    textAlign: TextAlign.end,
                    'Forgot Password?'.tr(context),
                    style: rubikW700.copyWith(
                        color: AppColors.color003366, fontSize: 14),
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    });
  }
}
