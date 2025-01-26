class AppRegex {
  AppRegex._();

  static bool isMobileNumberValid(String mobileNumber) {
    return RegExp(r"^[+]*[0-9]+").hasMatch(mobileNumber);
  }

  static final RegExp decimalZeroRegExp = RegExp(r'([.]*0)(?!.*\d)');
}
