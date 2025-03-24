import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_structure/bloc/my_app/localisation_bloc.dart';
import 'package:flutter_project_structure/helper/extension/localization_extension.dart';
import 'package:flutter_project_structure/helper/regex_helper.dart';
import 'package:flutter_project_structure/helper/validator.dart';
import 'package:flutter_project_structure/theme/app_colors.dart';
import 'package:flutter_project_structure/theme/font_styles.dart';
import 'package:flutter_project_structure/utils/app_enums.dart';
import 'package:flutter_project_structure/utils/app_strings.dart';
import 'package:flutter_project_structure/utils/utils.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class CommonPhoneFieldWidget extends StatelessWidget with Validator {
  CommonPhoneFieldWidget(
      {required this.textEditController,
      this.initialValue,
      this.countryCode,
      this.onCountryChanged,
      this.showHeaderTitle,
      this.strHeaderTitle,
      required this.textInputAction,
      this.nextFocusNode,
      this.focusNode});

  final TextEditingController textEditController;
  final String? initialValue;
  final String? countryCode;
  final Function(Country)? onCountryChanged;
  final bool? showHeaderTitle;
  final String? strHeaderTitle;
  final TextInputAction textInputAction;
  final FocusNode? nextFocusNode;
  final FocusNode? focusNode;

  @override
  Widget build(final BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (showHeaderTitle ?? true) ...<Widget>[
          Text(
            (strHeaderTitle ?? AppStrings.mobileNumber).tr(context),
            style: rubikW700.copyWith(fontSize: 14),
          ),
          10.height,
        ],
        IntlPhoneField(
          focusNode: focusNode,
          textInputAction: textInputAction,
          languageCode:
              context.read<LocalisationBloc>().state.language.languageCode,
          textAlign:
              context.read<LocalisationBloc>().state.language.languageCode ==
                      SupportedLangCode.arabic.langCode
                  ? TextAlign.right
                  : TextAlign.left,
          controller: textEditController,
          onSubmitted: (final String value) {
            if (nextFocusNode != null) {
              FocusScope.of(context).requestFocus(nextFocusNode);
            }
          },
          style: rubikW400,
          keyboardType: const TextInputType.numberWithOptions(
              signed: true, decimal: false),
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegexHelper.mobileNumberRegex),
          ],
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.only(left: 10, right: 20, top: 0, bottom: 0),
            hintText: 'Enter your mobile number'.tr(context),
            hintStyle: rubikW400.copyWith(
              color: AppColors.color808080,
              fontSize: 14,
            ),
            focusedBorder: Utils.inputBorder(AppColors.color003366),
            focusedErrorBorder: Utils.inputBorder(AppColors.colorF92814),
            errorBorder: Utils.inputBorder(AppColors.colorF92814),
            enabledBorder: Utils.inputBorder(AppColors.color808080),
          ),
          flagsButtonPadding: const EdgeInsets.all(10),
          initialValue: initialValue ?? '+1',
          initialCountryCode: countryCode ?? 'US',
          onCountryChanged: onCountryChanged,
          invalidNumberMessage: AppMessages.invalidMobile.message.tr(context),
          validator: (final PhoneNumber? value) {
            return validateMobileNumber(value)?.tr(context);
          },
        ),
      ],
    );
  }
}
