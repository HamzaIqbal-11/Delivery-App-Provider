import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class CustomController extends ChangeNotifier {
  String _email = '';
  String _password = '';
  bool emailCheck = false;
  bool passCheck = false;

  String? emailErrorText;
  String? passErrorText;

  bool get isEmailValid => emailErrorText == null;
  bool get isPassValid => passErrorText == null;

  // Get current values (optional)
  String get email => _email;
  String get password => _password;

  void emailOnchange(String value) {
    if (value.isNotEmpty) {
      emailCheck = true;
    } else {
      emailCheck = false;
    }

    notifyListeners();
  }

  void passOnchange(String value) {
    if (value.isNotEmpty) {
      passCheck = true;
    } else {
      passCheck = false;
    }

    notifyListeners();
  }

  // bool validateForm() {
  //   emailErrorText = _validateEmail(_email);
  //   passErrorText = _validatePassword(_password);
  //   notifyListeners();
  //   return emailErrorText == null && passErrorText == null;
  // }

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'Email can\'t be empty';
    } else if (!EmailValidator.validate(value)) {
      return 'Email is not valid';
    }
    notifyListeners();
    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Password can\'t be empty';
    } else if (value.length < 6) {
      return 'Password is too short';
    }
    notifyListeners();
    return null;
  }
}
