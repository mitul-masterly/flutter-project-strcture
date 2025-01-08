import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_structure/Bloc/login/login_bloc.dart';
import 'package:flutter_project_structure/Components/button_widget.dart';
import 'package:flutter_project_structure/Components/lable_widget.dart';
import 'package:flutter_project_structure/Components/text_field_widget.dart';
import 'package:flutter_project_structure/Utils/app_colors.dart';
import 'package:flutter_project_structure/Utils/app_strings.dart';
import 'package:flutter_project_structure/Utils/constants.dart';
import 'package:flutter_project_structure/Utils/utils.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          final bloc = context.read<LoginBloc>();
          return Stack(
            children: [
              Scaffold(
                body: Form(
                  key: loginFormKey,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: LabelWidget(
                            title: AppStrings.login,
                            size: 25,
                            weight: FontWeight.bold,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        70.height,
                        LabelWidget(
                          title: "${AppStrings.email}*",
                          size: 14,
                          weight: FontWeight.bold,
                          color: AppColors.blackColor,
                        ),
                        10.height,
                        AppTextField(
                            type: TextFieldTypes.email,
                            title: AppStrings.email,
                            textEditingController: state.emailController),
                        20.height,
                        LabelWidget(
                          title: "${AppStrings.password}*",
                          size: 14,
                          weight: FontWeight.bold,
                          color: AppColors.blackColor,
                        ),
                        10.height,
                        AppTextField(
                            type: TextFieldTypes.password,
                            title: AppStrings.password,
                            textEditingController: state.passwordController),
                        40.height,
                        AppButton(
                          title: AppStrings.login,
                          width: double.maxFinite,
                          isLoading: state.isLoading,
                          icon: null,
                          onPressed: () {
                            if (loginFormKey.currentState!.validate()) {
                              bloc.add(const OnButtonClickEvent());
                            }
                          },
                          type: AppButtonType.primary,
                        ),
                        40.height,
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
