import 'package:flutter/material.dart';

import '../component/style_helper.dart';

class TextFieldDoubleSizeHelperClass {
  static Widget customTextField({
    required TextEditingController controller,
    required String hintText,
    bool isPassword = false,
    bool isObscure = false,
    TextInputType inputType = TextInputType.text,
    required FormFieldValidator<String> validator,
    IconButton? suffixIcon,
  }) {
    return SizedBox(
      height: 100,
      child: TextFormField(
        controller: controller,
        obscureText: isPassword ? isObscure : false,
        keyboardType: inputType == TextInputType.text
            ? TextInputType.multiline // Allow multiline input if it's text
            : inputType,
        maxLines: 3,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          labelText: hintText,
          labelStyle: StyleHelper.labelStyleTextField,
          alignLabelWithHint: true, // Align label with hint to top
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          suffixIcon: suffixIcon,
          contentPadding: EdgeInsets.only(top:10.0, left: 10.0, right: 10.0), // Adjust padding for proper label positioning
          errorStyle: StyleHelper.errorStyleTextField,
        ),
        validator: validator,
      ),
    );
  }
}
