import 'package:intl_phone_field/phone_number.dart';

class ValidationHelper {

  static String? phoneValidator(PhoneNumber? phone) {
    if (phone == null || phone.completeNumber.isEmpty) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  static String? userNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter FullName';
    }
    if (value.startsWith(' ')) {
      return 'User name should not contain spaces at the first position';
    }
    return null;
  }

  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a email';
    }
    final emailRegex = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");

    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
     if (value.length < 6) {
      return 'Password should be at least 6 characters long';
    }
    return null;
  }

  static String? confirmPasswordValidator(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return 'Please enter your confirm  password';
    }
    if (value != password) {
      return 'Passwords do not match';
    }
    if (value.length < 6) {
      return 'Password should be at least 6 characters long';
    }
    return null;
  }
  // static String? phoneNumberValidator(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Please enter the phoneNumber';
  //   }
  //   return null;
  // }

  static String? aboutTextValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the text';
    }
    return null;
  }
}