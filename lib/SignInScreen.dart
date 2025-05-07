import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'SignIn_Controller.dart';
import 'Uihelper/InkWellButton_HelperClass.dart';
import 'Uihelper/elevatedButton_HelperClass.dart';
import 'Uihelper/simole.dart';
import 'Uihelper/textButton_HelperClass.dart';
import 'Uihelper/textField_HelperClass.dart';
import 'component/colors_helper.dart';
import 'component/imagePath_helper.dart';
import 'component/string_helper.dart';
import 'component/style_helper.dart';
import 'component/validation_helper.dart';


class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final SignInController signInController = Get.put(SignInController());
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.95,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: Form(
                  key: signInController.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 150),
                      SvgPicture.asset(AppImagePath.image),
                      SizedBox(height: 40),
                      Text(
                        StringHelper.inkWellButtonSignIn,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        StringHelper.fillTheFollowingToLogIntoYourAccount,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFieldHelperClass.customTextField(
                        controller: signInController.phoneNumberController,
                        hintText: StringHelper.labelTextPhoneNumberTextField,
                        inputType: TextInputType.phone,
                        validator: (value) => ValidationHelper.userNameValidator(value),
                      ),
                      SizedBox(height: 20),
                      Obx(() {
                        return TextFieldHelperClass.customTextField(
                          controller: signInController.passwordController,
                          hintText: StringHelper.passwordTextField,
                          isPassword: true,
                          isObscure: signInController.isObscureText.value,
                          inputType: TextInputType.text,
                          validator: (value) => ValidationHelper.passwordValidator(value),
                          suffixIcon: IconButton(
                            icon: Icon(
                              signInController.isObscureText.value ? Icons.visibility_off : Icons.visibility,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              signInController.isObscureText.value = !signInController.isObscureText.value;
                            },
                          ),
                        );
                      }),
                      SizedBox(height: 7),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWellButtonHelperClass.customTextLink(
                          text: StringHelper.inkWellButtonForgotPassword,
                          decoration: TextDecoration.underline,
                          fontSize: 12.0,
                          onTap: () {
                            // Handle Forgot Password action
                          },
                        ),
                      ),
                      SizedBox(height: 17),
                      ElevatedButtonHelperClass.customElevatedButton(
                        text: StringHelper.elevatedButtonSignIn,
                        onPressed: () {
                          if (signInController.formKey.currentState?.validate() ?? false) {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Simole()));
                          }
                        },
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 1,
                            width: MediaQuery.of(context).size.width * 0.3,
                            color: AppColor.containerColorGrey,
                          ),
                          Text(
                            StringHelper.textOrLoginWith,
                            style: StyleHelper.baseElevatedButtonText
                          ),
                          Container(
                            height: 1,
                            width: MediaQuery.of(context).size.width * 0.3,
                            color: AppColor.containerColorGrey,
                          ),
                        ],
                      ),
                     SizedBox(height: 10,),
                      TextButtonHelperClass.customTextButton(
                        text: StringHelper.textButtonSignInWithGoogleSignInScreen,
                        borderColor: AppColor.tetButtonColorGrey,
                        onPressed: () async {
                          final currentUser = FirebaseAuth.instance.currentUser;
                          print("ererrerere");
              
                          if (currentUser != null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('User already logged in as ${currentUser.displayName}'),
                                duration: Duration(seconds: 2),
                              ),
              
              
                            );
                            return;
                          }
              
                        signInController.isLoading.value = true;
              
                          bool isLogged = await login();
              
                          signInController.isLoading.value = false;
              
                          if (isLogged) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Google Sign-In Successful!'),
                                duration: Duration(seconds: 2),
                              ),
                            );
              
                            Future.delayed(Duration(seconds: 2), () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Simole()),
                              );
                            });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Sign-In cancelled or failed'),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          }
                        },
                      ),
                     Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(StringHelper.dontHaveAnAccount),
                          SizedBox(width: 3),
                          InkWellButtonHelperClass.customTextLink(
                            text: StringHelper.inkWellButtonSignUp,
                            textColor: AppColor.inkWellButtonColorBlue,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.0,
                            onTap: () {
                              // Handle Sign Up action
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),

  ///// loader for full screen ////////
            Obx(() {
              return signInController.isLoading.value
                  ? Container(
                color: Colors.black.withOpacity(0.5),
                child: const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                ),
              )
                  : const SizedBox.shrink();
            }),

          ],
        ),
      ),
    );
  }

  Future<bool> login() async {
    final googleSignIn = GoogleSignIn();
    final user = await googleSignIn.signIn();

    if (user == null) {
      return false;
    }

    final userAuth = await user.authentication;

    final credential = GoogleAuthProvider.credential(
      idToken: userAuth.idToken,
      accessToken: userAuth.accessToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);

    return FirebaseAuth.instance.currentUser != null;
  }
}


















