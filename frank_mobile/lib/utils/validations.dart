import 'package:flutter/foundation.dart' show immutable;

@immutable
class Validations {
  const Validations._();

  static normalValidation(
    dynamic value,
  ) {
    if (value == null || value.isEmpty) {
      return 'Required field';
    }
    return null;
  }

  static emailValidation(dynamic email) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",).hasMatch(email);

    if (email == null || email.isEmpty || !emailValid) {
     return 'Wrong email';
    }
    return null;
  }
}
