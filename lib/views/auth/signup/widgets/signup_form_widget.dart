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
import 'package:intl_phone_field/phone_number.dart';

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
            key: Key('signup_first_name_field'),
            initialValue: state.firstName,
            type: TextFieldTypes.text,
            title: AppStrings.firstName,
            strHeaderTitle: '${AppStrings.firstName.tr(buildContext)}*',
            textInputAction: TextInputAction.next,
            nextFocusNode: bloc.lNameFocus,
            focusNode: bloc.fNameFocus,
            onChange: (final value) {
              bloc.add(OnChangeFirstName(fName: value));
            },
          ),
          20.height,
          AppTextField(
            key: Key('signup_last_name_field'),
            initialValue: state.lastName,
            type: TextFieldTypes.text,
            title: AppStrings.lastName,
            strHeaderTitle: '${AppStrings.lastName.tr(buildContext)}*',
            textInputAction: TextInputAction.next,
            nextFocusNode: bloc.emailFocus,
            focusNode: bloc.lNameFocus,
            onChange: (final value) {
              bloc.add(OnChangeLastName(lName: value));
            },
          ),
          20.height,
          AppTextField(
            key: Key('signup_email_field'),
            type: TextFieldTypes.email,
            title: AppStrings.email,
            initialValue: state.email,
            strHeaderTitle: '${AppStrings.email.tr(buildContext)}*',
            textInputAction: TextInputAction.next,
            nextFocusNode: bloc.passwordFocus,
            focusNode: bloc.emailFocus,
            onChange: (final value) {
              bloc.add(OnChangeEmail(email: value));
            },
          ),
          20.height,
          AppTextField(
            key: Key('signup_password_field'),
            type: TextFieldTypes.password,
            title: AppStrings.password,
            initialValue: state.password,
            strHeaderTitle: '${AppStrings.password.tr(buildContext)}*',
            textInputAction: TextInputAction.next,
            nextFocusNode: bloc.cPasswordFocus,
            focusNode: bloc.passwordFocus,
            onChange: (final value) {
              bloc.add(OnChangePassword(password: value));
            },
          ),
          20.height,
          AppTextField(
            key: Key('signup_confirm_password_field'),
            focusNode: bloc.cPasswordFocus,
            type: TextFieldTypes.password,
            title: AppStrings.confirmPassword,
            initialValue: state.confirmPassword,
            strHeaderTitle: '${AppStrings.confirmPassword.tr(buildContext)}*',
            validator: (final String? value) {
              return validateConfirmPassword(value, state.password)?.tr(context);
            },
            textInputAction: TextInputAction.next,
            nextFocusNode: bloc.mobileFocus,
            onChange: (final value) {
              bloc.add(OnChangeConfirmPassword(confirmPassword: value));
            },
          ),
          20.height,
          CommonPhoneFieldWidget(
            key: Key('signup_mobile_field'),
            onChange: (final PhoneNumber number) {
              debugPrint(number.countryCode);
              debugPrint(number.countryISOCode);
              debugPrint(number.number);
              debugPrint(number.completeNumber);
            },
            focusNode: bloc.mobileFocus,
            strHeaderTitle: AppStrings.mobileNumber,
            initialValue: state.mobileNumber,
            countryCode: state.countryISOCode,
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
