class RegexHelper {
  static final RegExp regexEmail =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  static final RegExp regexDecimal = RegExp(r'^\d+\.?\d{0,2}'); //'[0-9.]');
  static final RegExp regexCountWord = RegExp(r'[\w-._]+');
  static final RegExp regexPassword = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~<=>^_{\}+,_.:;-]).{8,}$');
  static final RegExp nameRegex = RegExp('[a-zA-Z ]');
  static final RegExp mobileNumberRegex = RegExp(r'[0-9]');
}
