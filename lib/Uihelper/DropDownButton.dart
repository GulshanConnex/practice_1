
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DropDownButtonHelper {
  static Widget customDropdownButton({
    required RxString selectedValue,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Obx(() {
      return DropdownButton<String>(
        value: selectedValue.value,
        icon: Padding(
          padding: const EdgeInsets.all( 8.0),
          child: SvgPicture.asset("assets/icons/HomeScreen_dropDown_icons.svg"),
        ),
        alignment: Alignment.center,

        // elevation: 20,
        onChanged: onChanged,
        items: items
            .map<DropdownMenuItem<String>>((String  value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        underline: SizedBox.shrink(),
        iconEnabledColor: Colors.red,// Removes the border
      );
    });
  }
}















// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../Controller/HomeScreen_Controller.dart';  // Import the dropdown controller
//
// class DropDownButtonHelper {
//   static Widget customDropdownButton({
//     required RxString selectedValue,
//     required List<String> items,
//     required ValueChanged<String?> onChanged,
//   }) {
//     return Obx(() {
//       return DropdownButton<String>(
//         value: selectedValue.value,
//         // elevation: 20,
//         onChanged: onChanged,
//         items: items
//             .map<DropdownMenuItem<String>>((String value) {
//           return DropdownMenuItem<String>(
//             value: value,
//             child: Text(value),
//           );
//         }).toList(),
//         underline: SizedBox.shrink(),
//           iconEnabledColor: Colors.grey,// Removes the border
//       );
//     });
//   }
// }
