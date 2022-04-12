// import 'package:email_validator/email_validator.dart';

import 'strings.dart';

class Validator {
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return Strings.emailrequired;
    }
    // else if (!EmailValidator.validate(value)) {
    //   return Strings.emailInvalidd;
    // }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return Strings.passwordRequired;
    }
    return null;
  }

  bool isValidEmail(String text) => validateEmail(text) == null;

  bool isValidPassword(String text) => validatePassword(text) == null;
}
