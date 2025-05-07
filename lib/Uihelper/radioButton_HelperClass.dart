import 'package:flutter/material.dart';

class RadioButtonHelperClass {
  static Widget customRadioButton({
    required String value,
    required String? groupValue, // Make groupValue nullable
    required ValueChanged<String?> onChanged,
    required String label,
    required Color activeColor,
    required Color inactiveColor,
    double? width, // Add width as an optional parameter
  }) {
    return GestureDetector(
      onTap: () {
        onChanged(value);
      },
      child: Container(
        width: width ?? double.infinity,
        // Use width if provided, otherwise use infinity
        height: 32,
        decoration: BoxDecoration(
          border: Border.all(
            color: groupValue == value ? activeColor : inactiveColor,
          ),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          // Ensure left alignment
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              child: SizedBox(
                height: 16,
                width: 16,
                // color: Colors.blueAccent,
                  child: Radio<String>(
                    value: value,
                    groupValue: groupValue,
                    onChanged: onChanged,
                    fillColor: WidgetStateProperty.resolveWith<Color>(
                        (Set<WidgetState> states) {

                    return groupValue == value ? activeColor : inactiveColor;
                    }),
                    //  activeColor: groupValue == value ? activeColor : inactiveColor,
                  ),
              ),
            ),
            Text(
              label,
              style: TextStyle(
                color: groupValue == value ? activeColor : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
//
// class RadioButtonHelperClass {
//   static Widget customRadioButton({
//     required String value,
//     required String? groupValue, // Make groupValue nullable
//     required ValueChanged<String?> onChanged,
//     required String label,
//     required Color activeColor,
//     required Color inactiveColor,
//   }) {
//     return GestureDetector(
//       onTap: () {
//         // Trigger the onChanged function when the container is tapped
//         onChanged(value);
//       },
//       child: Container(
//         height: 30,
//         decoration: BoxDecoration(
//           border: Border.all(
//             color: groupValue == value ? activeColor : inactiveColor,
//           ),
//           borderRadius: BorderRadius.circular(5.0),
//         ),
//         padding: EdgeInsets.only(right: 10.0),
//         child: Row(
//           children: [
//             Radio<String>(
//               value: value,
//               groupValue: groupValue, // Pass the nullable groupValue
//               onChanged: onChanged,
//               activeColor: groupValue == value ? activeColor : inactiveColor,
//             ),
//             Text(
//               label,
//               style: TextStyle(
//                 color: groupValue == value ? activeColor : Colors.black,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
