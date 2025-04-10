import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_structure/bloc/auth/signup/signup_bloc.dart';
import 'package:flutter_project_structure/components/common_dropdown_widget.dart';
import 'package:flutter_project_structure/components/common_phone_field_widget.dart';
import 'package:flutter_project_structure/components/common_rich_text_widget.dart';
import 'package:flutter_project_structure/components/common_text_field_widget.dart';
import 'package:flutter_project_structure/helper/extension/localization_extension.dart';
import 'package:flutter_project_structure/utils/app_enums.dart';
import 'package:flutter_project_structure/utils/app_strings.dart';
import 'package:flutter_project_structure/utils/utils.dart';
import 'package:flutter_project_structure/views/auth/signup/widgets/date_picker_widget.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/phone_number.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext buildContext) {
    return BlocBuilder<SignUpBloc, SignUpState>(
        builder: (final BuildContext context, final SignUpState state) {
      final SignUpBloc bloc = context.read<SignUpBloc>();
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          AppTextField(
            key: Key('signup_first_name_field'),
            initialValue: state.firstName,
            type: TextFieldTypes.text,
            title: AppStrings.firstName,
            strHeaderTitle: '${AppStrings.firstName.tr(buildContext)}',
            textInputAction: TextInputAction.next,
            nextFocusNode: bloc.lNameFocus,
            focusNode: bloc.fNameFocus,
            onChange: (final String value) {
              bloc.add(OnChangeFirstName(fName: value));
            },
          ),
          20.height,
          AppTextField(
            key: Key('signup_last_name_field'),
            initialValue: state.lastName,
            type: TextFieldTypes.text,
            title: AppStrings.lastName,
            strHeaderTitle: '${AppStrings.lastName.tr(buildContext)}',
            textInputAction: TextInputAction.next,
            nextFocusNode: bloc.emailFocus,
            focusNode: bloc.lNameFocus,
            onChange: (final String value) {
              bloc.add(OnChangeLastName(lName: value));
            },
          ),
          20.height,
          AppTextField(
            key: Key('signup_email_field'),
            type: TextFieldTypes.email,
            title: AppStrings.email,
            initialValue: state.email,
            strHeaderTitle: '${AppStrings.emailAddress.tr(buildContext)}',
            textInputAction: TextInputAction.next,
            focusNode: bloc.emailFocus,
            onChange: (final String value) {
              bloc.add(OnChangeEmail(email: value));
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
              context
                  .read<SignUpBloc>()
                  .add(OnChangeMobileNumber(mobileNumber: number.number));
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
          ),
          20.height,
          CommonRichTextWidget(strHeaderTitle: 'Date of Birth' ),
          10.height,
          DatePickerWidget(
              onPressed: (final DateTime value) {
                bloc.add(OnSelectBirthDate(
                  birthDate: Utils.formatDate(value, 'dd/MM/yyyy'),
                ));
              },
              selectedDate: state.birthDate ?? null),
          20.height,
          CommonDropdownWidget(
            placeholder: 'Please Select Gender',
            listData: state.genderList,
            title: 'Gender'.tr(context),
            selectedVal: state.genderId,
            height: 50,
            onValueChanged: (final dynamic value) {
              bloc.add(OnSelectGender(genderId: value));
            },
          ),
          20.height,
          CommonDropdownWidget(
            placeholder: 'Please Select Country',
            listData: state.countryList,
            title: 'Country'.tr(context),
            selectedVal: state.countryId,
            height: 50,
            onValueChanged: (final dynamic value) {
              bloc.add(OnSelectCountry(countryId: value));
            },
          ),
          20.height,
          AppTextField(
            key: Key('address_field'),
            type: TextFieldTypes.text,
            title: AppStrings.address,
            initialValue: state.address,
            strHeaderTitle: '${AppStrings.address.tr(buildContext)}',
            textInputAction: TextInputAction.done,
            focusNode: bloc.addressFocus,
            onChange: (final String value) {
              bloc.add(OnChangeAddress(address: value));
            },
          ),

        ],
      );
    });
  }
}
