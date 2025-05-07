import 'package:flutter/material.dart';

import '../component/style_helper.dart';

class TextFieldHelperClass {

  static Widget customTextField({

    required TextEditingController controller,
    required String hintText,
    bool isPassword = false,
    bool isObscure = false,
    TextInputType inputType = TextInputType.text,
    required FormFieldValidator<String> validator,
    IconButton? suffixIcon,
    Color borderColor = Colors.grey,
    Color textFieldColor = Colors.transparent,
    double? borderRadius,
    Widget? prefix,
    Widget? prefixIcon
  }) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword ? isObscure : false,
      keyboardType: inputType,
      decoration: InputDecoration(
        prefix: prefix,
        prefixIcon: prefixIcon,
        fillColor: textFieldColor,
        filled: true,
        labelText: hintText,
        labelStyle: StyleHelper.labelStyleTextField,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor), // Focused border color
          borderRadius: BorderRadius.circular(borderRadius??5), // Using passed borderRadius
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor), // Focused error border color
          borderRadius: BorderRadius.circular(borderRadius??5),),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor), // Error border color
          borderRadius: BorderRadius.circular(borderRadius??5),),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor), // Enabled border color
          borderRadius: BorderRadius.circular(borderRadius??5),),
        suffixIcon: suffixIcon,
        contentPadding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 10.0),
        errorStyle: StyleHelper.errorStyleTextField,
      ),
      validator: validator,
    );
  }
}
