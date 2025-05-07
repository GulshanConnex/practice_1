
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../component/colors_helper.dart';
import '../component/style_helper.dart';

class ElevatedButtonHelperClass {
  static Widget customElevatedButton({
    required String text,
    required VoidCallback onPressed,
    Color color = Colors.blue,
    double height = 49.0,
    double fontSize = 18.0,
    FontWeight fontWeight = FontWeight.w500,
    bool useGradient = true,  // New parameter to control gradient
    Color textColor = Colors.white, // Default text color
    TextStyle? textStyle, // Optional text style
  }) {
    return Container(
      decoration: BoxDecoration(
        gradient: useGradient
            ? LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColor.elevatedButtonTopCenterBlue,
            AppColor.elevatedButtonBottomCenterBlue,
          ],
        )
            : null, // No gradient if useGradient is false
        color: !useGradient ? color : null, // Use solid color if no gradient
        borderRadius: BorderRadius.circular(10),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent, // Transparent to show the gradient or color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          minimumSize: Size(double.infinity, height),
          shadowColor: Colors.transparent, // Optional: remove shadow
        ),
        child: Text(
          text,
          style: textStyle ??
              StyleHelper.baseElevatedButtonTextStyle.copyWith(
                color: textColor,
                fontSize: fontSize,
                fontWeight: fontWeight,
              ),
        ),
      ),
    );
  } Future<void> signOutFromGoogle() async {
    try {
      // Sign out from GoogleSignIn
      await googleSignIn.signOut();

      // Sign out from FirebaseAuth
      await FirebaseAuth.instance.signOut();

      print("User signed out successfully.");
    } catch (e) {
      print("Error signing out: ${e.toString()}");
    }
  }

}

mixin googleSignIn {
  static signOut() {}
}























// import 'package:flutter/material.dart';
// import '../component/colors_helper.dart';
// import '../component/style_helper.dart';
//
// class ElevatedButtonHelperClass {
//   static Widget customElevatedButton({
//     required String text,
//     required VoidCallback onPressed,
//     Color color = Colors.blue,
//     double height = 49.0,
//     fontSize = 18.0,
//     fontWeight = FontWeight.w500,
//
//
//     bool useGradient = true,  // New parameter to control gradient
//   }) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: useGradient
//             ? LinearGradient(
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//           colors: [
//             AppColor.elevatedButtonBlueTopCenter,
//             AppColor.elevatedButtonBlueBottomCenter,
//           ],
//         )
//             : null, // No gradient if useGradient is false
//         color: !useGradient ? color : null, // Use solid color if no gradient
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: ElevatedButton(
//         onPressed: onPressed,
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.transparent, // Transparent to show the gradient or color
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//           minimumSize: Size(double.infinity, height),
//           shadowColor: Colors.transparent, // Optional: remove shadow
//         ),
//         child: Text(
//                  text,
//                       style:  StyleHelper.baseElevatedButtonTextStyle
//         ),
//       ),
//     );
//   }
// }
