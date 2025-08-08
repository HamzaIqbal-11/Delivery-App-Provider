import 'dart:developer';

import 'package:delivery_app/Constants/app_assets.dart';
import 'package:delivery_app/Constants/app_styles.dart';
import 'package:delivery_app/Widgets/CustomButtons.dart';
import 'package:delivery_app/Widgets/customLabelText.dart';
import 'package:delivery_app/Widgets/customTextEditingController.dart';
import 'package:delivery_app/controller/CustomController.dart';
import 'package:delivery_app/controller/onboardController.dart';
import 'package:delivery_app/controller/signInController.dart';
import 'package:delivery_app/main.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen>
    with SingleTickerProviderStateMixin {
  final customProvider = Provider.of<CustomController>(customContext!);
  final signInProvider = Provider.of<SignInController>(customContext!);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String emailError = '';
  String passError = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xff2A4BA0),
      appBar: AppBar(leading: backbutton(() {})),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 30.w, right: 30.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 20.h),
                    child: Text(
                      "Log in",
                      style: AppStyles.customBoldBlackColor,
                    ),
                  ),
                ),
                SizedBox(height: 50.h),

                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customLabelText("Your email"),
                      emailTextInput(
                        emailController,
                        customProvider.emailOnchange,
                        (value) {
                          emailError =
                              customProvider.validateEmail(value!) ?? '';
                        },

                        //(value) {},
                      ),
                      SizedBox(
                        child: Text(
                          emailError,
                          style: AppStyles.customRegularRedColor,
                        ),
                      ),
                      SizedBox(height: 50.h),
                      customLabelText("Password"),
                      passwordTextInput(
                        passwordController,
                        customProvider.passOnchange,
                        (value) {
                          passError =
                              customProvider.validatePassword(value!) ?? '';
                        },
                      ),
                      SizedBox(
                        child: Text(
                          passError,
                          style: AppStyles.customRegularRedColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: Text(
                    "Forgot password?",
                    style: AppStyles.customRegularBlueColor,
                  ),
                ),

                SizedBox(height: 130.h),
                SizedBox(
                  width: double.infinity,
                  child: customLoginButton(
                    'Log In',
                    customProvider.emailCheck,
                    customProvider.passCheck,
                    () {
                      if (_formKey.currentState!.validate()) {
                        print("helo");
                      }
                    },
                  ),
                ),
                SizedBox(height: 30.h),
                SizedBox(
                  width: double.infinity,
                  child: customGoogleButton('Sign In with Google', context),
                ),
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Dont have an account? ",
                      style: AppStyles.customRegularBlackColor,
                    ),
                    Text("Sign Up", style: AppStyles.customRegularBlueColor),
                  ],
                ),
                // Image.asset(
                //   AppAssets.logo,
                //   width: 100.w,
                //   height: 110.h,
                //   fit: BoxFit.cover,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
