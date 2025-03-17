import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_structure/bloc/auth/signup/signup_bloc.dart';
import 'package:flutter_project_structure/components/common_phone_field_widget.dart';
import 'package:flutter_project_structure/components/common_text_field_widget.dart';
import 'package:flutter_project_structure/helper/extension/localization_extension.dart';
import 'package:flutter_project_structure/helper/validator.dart';
import 'package:flutter_project_structure/utils/app_enums.dart';
import 'package:flutter_project_structure/utils/app_strings.dart';
import 'package:flutter_project_structure/utils/utils.dart';
import 'package:intl_phone_field/countries.dart';

class SignUpFormWidget extends StatelessWidget with Validator {
  const SignUpFormWidget({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext buildContext) {
    return BlocBuilder<SignUpBloc, SignUpState>(
        builder: (final BuildContext context, final SignUpState state) {
      final bloc = context.read<SignUpBloc>();
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AppTextField(
            type: TextFieldTypes.text,
            title: AppStrings.firstName,
            textEditingController: state.txtFirstName,
            strHeaderTitle: '${AppStrings.firstName.tr(buildContext)}*',
            textInputAction: TextInputAction.next,
            nextFocusNode: bloc.lNameFocus,
            focusNode: bloc.fNameFocus,
          ),
          20.height,
          AppTextField(
            type: TextFieldTypes.text,
            title: AppStrings.lastName,
            textEditingController: state.txtLastName,
            strHeaderTitle: '${AppStrings.lastName.tr(buildContext)}*',
            textInputAction: TextInputAction.next,
            nextFocusNode: bloc.emailFocus,
            focusNode: bloc.lNameFocus,
          ),
          20.height,
          AppTextField(
            type: TextFieldTypes.email,
            title: AppStrings.email,
            textEditingController: state.txtEmail,
            strHeaderTitle: '${AppStrings.email.tr(buildContext)}*',
            textInputAction: TextInputAction.next,
            nextFocusNode: bloc.passwordFocus,
            focusNode: bloc.emailFocus,
          ),
          20.height,
          AppTextField(
            type: TextFieldTypes.password,
            title: AppStrings.password,
            textEditingController: state.txtPassword,
            strHeaderTitle: '${AppStrings.password.tr(buildContext)}*',
            textInputAction: TextInputAction.next,
            nextFocusNode: bloc.cPasswordFocus,
            focusNode: bloc.passwordFocus,
          ),
          20.height,
          AppTextField(
            focusNode: bloc.cPasswordFocus,
            type: TextFieldTypes.password,
            title: AppStrings.confirmPassword,
            textEditingController: state.txtConfirmPassword,
            strHeaderTitle: '${AppStrings.confirmPassword.tr(buildContext)}*',
            validator: (final String? value) {
              return validateConfirmPassword(value, state.txtPassword.text);
            },
            textInputAction: TextInputAction.next,
            nextFocusNode: bloc.mobileFocus,
          ),
          20.height,
          CommonPhoneFieldWidget(
            focusNode: bloc.mobileFocus,
            strHeaderTitle: AppStrings.mobileNumber,
            textEditController: state.txtMobileNumber,
            initialValue: state.countryCode,
            countryCode: state.countryCodeISO2,
            textInputAction: TextInputAction.done,
            onCountryChanged: (final Country country) {
              context
                  .read<SignUpBloc>()
                  .add(OnChangeCountry(selectedCountry: country));
            },
          )
        ],
      );
    });
  }
}
