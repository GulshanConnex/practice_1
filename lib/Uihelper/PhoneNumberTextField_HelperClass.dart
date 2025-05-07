import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../component/string_helper.dart';
import '../component/validation_helper.dart';



class PhoneNumberFormField {

  static FormField<PhoneNumber> customPhoneNumberField({
    required TextEditingController controller,
    required String initialCountryCode,
    required Function(String) onChanged,
  }) {
    return FormField<PhoneNumber>(
      validator: (phone) {
        return ValidationHelper.phoneValidator(phone);
      },
      builder: (FormFieldState<PhoneNumber> state) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25)
          ),
          child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IntlPhoneField(
                controller: controller,
                decoration: InputDecoration(
                  labelText: StringHelper.labelTextPhoneNumberTextField,
                  labelStyle: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w400),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
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
                  counterText: '',
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                ),
                initialCountryCode: initialCountryCode,
                onChanged: (phone) {
                  onChanged(phone.completeNumber); // Handle phone number change
                  state.didChange(phone); // Update form state with the phone number
                },
              ),
              if (state.hasError)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0,left: 10),
                  child: Text(
                    state.errorText ?? '',
                    style: TextStyle(color: Colors.red, fontSize: 12),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

















// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';
// import 'package:intl_phone_field/phone_number.dart';
// import 'package:untitled6767676/component/string_helper.dart';
//
// import '../component/validation_helper.dart';
//
//
//
// class PhoneNumberFormField {
//
//   static FormField<PhoneNumber> customPhoneNumberField({
//     required TextEditingController controller,
//     required String initialCountryCode,
//     required Function(String) onChanged,
//   }) {
//     return FormField<PhoneNumber>(
//       validator: (phone) {
//         return ValidationHelper.phoneValidator(phone);
//       },
//       builder: (FormFieldState<PhoneNumber> state) {
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             IntlPhoneField(
//               controller: controller,
//               decoration: InputDecoration(
//                 labelText: StringHelper.labelTextPhoneNumberTextField,
//                 labelStyle: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w400),
//                 border: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.grey),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.grey),
//                 ),
//                 focusedErrorBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.grey),
//                 ),
//                 errorBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.grey),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.grey),
//                 ),
//                 counterText: '',
//                 contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
//               ),
//               initialCountryCode: initialCountryCode,
//               onChanged: (phone) {
//                 onChanged(phone.completeNumber); // Handle phone number change
//                 state.didChange(phone); // Update form state with the phone number
//               },
//             ),
//             if (state.hasError)
//               Padding(
//                 padding: const EdgeInsets.only(top: 8.0,left: 10),
//                 child: Text(
//                   state.errorText ?? '',
//                   style: TextStyle(color: Colors.red, fontSize: 12),
//                 ),
//               ),
//           ],
//         );
//       },
//     );
//   }
// }