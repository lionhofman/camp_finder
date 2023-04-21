class CustomValidation {
  static bool hasNumbers(String text) {
    return text.contains(new RegExp(r'\d'));
  }

  static bool validateTwoWords(String text) {
    return text.trim().split(' ').length > 1;
  }

  static bool hasSpecialCharacters(String text) {
    return text.contains(new RegExp(r'[!@#$%^~&*(),.;?":{}|<>\[\]\/\\;`´=+]'));
  }

  static bool validateEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  static bool validatePassword(String password) {
    return password.length >= 6 && password.length <= 15;
  }

  static bool isNullOrWhiteSpace(String? str) {
    bool returnValue = true;
    if (str != null && str != "") {
      returnValue = false;
    }
    return returnValue;
  }
}
