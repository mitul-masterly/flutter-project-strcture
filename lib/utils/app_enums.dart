enum AppButtonType { primary, secondary, thirdB }

enum TextFieldTypes { text, email, password, number, multiline }

enum SnackBarType { success, error, info }

enum AppMessages {
  emailRequired('Email is required'),
  invalidEmail('Please enter a valid email address.'),
  passwordRequired('Password is Required'),
  passwordLength('Password must be at least 6 characters'),
  confirmPasswordRequired('Confirm password is required'),
  confirmPasswordNotMatch('Confirm password does not match'),
  firstNameRequired('First Name is required'),
  mobileNumberRequired('Mobile Number is required'),
  invalidMobile('Enter Valid Mobile Number'),
  registrationSuccess('User registered successfully.'),
  networkError(
      'No internet connection. Please check your internet connection.');

  const AppMessages(this.message);

  final String message;
}

enum SupportedLangCode {
  english('en', 'US'),
  arabic('ar', 'IN');

  const SupportedLangCode(this.langCode, this.countryCode);

  final String langCode;
  final String countryCode;
}
