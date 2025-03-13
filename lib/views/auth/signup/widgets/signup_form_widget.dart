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
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AppTextField(
            type: TextFieldTypes.text,
            title: AppStrings.firstName,
            textEditingController: state.txtFirstName,
            strHeaderTitle: '${AppStrings.firstName.tr(buildContext)}*',
          ),
          20.height,
          AppTextField(
            type: TextFieldTypes.text,
            title: AppStrings.lastName,
            textEditingController: state.txtLastName,
            strHeaderTitle: '${AppStrings.lastName.tr(buildContext)}*',
          ),
          20.height,
          AppTextField(
            type: TextFieldTypes.email,
            title: AppStrings.email,
            textEditingController: state.txtEmail,
            strHeaderTitle: '${AppStrings.email.tr(buildContext)}*',
          ),
          20.height,
          AppTextField(
            type: TextFieldTypes.password,
            title: AppStrings.password,
            textEditingController: state.txtPassword,
            strHeaderTitle: '${AppStrings.password.tr(buildContext)}*',
          ),
          20.height,
          AppTextField(
            type: TextFieldTypes.password,
            title: AppStrings.confirmPassword,
            textEditingController: state.txtConfirmPassword,
            strHeaderTitle: '${AppStrings.confirmPassword.tr(buildContext)}*',
            validator: (final String? value) {
              return validateConfirmPassword(value, state.txtPassword.text);
            },
          ),
          20.height,
          CommonPhoneFieldWidget(
            strHeaderTitle: '${AppStrings.mobileNumber.tr(context)}*',
            textEditController: state.txtMobileNumber,
            initialValue: state.countryCode,
            countryCode: state.countryCodeISO2,
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
