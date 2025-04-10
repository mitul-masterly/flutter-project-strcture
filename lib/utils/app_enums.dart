enum AppButtonType { primary, secondary, thirdB }

enum TextFieldTypes { text, email, password, number, multiline }

enum SnackBarType { success, error, info }

enum AppMessages {
  somethingWentWrong('Something Went Wrong..!'),
  firstNameRequired('First Name is Required'),
  lastNameRequired('Last Name is Required'),
  emailRequired('Email is Required'),
  passwordRequired('Password is Required'),
  invalidEmail('Please enter a valid email address.'),
  passwordLength('Password must be at least 6 characters'),
  confirmPasswordRequired('Confirm password is Required'),
  confirmPasswordNotMatch('Confirm password does not match'),
  mobileNumberRequired('Mobile Number is Required'),
  invalidMobile('Invalid Mobile Number'),
  registrationSuccess('User registered successfully.'),
  networkError(
      'No internet connection. Please check your internet connection.'),
  securityQuestionRequired('Security Question required.'),
  securityAnswerRequired('Security Answer required.');

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

enum CommonScreenState {
  initial,
  loading,
  loaded,
  success,
  error,
}

enum SocialMediaLoginState { initial, google, facebook, apple, success, error }

enum Flavor { staging, prod }

enum CMSPage {
  terms('Terms and Conditions',
      'https://masterlysolutions.com/terms-and-conditions/'),
  policy(
      'Privacy Policy', 'https://masterlysolutions.com/terms-and-conditions/');

  const CMSPage(this.title, this.url);

  final String title;
  final String url;
}
