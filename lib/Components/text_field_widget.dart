import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project_structure/Components/lable_widget.dart';
import 'package:flutter_project_structure/Utils/app_assets.dart';
import 'package:flutter_project_structure/Utils/constants.dart';
import 'package:flutter_project_structure/Utils/utils.dart';
import '../Utils/app_colors.dart';

import '../Utils/app_strings.dart';

class AppTextField extends StatelessWidget {
  final TextFieldTypes type;
  final String title;
  final TextEditingController textEditingController;
  final String? strPrefixText;
  final List<TextInputFormatter>? inputFormatters;
  final String? hintText;

  const AppTextField(
      {super.key,
      required this.type,
      required this.title,
      required this.textEditingController,
      this.strPrefixText = "",
      this.inputFormatters = const [],
      this.hintText});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isShow = ValueNotifier<bool>(false);

    return ValueListenableBuilder<bool>(
        valueListenable: isShow,
        builder: (context, value, child) {
          return TextFormField(
            style: TextStyle(
                fontSize: 14,
                fontFamily: AppFonts.rubikRegular,
                fontWeight: FontWeight.w400,
                color: AppColors.blackColor),
            controller: textEditingController,
            obscureText: type == TextFieldTypes.password && !isShow.value,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            maxLines: type == TextFieldTypes.multiline ? 5 : 1,
            inputFormatters: inputFormatters,
            keyboardType: (type == TextFieldTypes.number
                ? TextInputType.number
                : (type == TextFieldTypes.email
                    ? TextInputType.emailAddress
                    : TextInputType.text)),
            buildCounter: (BuildContext context,
                {int? currentLength, bool? isFocused, int? maxLength}) {
              return null;
            },
            onTap: () {
              Scrollable.ensureVisible(context);
            },
            onTapOutside: (v) {
              FocusScope.of(context).unfocus();
            },
            validator: (String? value) {
              return validateTextfield(type, value!, title);
            },
            decoration: InputDecoration(
              errorStyle: TextStyle(color: AppColors.redColor),
              hintText: hintText ?? AppStrings.enterTxt + title.toLowerCase(),
              hintStyle: TextStyle(
                  fontSize: 14,
                  fontFamily: AppFonts.rubikRegular,
                  fontWeight: FontWeight.w400,
                  color: AppColors.greyColor),
              prefixIcon: strPrefixText != ""
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: LabelWidget(
                              title: strPrefixText ?? "",
                              size: 15,
                              weight: FontWeight.normal,
                              color: AppColors.blackColor,
                            )),
                      ],
                    )
                  : 10.width,
              prefixIconConstraints: strPrefixText != ""
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
                          color: AppColors.greyColor,
                        ),
                      ),
                    )
                  : 10.width,
              focusedBorder: Utils.inputBorder(AppColors.primaryColor),
              focusedErrorBorder: Utils.inputBorder(AppColors.redColor),
              errorBorder: Utils.inputBorder(AppColors.redColor),
              enabledBorder: Utils.inputBorder(AppColors.greyColor),
              contentPadding: EdgeInsets.zero,
            ),
          );
        });
  }

  bool isValidPassword(String password) {
    // Regular expression to check for at least one letter, one number, and one special character
    String pattern = r'^(?=.*[a-zA-Z])(?=.*\d)(?=.*[\W_]).+$';
    RegExp regExp = RegExp(pattern);

    // Check if password meets the criteria
    return regExp.hasMatch(password);
  }

  validateTextfield(type, String strValue, title) {
    if (strValue.isEmpty) {
      return AppStrings.pleaseEnterValid + title.toLowerCase();
    }
    switch (type) {
      case TextFieldTypes.email:
        final emailRegex =
            RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
        if (!emailRegex.hasMatch(strValue)) {
          return AppStrings.pleaseEnterValidEmail;
        }
        break;
      case TextFieldTypes.password:
        // if (strValue.length < 7) {
        //   return AppStrings.requiredValidPsd;
        // }
        break;
      case TextFieldTypes.number:
        if (strValue.length != 14) {
          // return AppStrings.requiredValidContactNumber;
        }
        break;

      default:
        return null;
    }
  }
}
