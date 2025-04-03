import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project_structure/Utils/app_strings.dart';
import 'package:flutter_project_structure/Utils/utils.dart';
import 'package:flutter_project_structure/helper/extension/localization_extension.dart';
import 'package:flutter_project_structure/helper/extension/string_ext.dart';
import 'package:flutter_project_structure/helper/validator.dart';
import 'package:flutter_project_structure/theme/app_colors.dart';
import 'package:flutter_project_structure/theme/font_styles.dart';
import 'package:flutter_project_structure/utils/app_enums.dart';
import 'package:intl_phone_field/phone_number.dart';

class AppTextField extends StatelessWidget with Validator {
  final TextFieldTypes type;
  final String title;
  final TextEditingController? textEditingController;
  final String? initialValue;
  final String? strPrefixText;
  final List<TextInputFormatter>? inputFormatters;
  final String? hintText;
  final bool? showHeaderTitle;
  final String? strHeaderTitle;
  final Function(String?)? validator;
  final TextInputAction textInputAction;
  final FocusNode? nextFocusNode;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChange;

  const AppTextField(
      {super.key,
      required this.type,
      required this.title,
      this.textEditingController,
      this.strPrefixText = '',
      this.inputFormatters = const <TextInputFormatter>[],
      this.hintText,
      this.showHeaderTitle = true,
      this.strHeaderTitle = '',
      this.validator,
      required this.textInputAction,
      this.nextFocusNode,
      this.focusNode,
      this.initialValue,
      this.onChange});

  @override
  Widget build(final BuildContext buildContext) {
    final ValueNotifier<bool> isShow = ValueNotifier<bool>(false);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (showHeaderTitle ?? false) ...<Widget>[
          Text(
            strHeaderTitle ?? '',
            style: rubikW700.copyWith(fontSize: 14),
          ),
          10.height,
        ],
        ValueListenableBuilder<bool>(
            valueListenable: isShow,
            builder: (final BuildContext context, final bool value,
                final Widget? child) {
              return TextFormField(
                initialValue: initialValue ?? '',
                focusNode: this.focusNode,
                style: rubikW400.copyWith(fontSize: 14),
                controller: textEditingController,
                obscureText: type == TextFieldTypes.password && !isShow.value,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                maxLines: type == TextFieldTypes.multiline ? 5 : 1,
                inputFormatters: inputFormatters,
                textInputAction: textInputAction,
                keyboardType: (type == TextFieldTypes.number
                    ? TextInputType.number
                    : (type == TextFieldTypes.email
                        ? TextInputType.emailAddress
                        : TextInputType.text)),
                buildCounter: (final BuildContext context,
                    {final int? currentLength,
                    final bool? isFocused,
                    final int? maxLength}) {
                  return null;
                },
                onTap: () {
                  // Scrollable.ensureVisible(buildContext);
                },
                onChanged: onChange,
                onTapOutside: (final PointerDownEvent v) {
                  FocusScope.of(buildContext).unfocus();
                },
                onFieldSubmitted: (final value) {
                  if (nextFocusNode != null) {
                    FocusScope.of(context).requestFocus(nextFocusNode);
                  }
                },
                validator: (final String? value) {
                  if (validator != null) {
                    return validator?.call(value);
                  }
                  return _validateTextField(type, value, title, context, null);
                },
                decoration: InputDecoration(
                  errorStyle: TextStyle(color: AppColors.colorF92814),
                  hintText: hintText ??
                      AppStrings.enterTxt.tr(buildContext,
                          namedArgs: <String, String>{
                            'field_name': title.tr(buildContext).toLowerCase()
                          }),
                  hintStyle: rubikW400.copyWith(
                    color: AppColors.color808080,
                    fontSize: 14,
                  ),
                  prefixIcon: strPrefixText != ''
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  strPrefixText ?? '',
                                  style: rubikW400.copyWith(
                                    fontSize: 15,
                                  ),
                                )),
                          ],
                        )
                      : 10.width,
                  prefixIconConstraints: strPrefixText != ''
                      ? const BoxConstraints(minWidth: 30)
                      : const BoxConstraints(minWidth: 0),
                  // prefixStyle: const TextStyle(color: Colors.black),
                  suffixIcon: type == TextFieldTypes.password
                      ? GestureDetector(
                          onTap: () {
                            isShow.value = !isShow.value;
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Icon(
                              isShow.value
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: AppColors.color808080,
                            ),
                          ),
                        )
                      : 10.width,
                  focusedBorder: Utils.inputBorder(AppColors.color003366),
                  focusedErrorBorder: Utils.inputBorder(AppColors.colorF92814),
                  errorBorder: Utils.inputBorder(AppColors.colorF92814),
                  enabledBorder: Utils.inputBorder(AppColors.color808080),
                  contentPadding: EdgeInsets.zero,
                ),
              );
            }),
      ],
    );
  }

  String? _validateTextField(
      final TextFieldTypes type,
      final String? strValue,
      final String title,
      final BuildContext context,
      final PhoneNumber? phoneNumber) {
    switch (type) {
      case TextFieldTypes.email:
        return validateEmail(strValue!)?.tr(context);
      case TextFieldTypes.password:
        return validatePassword(strValue!)?.tr(context);
      case TextFieldTypes.number:
        break;

      default:
        if (!strValue.isNotNullAndEmpty()) {
          return title + ' is Required'.tr(context); //.toLowerCase();
        }
    }

    return null;
  }
}
