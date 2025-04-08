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
      {super.key,
      this.textEditController,
      this.countryCode,
      this.onCountryChanged,
      this.showHeaderTitle,
      this.strHeaderTitle,
      required this.textInputAction,
      this.nextFocusNode,
      this.focusNode,
      this.initialValue,
      this.onChange});

  final TextEditingController? textEditController;
  final String? countryCode;
  final bool? showHeaderTitle;
  final String? strHeaderTitle;
  final TextInputAction textInputAction;
  final FocusNode? nextFocusNode;
  final FocusNode? focusNode;
  final String? initialValue;
  final ValueChanged<PhoneNumber>? onChange;
  final ValueChanged<Country>? onCountryChanged;

  @override
  Widget build(final BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (showHeaderTitle ?? true) ...<Widget>[
          Text(
            (strHeaderTitle ?? AppStrings.mobileNumber).tr(context),
            style: dMSansW700.copyWith(fontSize: 14),
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
          style: dMSansW400,
          keyboardType: const TextInputType.numberWithOptions(
              signed: true, decimal: false),
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegexHelper.mobileNumberRegex),
          ],
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.only(left: 10, right: 20, top: 0, bottom: 0),
            hintText: 'Enter your mobile number'.tr(context),
            hintStyle: dMSansW400.copyWith(
              color: AppColors.baseColorWhite85,
              fontSize: 14,
            ),
            focusedBorder: Utils.inputBorder(AppColors.colorPrimary500),
            focusedErrorBorder: Utils.inputBorder(AppColors.colorError500),
            errorBorder: Utils.inputBorder(AppColors.colorError500),
            enabledBorder: Utils.inputBorder(AppColors.baseColorWhite85),
          ),
          flagsButtonPadding: const EdgeInsets.all(10),
          initialValue: initialValue,
          initialCountryCode: countryCode ?? 'US',
          onCountryChanged: onCountryChanged,
          invalidNumberMessage: AppMessages.invalidMobile.message.tr(context),
          validator: (final PhoneNumber? value) {
            return validateMobileNumber(value)?.tr(context);
          },
          onChanged: onChange,
        ),
      ],
    );
  }
}