//
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:stayeszy/ui/HomeScreen.dart';
//
// import '../BottomNAvigationHoneScreen/BottomNAvigationHomeScreen.dart';
// import '../Controller/SignIn_Controller.dart';
// import '../Uihelper/InkWellButton_HelperClass.dart';
// import '../Uihelper/TextField_HelperClass.dart';
// import '../Uihelper/elevatedButton_HelperClass.dart';
// import '../Uihelper/textButton_HelperClass.dart';
// import '../component/colors_helper.dart';
// import '../component/imagePath_helper.dart';
// import '../component/string_helper.dart';
// import '../component/validation_helper.dart';
//
// class SignIn extends StatelessWidget {
//   const SignIn({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final SignInController signInController = Get.put(SignInController());
//     return Scaffold(
//       backgroundColor: Colors.white,
//       resizeToAvoidBottomInset: true,
//       body: SafeArea(
//         child: Container(
//           height: MediaQuery.of(context).size.height * 0.95,
//           width: MediaQuery.of(context).size.width,
//           padding: EdgeInsets.symmetric(horizontal: 18),
//           child: Form(
//             key: signInController.formKey,
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(height: 150),
//                   SvgPicture.asset(AppImagePath.image),
//                   SizedBox(height: 40),
//                   Text(StringHelper.inkWellButtonSignIn,
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 20,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                   SizedBox(height: 5),
//                   Text(StringHelper.fillTheFollowingToLogIntoYourAccount,
//                     style: TextStyle(
//                       fontSize: 12,
//                       fontWeight: FontWeight.w400,
//                       color: Colors.grey,
//                     ),
//                   ),
//
//                   // Phone number TextField using OneUIHelper
//                   SizedBox(height: 20),
//                   TextFieldHelperClass.customTextField(
//                     // borderRadius: 10,
//                     controller: signInController.phoneNumberController,
//                     hintText: StringHelper.labelTextPhoneNumberTextField,
//                     inputType: TextInputType.phone,
//                     validator: (value) => ValidationHelper.userNameValidator(value),
//                   ),
//
//                   SizedBox(height: 20),
//
//                   // Password TextField with visibility toggle
//                   Obx(() {
//                     return TextFieldHelperClass.customTextField(
//                       controller: signInController.passwordController,
//                       // borderRadius: 10,
//                       hintText: StringHelper.passwordTextField,
//                       isPassword: true,
//                       isObscure: signInController.isObscureText.value,
//                       inputType: TextInputType.text,
//                       validator: (value) => ValidationHelper.passwordValidator(value),
//                       suffixIcon: IconButton(
//                         icon: Icon(
//                           signInController.isObscureText.value ? Icons.visibility_off : Icons.visibility,
//                           color: Colors.black,
//                         ),
//                         onPressed: () {
//                           signInController.isObscureText.value = !signInController.isObscureText.value;
//                         },
//                       ),
//                     );
//                   }),
//
//                   SizedBox(height: 7),
//                   Align(
//                     alignment: Alignment.centerRight,
//                     child: InkWellButtonHelperClass.customTextLink(
//                       text: StringHelper.inkWellButtonForgotPassword,
//                       decoration: TextDecoration.underline,
//                       fontSize: 12.0,
//                       onTap: () {
//                         // Handle Forgot Password action
//                       },
//                     ),
//                   ),
//
//                   SizedBox(height: 17),
//                   ElevatedButtonHelperClass.customElevatedButton(
//                     text: StringHelper.elevatedButtonSignIn,
//                     onPressed: () {
//                       if (signInController.formKey.currentState?.validate() ?? false) {
//                         Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavigationHomeScreen()));
//                       }
//                     },
//                   ),
//
//                   SizedBox(height: 15),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Container(height: 1, width: MediaQuery.of(context).size.width * 0.3, color: AppColor.containerColorGrey),
//                       Text(StringHelper.textOrLoginWith, style: TextStyle(color: AppColor.textColorGrey, fontSize: 14, fontWeight: FontWeight.w400)),
//                       Container(height: 1, width: MediaQuery.of(context).size.width * 0.3, color: AppColor.containerColorGrey),
//                     ],
//                   ),
//
//                   TextButtonHelperClass.customTextButton(
//                     text: StringHelper.textButtonSignInWithGoogleSignInScreen,
//                     borderColor: AppColor.tetButtonColorGrey,
//                       onPressed: () async {
//                         final currentUser = FirebaseAuth.instance.currentUser;
//
//                         if (currentUser != null) {
//                           // User already logged in
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(
//                               content: Text('User already logged in as ${currentUser.displayName}'),
//                               duration: Duration(seconds: 2),
//                             ),
//                           );
//                           return;
//                         }
//
//                         // If not logged in, proceed with Google Sign-In
//                         bool isLogged = await login();
//
//                         if (isLogged) {
//                           // Show success SnackBar
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(
//                               content: Text('Google Sign-In Successful!'),
//                               duration: Duration(seconds: 2),
//                             ),
//                           );
//
//                           // Navigate after short delay
//                           Future.delayed(Duration(seconds: 2), () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(builder: (context) => BottomNavigationHomeScreen()),
//                             );
//                           });
//                         } else {
//                           // Show failure/cancel Snackbar
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(
//                               content: Text('Sign-In cancelled or failed'),
//                               duration: Duration(seconds: 2),
//                             ),
//                           );
//                         }
//                       }),
//
//
//
//
//
//
//                       // SizedBox(height: 18),
//                   // TextButtonHelperClass.customTextButton(
//                   //   text: StringHelper.textButtonSignInWithGoogleSignInScreen,
//                   //   borderColor: AppColor.tetButtonColorGrey,
//                   //   onPressed: () {},
//                   //   svgIconPath: AppImagePath.googleIcon,
//                   //   height: 44,
//                   // ),
//
//                   // Spacer widget to push bottom elements to the bottom of the screen
//                   // Spacer(),
//
//                   SizedBox(height: MediaQuery.of(context).size.height*.1),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(StringHelper.dontHaveAnAccount),
//                       SizedBox(width: 3),
//                       InkWellButtonHelperClass.customTextLink(
//                         text: StringHelper.inkWellButtonSignUp,
//                         textColor: AppColor.inkWellButtonColorBlue,
//                         fontWeight: FontWeight.w600,
//                         fontSize: 14.0,
//                         onTap: () {
//                           // Handle Sign Up action
//                         },
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 10,)
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Future<bool> login() async {
//     final googleSignIn = GoogleSignIn();
//     final user = await googleSignIn.signIn();
//
//     if (user == null) {
//       // User cancelled the login
//       return false;
//     }
//     // final User = FirebaseAuth.instance.currentUser;
//     final userAuth = await user.authentication;
//
//     final credential = GoogleAuthProvider.credential(
//       idToken: userAuth.idToken,
//       accessToken: userAuth.accessToken,
//     );
//
//     await FirebaseAuth.instance.signInWithCredential(credential);
//
//     return FirebaseAuth.instance.currentUser != null;
//   }
// }
















// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:stayeszy/ui/HomeScreen.dart';
//
// import '../BottomNAvigationHoneScreen/BottomNAvigationHomeScreen.dart';
// import '../Controller/SignIn_Controller.dart';
// import '../Uihelper/InkWellButton_HelperClass.dart';
// import '../Uihelper/TextField_HelperClass.dart';
// import '../Uihelper/elevatedButton_HelperClass.dart';
// import '../Uihelper/textButton_HelperClass.dart';
// import '../component/colors_helper.dart';
// import '../component/imagePath_helper.dart';
// import '../component/string_helper.dart';
// import '../component/validation_helper.dart';
//
// class SignIn extends StatefulWidget {
//   const SignIn({super.key});
//
//   @override
//   State<SignIn> createState() => _SignInState();
// }
//
// class _SignInState extends State<SignIn> {
//   @override
//   Widget build(BuildContext context) {
//     final SignInController signInController = Get.put(SignInController());
//     return Scaffold(
//       backgroundColor: Colors.white,
//       resizeToAvoidBottomInset: true,
//       body: SafeArea(
//         child: Container(
//           height: MediaQuery.of(context).size.height * 0.95,
//           width: MediaQuery.of(context).size.width,
//           padding: EdgeInsets.symmetric(horizontal: 18),
//           child: Form(
//             key: signInController.formKey,
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(height: 150),
//                   SvgPicture.asset(AppImagePath.image),
//                   SizedBox(height: 40),
//                   Text(StringHelper.inkWellButtonSignIn,
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 20,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                   SizedBox(height: 5),
//                   Text(StringHelper.fillTheFollowingToLogIntoYourAccount,
//                     style: TextStyle(
//                       fontSize: 12,
//                       fontWeight: FontWeight.w400,
//                       color: Colors.grey,
//                     ),
//                   ),
//
//                   // Phone number TextField using OneUIHelper
//                   SizedBox(height: 20),
//                   TextFieldHelperClass.customTextField(
//                     // borderRadius: 10,
//                     controller: signInController.phoneNumberController,
//                     hintText: StringHelper.labelTextPhoneNumberTextField,
//                     inputType: TextInputType.phone,
//                     validator: (value) => ValidationHelper.userNameValidator(value),
//                   ),
//
//                   SizedBox(height: 20),
//
//                   // Password TextField with visibility toggle
//                   Obx(() {
//                     return TextFieldHelperClass.customTextField(
//                       controller: signInController.passwordController,
//                       // borderRadius: 10,
//                       hintText: StringHelper.passwordTextField,
//                       isPassword: true,
//                       isObscure: signInController.isObscureText.value,
//                       inputType: TextInputType.text,
//                       validator: (value) => ValidationHelper.passwordValidator(value),
//                       suffixIcon: IconButton(
//                         icon: Icon(
//                           signInController.isObscureText.value ? Icons.visibility_off : Icons.visibility,
//                           color: Colors.black,
//                         ),
//                         onPressed: () {
//                           signInController.isObscureText.value = !signInController.isObscureText.value;
//                         },
//                       ),
//                     );
//                   }),
//
//                   SizedBox(height: 7),
//                   Align(
//                     alignment: Alignment.centerRight,
//                     child: InkWellButtonHelperClass.customTextLink(
//                       text: StringHelper.inkWellButtonForgotPassword,
//                       decoration: TextDecoration.underline,
//                       fontSize: 12.0,
//                       onTap: () {
//                         // Handle Forgot Password action
//                       },
//                     ),
//                   ),
//
//                   SizedBox(height: 17),
//                   ElevatedButtonHelperClass.customElevatedButton(
//                     text: StringHelper.elevatedButtonSignIn,
//                     onPressed: () {
//                       if (signInController.formKey.currentState?.validate() ?? false) {
//                         Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavigationHomeScreen()));
//                       }
//                     },
//                   ),
//
//                   SizedBox(height: 15),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Container(height: 1, width: MediaQuery.of(context).size.width * 0.3, color: AppColor.containerColorGrey),
//                       Text(StringHelper.textOrLoginWith, style: TextStyle(color: AppColor.textColorGrey, fontSize: 14, fontWeight: FontWeight.w400)),
//                       Container(height: 1, width: MediaQuery.of(context).size.width * 0.3, color: AppColor.containerColorGrey),
//                     ],
//                   ),
//
//                   TextButtonHelperClass.customTextButton(
//                       text: StringHelper.textButtonSignInWithGoogleSignInScreen,
//                       borderColor: AppColor.tetButtonColorGrey,
//                       onPressed: () async {
//                         bool isLogged = await login();
//                         if (isLogged) {
//                           // Snackbar message
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(
//                               content: Text('Login Successful!'),
//                               duration: Duration(seconds: 2), // kitni der dikhega
//                             ),
//                           );}}),
//
//
//
//
//
//
//                   // SizedBox(height: 18),
//                   // TextButtonHelperClass.customTextButton(
//                   //   text: StringHelper.textButtonSignInWithGoogleSignInScreen,
//                   //   borderColor: AppColor.tetButtonColorGrey,
//                   //   onPressed: () {},
//                   //   svgIconPath: AppImagePath.googleIcon,
//                   //   height: 44,
//                   // ),
//
//                   // Spacer widget to push bottom elements to the bottom of the screen
//                   // Spacer(),
//
//                   SizedBox(height: MediaQuery.of(context).size.height*.1),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(StringHelper.dontHaveAnAccount),
//                       SizedBox(width: 3),
//                       InkWellButtonHelperClass.customTextLink(
//                         text: StringHelper.inkWellButtonSignUp,
//                         textColor: AppColor.inkWellButtonColorBlue,
//                         fontWeight: FontWeight.w600,
//                         fontSize: 14.0,
//                         onTap: () {
//                           // Handle Sign Up action
//                         },
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 10,)
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Future<bool> login()async{
//     final user = await GoogleSignIn().signIn();
//     GoogleSignInAuthentication userAuth = await user!.authentication;
//     var credential = GoogleAuthProvider.credential(idToken: userAuth.idToken,accessToken: userAuth.accessToken);
//
//     FirebaseAuth.instance.signInWithCredential(credential);
//     return FirebaseAuth.instance.currentUser != null;
//   }
// }























