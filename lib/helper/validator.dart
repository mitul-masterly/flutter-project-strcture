import 'package:flutter_project_structure/helper/extension/string_ext.dart';
import 'package:flutter_project_structure/helper/regex_helper.dart';
import 'package:flutter_project_structure/utils/app_enums.dart';
import 'package:intl_phone_field/phone_number.dart';

mixin Validator {
  // Email validation
  String? validateEmail(final String? value) {
    if (value == null || value.isEmpty) {
      return AppMessages.emailRequired.message;
    } else if (!RegexHelper.regexEmail.hasMatch(value)) {
      return AppMessages.invalidEmail.message;
    }
    return null;
  }

  // Password validation
  String? validatePassword(final String? value) {
    if (!value.isNotNullAndEmpty()) {
      return AppMessages.passwordRequired.message;
    } else if ((value?.length ?? 0) < 6) {
      return AppMessages.passwordLength.message;
    }
    return null;
  }

  // Confirm password validation
  String? validateConfirmPassword(final String? value, final String password) {
    if (value == null || value.isEmpty) {
      return AppMessages.confirmPasswordRequired.message;
    } else if (value != password) {
      return AppMessages.confirmPasswordNotMatch.message;
    }
    return null;
  }

  String? validateMobileNumber(final PhoneNumber? value) {
    if (value != null) {
      if (value.number.isEmpty) {
        return AppMessages.mobileNumberRequired.message;
      } else {
        try {
          final bool isValid = value.isValidNumber();
          if (!isValid) {
            return AppMessages.invalidMobile.message;
          }
        } catch (e) {
          return AppMessages.invalidMobile.message;
        }
        return AppMessages.invalidMobile.message;
      }
    }
    return null;
  }
}
