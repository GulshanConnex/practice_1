import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class SignInController extends GetxController {
  RxBool isObscureText = true.obs;
  RxBool isValidPhoneNumber = true.obs;
  RxBool isValidPassword = true.obs;
  var isLoading = false.obs;

  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();


}
















// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
//
// class SignInController extends GetxController{
//
//   RxBool isObscureText = true.obs;
//   RxBool isValidPhoneNumber = true.obs;
//   RxBool isValidPassword = true.obs;
//
//
//   final TextEditingController phoneNumberController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final formKey = GlobalKey<FormState>();
//
// }